job "queerdevs-site" {
  region      = "global"
  datacenters = ["dc1"]
  type        = "service"

  group "queerdevs-site" {
    count = 2

    network {
      port "http" {
        to = 8000
      }
    }

    task "webserver" {
      driver = "docker"

      env {
        // Hack to force Nomad to re-deploy the service
        // instead of ignoring it
        COMMIT_SHA = "${DRONE_COMMIT_SHA}"
      }

      config {
        image   = "gitea.elara.ws/elara6331/webserver:latest"
        ports   = ["http"]
        volumes = ["local/site/public:/html:ro"]
      }

      artifact {
        source      = "https://api.minio.elara.ws/queerdevs/site.tar.gz"
        destination = "local/site"
      }

      service {
        name = "queerdevs-site"
        port = "http"

        tags = [
          "traefik.enable=true",

          "traefik.http.middlewares.queerdevs-site.redirectRegex.regex=^https://www\\.queerdevs\\.org",
          "traefik.http.middlewares.queerdevs-site.redirectRegex.replacement=https://queerdevs.org",
          "traefik.http.middlewares.queerdevs-site.redirectRegex.permanent=true",

          "traefik.http.routers.site.rule=Host(`queerdevs.org`) || Host(`www.queerdevs.org`)",
          "traefik.http.routers.site.middlewares=queerdevs-site-redir",
          "traefik.http.routers.site.tls.certResolver=letsencrypt",
        ]
      }
    }
  }
}
