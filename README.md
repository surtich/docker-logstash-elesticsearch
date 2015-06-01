# Docker Logstash test

## Prerequisites

[Install Docker](https://docs.docker.com/installation/)
<br>
[Install Docker Compose] (http://docs.docker.com/compose/install/)
<br>
[Allow execute Docker without root access](https://docs.docker.com/installation/ubuntulinux/#giving-non-root-access)

## Prepare

```bash
git clone https://github.com/IGZJavierPerez/devops-tests.git
cd devops-tests/
git checkout logstash
```

## Compile docker images

```bash
docker build -t thegameofcode/kibana kibana/
docker build -t thegameofcode/logstash logstash/
docker build -t thegameofcode/logstash-forwarder logstash-forwarder/
```

## Test

```
cd test
```

Open a terminal and start a Elasticsearch container

```bash
docker-compose up elasticsearch
```

Open a terminal and start a Kibana container

```bash
docker-compose up --no-recreate kibana
```

To check Kibana is working, open a browser and navigate to [http://localhost:5601/](http://localhost:5601/)

Open a terminal and start a Logstash container

```bash
docker-compose up --no-recreate logstash
```

Open a terminal and start a Logstash-Forwarder container

```bash
docker-compose up --no-recreate logstashforwarder
```

Now, you should see in Kibana the logs of the file `/var/log/syslog`

## Real implementation

Selfsigned certificates are generated for the Logstash server with the name `logstash`. You can provide your own certificates by putting them in the `logstash/ssl` directory. Or you can generate from the container by removing the `logstash/ssl` directory and by changing the name server in the `logstash/dat` file.

You can change the [Logstash server configuration](https://github.com/IGZJavierPerez/devops-tests/blob/logstash/test/logstash/logstash.conf) or the [Logstash-forwarder configuration](https://github.com/IGZJavierPerez/devops-tests/blob/logstash/test/logstash-forwarder/logstash-forwarder.conf) files  . You can change them before the image compilation o you can pass a customized configuration file during the container creation. You need to update Logstash-forwader `volumes` section of the [docker-compose.yml](https://github.com/IGZJavierPerez/devops-tests/blob/logstash/test/docker-compose.yml) file to make accessible the configured logs of the host to the Docker container.

## Troubleshooting

If something went wrong you can try to:

Restart Docker service:

```bash
service docker restart
```

Remove Docker's containers:

```bash
docker rm -f $(docker ps -a -q)
```

Remove Docker's images and build again:

```bash
docker rmi thegameofcode/logstash thegameofcode/kibana thegameofcode/logstash-forwarder
```



