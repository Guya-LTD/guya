# Guya
Guya E-commerce &amp; Guya Express Microservice


chmod 700 get_helm.sh


kubectl create -f namespaces.yml

## Monitoring

### Edit Prometheus service

Since prometheus & grafana services are available within a cluster (ClusterIP is the default Kubernetes service), therefore they can not be accessed outside of cluster.

In order to access the web GUI from outside of cluster, on our local machine we need to change default ClusterIP services to NodePort (Kubernetes transparently routes incoming traffic on the NodePort to your service).


```bash
$ export EDITOR=vim

$ kubectl edit -n guya-ltd-monitoring service/prometheus-operator-{randNum}-prometheus
```

and change `type: ClusterIp` to `type: NodePort`

## REST API Guideline

### Pagination

| Name | Type  | Default value  | Description  |
|---|---|---|---|---|
|  `Page` | `integer | string`   | `1` |  Page Number |
| `limit`  |  `integer | string` |  `10` | Number of rows |

Example:

```bash
$ curl http://api.example.com/paths?page=4&limit=10
```

### Ordering

It is possible to order the results by 1 or more keys using order_by(). The order may be specified by prepending each of the keys by “+” or “-”. Ascending order is assumed if there’s no prefix.:

| Name | Type | Default value | Description |
|---|---|---|---|
| `order_by` | `array` | `null` | List of fields to order |

Example:

```bash
$ curl http://api.example.com/paths?order_by=name,+age,-job
```

### Filtering

Filtering follows `{column name}={operator name}:{value}`

Operator name list:

* `ne` – not equal to
* `lt` – less than
* `lte` – less than or equal to
* `gt` – greater than
* `gte` – greater than or equal to
* `not` – negate a standard check, may be used before 
* `in` – value is in list (a list of values should be provided)
* `nin` – value is not in list (a list of values should be provided)
* `mod` – value % x == y, where x and y are two provided values
* `all` – every item in list of values provided is in array
* `size` – the size of the array is
* `exists` – value for field exists

Example:

```bash
$ curl http://api.example.com/paths?age=ge:18&name=abebe
```