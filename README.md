# aws-docker-mysql-sharenote 🐳

![Stars](https://img.shields.io/github/stars/tquangdo/aws-docker-mysql-sharenote?color=f05340)
![Issues](https://img.shields.io/github/issues/tquangdo/aws-docker-mysql-sharenote?color=f05340)
![Forks](https://img.shields.io/github/forks/tquangdo/aws-docker-mysql-sharenote?color=f05340)
[![Report an issue](https://img.shields.io/badge/Support-Issues-green)](https://github.com/tquangdo/aws-docker-mysql-sharenote/issues/new)

![detail](screenshots/detail.png)

## reference
[awsstudygroup](https://000015.awsstudygroup.com/vi)

## AWS SG
- name=`dtq-sharenote-sg`
![sg](screenshots/sg.png)

## AWS RDS (MySQL)
- instance name=`dtq-sharenote-db-test`
- db name=`DTQNoteDB`
![mysql](screenshots/mysql.png)

## run
- in `Dockerfile` src code, we already added RDS endpoint
```shell
./build.sh
```
- access `localhost` on browser
![result](screenshots/result.png)
- access DB by Workbench
![wb](screenshots/wb.png)
