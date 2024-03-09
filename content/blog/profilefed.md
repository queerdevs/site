+++
title = "Introducing ProfileFed!"
summary = "A simple, lightweight federation protocol for user profiles."
date = "2024-03-08"
tags = ["profilefed", "federation", "pronouns"]
+++

## Introduction

[ProfileFed](https://gitea.elara.ws/queerdevs/profilefed) is a simple, lightweight federation protocol for platforms that host user profiles. It allows platforms to specify any arbitrary data for their profiles, making it very flexible. The entire spec fits within a README file.

## Why?

There are already lots of federation protocols, including standardized ones like ActivityPub, so why build a custom protocol?

If you've ever worked with ActivityPub, you'll know that it's a really complex protocol. It's meant to represent "actors" that can perform "activities". This is great for platforms like Lemmy or Akkoma, which fit nicely within that model, but it's completely overkill for a platform that's simply hosting user profiles, without any activities to be performed.

The [specification](https://www.w3.org/TR/activitypub/) for ActivityPub is a long document that includes lots of stuff that simply isn't needed for mostly static profiles, whereas ProfileFed's entire spec fits inside one [README file](https://gitea.elara.ws/queerdevs/profilefed/src/branch/master/README.md).

## Where will it be used?

We created ProfileFed to use it with our upcoming Pronouns project, which will provide a safe space for queer people to express their identities. We decided to make Pronouns federated, and explored the vast number of already-made federation protocols, but we found that none of them suited our needs. They were either too complex, didn't allow arbitrary data, or just didn't map well to the way our data was structured. ProfileFed aims to be the protocol that we were missing.
