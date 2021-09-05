
## 6.mongoDB
## INDEX
- [setting](#setting)
  - [AWS-EC2](#AWS-EC2)   
    -[1. Amazon Linux 2 AMI](#1.%20Amazon%20Linux%202%20AMI)   

---

## setting
### AWS-EC2
#### 1. Amazon Linux 2 AMI
- doc
```
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-amazon/
```
- cli
```
    3  grep ^NAME  /etc/*release
    4  sudo vi /etc/yum.repos.d/mongodb-org-5.0.repo
    5  sudo yum install -y mongodb-org
    6  ps --no-headers -o comm 1
    9  sudo systemctl start mongod
   10  sudo systemctl status mongod
   11  sudo systemctl enable mongod
   12  mongosh
   13  mongo --host 127.0.0.1:27017
```
- log
```
/var/log/mongodb/mongod.log
```
- port
```
27017
```



