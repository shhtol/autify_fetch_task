# Backend Engineer Take Home Test

A command line program that can fetch web pages and saves them to disk for later retrieval and browsing.

Database is [SQLite](https://www.sqlite.org/docs.html)

Main CLI Ruby Gem is [Commander](https://github.com/commander-rb/commander)

## Setup

Build a Docker image with tag:

```console
docker build -t audity_test .
```

To fetch a website url execute:

```console
docker run -v $(pwd):/fetch audity_test https://www.google.com
```
You can pass as many urls as you want:

```console
docker run -v $(pwd):/fetch audity_test https://www.google.com https://autify.com
```

To get metadata from database execute:

```console
docker run -v $(pwd):/fetch audity_test --metadata https://www.google.com
```