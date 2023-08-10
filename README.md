# postgres-bigm

Forked from [https://hub.docker.com/r/kazaoki/postgres-bigm](https://hub.docker.com/r/kazaoki/postgres-bigm/)

Base image from posrgres 15.3 with extensions pg_bigm.
You can find detail postgres options and config in [postgres official docker page](https://hub.docker.com/_/postgres).

## how to run

```
$ docker run -d --env POSTGRES_PASSWORD=postgres -p 5432:5432 devsejong/postgres-bigm:15.3
```
