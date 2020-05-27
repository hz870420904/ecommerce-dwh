#!/bin/bash

#Pull cluster images from repository

docker pull hz870420904/ecommerce-dwh:log-server-01
docker pull hz870420904/ecommerce-dwh:log-server-02
docker pull hz870420904/ecommerce-dwh:hadoop-server-01
docker pull hz870420904/ecommerce-dwh:hadoop-server-02
docker pull hz870420904/ecommerce-dwh:hadoop-server-03
docker pull hz870420904/ecommerce-dwh:kafka-server-01
docker pull hz870420904/ecommerce-dwh:kafka-server-02
docker pull hz870420904/ecommerce-dwh:kafka-server-03

#Generate a DNS
docker network create --driver=bridge ecommerce-dwh

#Initialize cluster containers
docker run -itd --network ecommerce-dwh -h "h01" --name "h01" hz870420904/ecommerce-dwh:hadoop-server-01 /bin/bash
docker run -itd --network ecommerce-dwh -h "h02" --name "h02" hz870420904/ecommerce-dwh:hadoop-server-02 /bin/bash
docker run -itd --network ecommerce-dwh -h "h03" --name "h03" hz870420904/ecommerce-dwh:hadoop-server-03 /bin/bash
docker run -itd --network ecommerce-dwh -h "s01" --name "s01" hz870420904/ecommerce-dwh:log-server-01 /bin/bash
docker run -itd --network ecommerce-dwh -h "s02" --name "s02" hz870420904/ecommerce-dwh:log-server-02 /bin/bash
docker run -itd --network ecommerce-dwh -h "kafka01" --name "kafka01" hz870420904/ecommerce-dwh:kafka-server-01 /bin/bash
docker run -itd --network ecommerce-dwh -h "kafka02" --name "kafka02" hz870420904/ecommerce-dwh:kafka-server-02 /bin/bash
docker run -itd --network ecommerce-dwh -h "kafka03" --name "kafka03" hz870420904/ecommerce-dwh:kafka-server-03 /bin/bash

