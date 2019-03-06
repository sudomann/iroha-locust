# iroha-locust
Distributed Locust swarm against an Iroha network


## To build manually:
```
git clone https://github.com/sudomann/iroha-locust
cd iroha-locus
git submodule update --init --recursive
docker build -t iroha-locust .
```


**NOTES**
- Working version of files the submodule dependency is pointing at:
```
$ git checkout --detach master
HEAD is now at 28b3b3998 RC4 Hotfix 1 - TemporaryWsv deadlock, checkTxPresence performance (#2140)
Your branch is up to date with 'origin/master'.
```
- The `*.alternate` file variants are not used, but available as a build alternative to anyone interested in this