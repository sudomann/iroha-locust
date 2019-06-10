# iroha-locust
Distributed Locust swarm against an Iroha network

This is currently very simple, to verify it can work; pending addition of more robust transaction types to test against the network

## To build manually:
```
git clone https://github.com/sudomann/iroha-locust
cd iroha-locus
git submodule update --init --recursive
docker build -t iroha-locust .
```

## To deploy in Kubernetes
- Edit `kubernetes/locust-configmap.yml` to update `ATTACKED_HOST` value.
- If you want to add additonal tasks for Locust, edit the python code in `kubernetes/locust-script-configmap.yml`. See [official Locust docs](https://docs.locust.io/en/stable/writing-a-locustfile.html) for more info on writing a locustfile.
```
cd kubernetes
kubectl apply -f locust-configmap.yml -f locust-script-configmap.yml  -f locust-master.yml -f locust-service.yml -f locust-slave.yml -f locust-ingress.yml
```

**NOTES**
- Working version of files the submodule dependency is pointing at:
```
$ git checkout --detach master
HEAD is now at 28b3b3998 RC4 Hotfix 1 - TemporaryWsv deadlock, checkTxPresence performance (#2140)
Your branch is up to date with 'origin/master'.
```