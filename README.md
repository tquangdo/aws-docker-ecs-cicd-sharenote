# aws-docker-ecs-cicd-sharenote 🐳

![Stars](https://img.shields.io/github/stars/tquangdo/aws-docker-ecs-cicd-sharenote?color=f05340)
![Issues](https://img.shields.io/github/issues/tquangdo/aws-docker-ecs-cicd-sharenote?color=f05340)
![Forks](https://img.shields.io/github/forks/tquangdo/aws-docker-ecs-cicd-sharenote?color=f05340)
[![Report an issue](https://img.shields.io/badge/Support-Issues-green)](https://github.com/tquangdo/aws-docker-ecs-cicd-sharenote/issues/new)

## run docker
> don gian, chi la add URL endpoint of RDS vo Dockerfile roi chay localhost!!!
---
![detail](screenshots/detail.png)
1. ### note
    - docker tag name=`sharenote`
1. ### reference
    [awsstudygroup](https://000015.awsstudygroup.com/vi)
1. ### AWS SG
    - name=`dtq-sharenote-sg`
    > ⚠️⚠️ IMPORTANT ⚠️⚠️: SG's inbound rule=Aurora MUST have source=`IPv4 of browser (Ex: MyIP, NOT VPC's IP!!!)`
---
![sg](screenshots/sg.png)
1. ### AWS RDS (MySQL)
    - instance name=`dtqinstancesharenote`
    - db name=`DTQNoteDB`
    ![mysql](screenshots/mysql.png)
1. ### run
    - in `Dockerfile` src code, we already added RDS endpoint
    ```shell
    ./build.sh
    ```
    - access `localhost:8082` on browser
    > `build.sh` => `docker run -p 8082:8080 sharenote` (`8080` is default port of Tomcat)
---
![result](screenshots/result.png)
    - access DB by Workbench
    ![wb](screenshots/wb.png)

## ECS
![detail2](screenshots/detail2.png)
1. ### reference
    [awsstudygroup](https://000016.awsstudygroup.com/vi/)
1. ### ECR
    - ECR name=`dtq-sharenote`=docker tag name (map with `ECS/build.sh`)
1. ### AWS Targetgroup
    - target type=`Instances`
    > ⚠️⚠️ IMPORTANT!!! ⚠️⚠️ different with type=`IP` of https://github.com/tquangdo/aws-ecr-ecs-fargate-alb-api#create-target-group
    ![tg_type](screenshots/tg_type.png)
    - port=`8082`
    ![tg](screenshots/tg.png)
1. ### AWS ALB
    - listener port=`80`
    ![lb](screenshots/lb.png)
    ---
    ![alb_sg_tg](screenshots/alb_sg_tg.png)
1. ### AWS ECS cluster
    ![cluster](screenshots/cluster.png)
1. ### AWS ECS task definition
    - add container with mapping port=`8082`
    ![taskdef_con](screenshots/taskdef_con.png)
1. ### AWS ECS service
    - container to LB: prodcution listener port=`80:HTTP`
    ![service_1](screenshots/service_1.png)
    - last review
    ![service_2](screenshots/service_2.png)

## CICD
![detail3](screenshots/detail3.png)
1. ### note
    - dowload this file `https://example-corp-storage.s3.amazonaws.com/deploy-artifact/demo-0.0.1-SNAPSHOT.jar` into folder `CICD`
    > `CICD/Dockerfile`: `ADD demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar`
1. ### reference
    [awsstudygroup](https://000017.awsstudygroup.com/vi)
1. ### CICD/buildspec.yaml
    - need replace 2 variables:
    ```yml
    ...
    - REPOSITORY_URI=<ECR_URI!!!>
    ...
    {"name":"<CONTAINER_NAME!!!>","imageUri":"%s"}
    ```
    - has output `imagedefinitions.json` for CodeDeploy
