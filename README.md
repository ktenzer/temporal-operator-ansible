# Temporal Operator
![Temporal](image/temporal-logo.png)
Deploys an instance of Temporal in a given namespace. This operator should at this point be considered alpha. The goal of this operator it to only deploy required Temporal services. Dependencies like database, elasticsearch, prometheus and grafana should all be deployed separately. The operator customresource spec allows for connecting Temporal to the mentioned shared dependencies. Temporal supports native MySQL, PostgreSQL and Cassandra.

## Quick Start
Download [operator-sdk](https://sdk.operatorframework.io/docs/installation/)

Install Operator Lifecycle Manager on Kubernetes
<pre>
$ curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.22.0/install.sh | bash -s v0.22.0
</pre>

Deploy the Temporal Operator Bundle
<pre>
$ operator-sdk run bundle -n operators docker.io/ktenzer/temporal-operator-bundle:v0.1.0
</pre>

Create Temporal namespace
<pre>
$ kubectl create ns temporal
</pre>

Deploy Temporal via the operator by creating customresource
<pre>
$ vi temporal.yaml
apiVersion: temporal.io/v1
kind: Temporal
metadata:
  name: temporal
spec:
  instance_name: temporal
  num_shards: 512
  prometheus_port: 9090
  db_password: mypassword
  external_db:
    enable: false
    db_host:
    db_port:
    db_user:
    driver_name:
    plugin_name:
  web:
    enable: true
  frontend:
    enable: true
  history:
    enable: true
  matching:
    enable: true
  worker:
    enable: true
  elastic:
    enable: false
    host: 
    port:
    user:
    password:
</pre>

<pre>
$ kubectl create -f temporal.yaml -n temporal
</pre>
