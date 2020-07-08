# Notes

1. Start up the examples:

    ```bash
    kctx minikube
    kubectl create ns guild
    kns guild
    mfa 123456 --k8s
    k apply -f buddies.yml
    ```

1. behavior

```bash
$ k get svc
NAME    TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
alice   NodePort   10.108.156.105   <none>        80:32668/TCP   13m
bob     NodePort   10.100.72.132    <none>        80:30911/TCP   13m

$ curl -s localhost:32668/ | jq
{
  "hostname": "alice-6b84c5897-w8twv"
}

$ curl -s localhost:32668/buddy | jq
{
  "buddy": {
    "hostname": "bob-57dd69c75-rczsc"
  },
  "me": "alice-6b84c5897-w8twv"
}
```

1. Guided tour of `buddies.yml`
    1. Service
    1. Deployment
    1. How are they related?
    1. Container, Environment, Health

1. start a diagnostic container

    ```bash
    k run -it ubuntu --image=tutum/dnsutils -- sh
    ```

1. explore the new namespace from the inside

    ```bash
    $ k exec -it ubuntu -- bash

    root@ubuntu:/# nslookup alice
    Server:		10.96.0.10
    Address:	10.96.0.10#53

    Name:	alice.guild.svc.cluster.local
    Address: 10.109.155.162

    root@ubuntu:/# nslookup bob
    Server:		10.96.0.10
    Address:	10.96.0.10#53

    Name:	bob.guild.svc.cluster.local
    Address: 10.102.139.11
    ```

1. point out that the specification is available:

    ```bash
    k get pod alice-6b84c5897-w8twv -o=yaml
    ```

