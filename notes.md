# Notes

1. Start up the examples:

    ```bash
    kctx minikube
    kns guild
    k apply -f buddies.yml
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
    k get pod alice -o=yaml
    ```

