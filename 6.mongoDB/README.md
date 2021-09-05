
## 6.mongoDB
## INDEX
- [setting](#setting)
  - [AWS-EC2](#AWS-EC2)   
    -[1. Amazon Linux 2 AMI](#1.%20Amazon%20Linux%202%20AMI)  
- [Scheme](#Scheme)
- [Tool](#Tool)

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
grep ^NAME  /etc/*release
sudo vi /etc/yum.repos.d/mongodb-org-5.0.repo
[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc

sudo yum install -y mongodb-org
ps --no-headers -o comm 1
sudo systemctl start mongod
sudo systemctl status mongod
sudo systemctl enable mongod
mongosh
mongo --host 127.0.0.1:27017
```
- log
```
/var/log/mongodb/mongod.log
```
- port
```
27017
```

#### Scheme
- https://mongoosejs.com/docs/schematypes.html

#### Tool
- https://nosqlbooster.com/


