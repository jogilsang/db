
## 6.mongoDB
## INDEX
- [install](#install)
  - [AWS-EC2](#AWS-EC2)   
    -[1. Amazon Linux 2 AMI](#1.%20Amazon%20Linux%202%20AMI)  
- [setting](#setting)
    - [AWS-EC2](#AWS-EC2)   
    -[1. Amazon Linux 2 AMI](#1.%20Amazon%20Linux%202%20AMI)  
- [Scheme](#Scheme)
- [Tool](#Tool)
  - [nosqlbooster](#nosqlbooster)
- [query](#query)
---

## install
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

## setting
### AWS-EC2
#### 1. Amazon Linux 2 AMI
```javascript
1. 접속해서 DB별로 계정생성
mongo
use admin;
db.createUser({user: "admin", pwd: "$#@^%#@$%", roles:["root"]});
use 생성하려는DB명;
db.createUser({ user: "user",pwd: "$%$#@%@#",roles: ["dbAdmin", "readWrite"]})

2. localhost 외에서도 접속할 수 있도록 방화벽과 conf 파일수정
// EC2 인바운드 정책도 수정
sudo vi /etc/mongod.conf
net:
  port: 27017
  bindIp: 0.0.0.0
security:
  authorization: 'enabled'

3. 설정적용 후 재시작
sudo systemctl restart mongod

4. 내외부에서 해당DB에 생성한 해당계정으로 접속여부 확인
mongo -u 생성한ID -p 생성한PW public_ip:27017/생성했던DB명
mongoose.connect('mongodb://user:1q2w3e4r@ec2-18-188-194-28.us-east-2.compute.amazonaws.com:27017/websurveyDB');
```

#### Scheme
- https://mongoosejs.com/docs/schematypes.html

#### Tool
- [nosqlbooster](https://nosqlbooster.com/)

#### query
##### SELECT
```sql
db.pw.find()
db.pw.find().pretty()
```
##### INSERT
```sql
use surveyDB
m = { name : "pw", pw : "1234"}
db.pw.insert(m)
db.pw.update( { name: "pw" }, { $set: {pw: "tttt"} } )
```

