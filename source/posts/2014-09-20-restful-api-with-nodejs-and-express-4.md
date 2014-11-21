---
title: มาทำ RESTFul API ด้วย Node.js กับ Express กันดีกว่า
category: Web Development
cover: /images/cover/nodejs-cover.png
tags:
 - Express.js
 - Express
 - Node
 - Node.js
 - Node.js + Express
 - สอน Node.js
 - Node.js คือ
---

*Cover Image : nodejs.org/*

บทความนี้จะมาพูดถึงด้าน Web Development นะครับ นั่นก็คือ Node.js และ Express.js ซึ่งจริงๆ ตัวอย่างนี้ ผมจะไม่มีพูดถึงรายละเอียดเชิงลึก หรือทฤษฎีอะไรมากมายนะครับ เพียงแค่นำเสนอตัวอย่าง และวิธีการทำ RESTFul API ด้วย Node.js จากประสบการณ์ที่ผมทำมาเท่านั้น ซึ่งผมก็ยังเพิ่มเริ่มศึกษา หากส่วนไหนผิดพลาด ก็ต้องขออภัยด้วยนะครับ 

เป้าหมายของบทความนี้คือ RESTFul API ฉะนั้น ผม assume ว่าผู้อ่าน มีพื้นฐานด้านการเขียนเว็บแล้ว เพราะฉะนั้นก็จะไม่พูดถึงพื้นฐานมากนัก ส่วนไหน ไม่รู้ก็หาอ่านเพิ่มเติมเอาเองนะครับ 

[ลิงค์นี้คือตัวอย่าง ที่ผมลองเขียนไว้ใน Runnable ครับ](http://runnable.com/U7bnCsACcG8MGzEc/restful-api-with-node-js-express-4) เพิ่งจะว่างมาทำบทความ ก็วันนี้แหละ :D

## Step 1 : Install Node.js

สำหรับวิธีการติดตั้ง Node.js หรือรายละเอียดอื่นๆ ขอข้ามเลยละกัน assume ่ว่าผู้อ่านทุกคน ติดตั้ง Node.js ไว้ในเครื่องเรียบร้อยแล้ว ข้างล่างนี้คือ รายละเอียด เอาไว้สำหรับอ่านเพิ่มเติมนะครับ สำหรับติดตั้ง และคนที่ยังไม่รู้ว่า Node.js คืออะไร

- [Node.js Installation](http://nodejs.org/download/)
- [Node.js คืออะไร ? + สอนวิธีใช้](http://www.siamhtml.com/introduction-to-node-js/)


## Step 2 : Create Project

ก่อนที่จะเริ่มสร้างโปรเจ็ค ลองทำการทดสอบว่าติดตั้ง Node.js และ npm ไว้เรียบร้อยแล้ว 

```
node --version
v0.10.29

npm --version
1.4.14
```

ต่อมา ทำการสร้างโปรเจ็คขึ้นมา สามารถสร้างแบบ Manual โดยการสร้างไฟล์ชื่อ `package.json` หรือว่าจะใช้คำสั่ง `npm init` ก็ได้ครับ ตัวอย่างผมใช้ `npm init` จะมีขั้นตอนมาให้เราใส่รายละเอียด เมื่อตั้งค่าเรียบร้อย จะได้ไฟล์ `package.json` หน้าตาประมาณนี้

```
{
  "name": "devahoy-nodejs",
  "version": "0.0.1",
  "description": "Devahoy Node.js with Express 4 Tutorial",
  "main": "index.js"
}
```

> ตัว `package.json` มันเป็นเสมือนบัตรประจำตัวของโปรเจ็คนั้นๆ ที่จะระบุว่า โปรเจ็คนั้นชื่อว่าอะไร มีเวอร์ชันที่เท่าไหร่ รายละเอียดอะไรบ้าง ต้องใช้ Dependencies อะไรบ้าง อื่นๆ อีกเยอะแยะ 

ต่อมา ติดตั้ง Express ด้วยคำสั่ง (หากติด permission ให้ใช้ sudo )

```
npm install express --save
```

> `--save` คือการระบุ ให้ติดตั้ง พร้อมกับเซฟค่าไว้ใน package.json ด้วย เวลาที่เราย้ายโฟลเดอร์ ก็สามารถติดตั้ง dependencies ได้ง่ายๆ ด้วยคำสั่ง `npm install` ไม่ต้องมา `npm install xxxx` แยกทีละโปรเจ็คให้ยุ่งยาก และเสียเวลา

เมื่อติดตั้ง เสร็จ จะได้ผลลัพธ์ลักษณะนี้

```
npm WARN package.json devahoy-nodejs@0.0.1 No repository field.
npm WARN package.json devahoy-nodejs@0.0.1 No README data
express@4.9.4 node_modules/express
├── utils-merge@1.0.0
├── merge-descriptors@0.0.2
├── cookie@0.1.2
...
├── proxy-addr@1.0.2 (ipaddr.js@0.1.3)
└── on-finished@2.1.0 (ee-first@1.0.5)
```

ตอนนี้โปรเจ็คของเรา ก็จะมีโฟลเดอร์ `node_modules` เพิ่มเข้ามา ต่อมาทำการสร้างไฟล์ `index.js` ขึ้นมา เพื่อใช้เป็นไฟล์หลักที่ใช้เขียน โครงสร้างจะได้ดังนี้

```
├── index.js
├── node_modules
│   └── express
└── package.json
```
และไฟล์ `package.json` ก็จะถูกอัพเดท กลายเป็นแบบนี้

```
{
  "name": "devahoy-nodejs",
  "version": "0.0.1",
  "description": "Devahoy Node.js with Express 4 Tutorial",
  "main": "index.js",
  "dependencies": {
    "express": "^4.9.4"
  }
}
```

## Step 3 : index.js

ในไฟล์ `index.js` เพิ่มโค๊ดด้านล่างนี้ลงไป

```html
var app = require('express')();

var port = process.env.PORT || 7777;

app.get('/', function (req, res) {
	res.send('<h1>Hello Node.js</h1>');
});

app.get('/index', function (req, res) {
	res.send('<h1>This is index page</h1>');
});

app.listen(port, function() {
	console.log('Starting node.js on port ' + port);
});
```

เริ่มแรกเราทำการเรียก `require('express')` เป็นเหมือนการ import โปรเจ็ค express เข้ามาในโปรเจ็คของเรา จากนั้นสั่ง execute แล้วส่งค่าไว้ตัวแปร `app` จริงๆมีค่าเท่ากับ


```
var express = require('express');
var app = express();
```

บรรทัดต่อมา กำหนด port เป็น 7777 

ส่วน `get(path, callback)` จะเป็นในส่วนของ route ของเรา

- parameter แรก คือ URL ที่เราต้องการ อย่างเช่น `/` คือหน้า home 
- parameter ตัวสอง คือ callback จะมี `request` และ `response`

โดยเมื่อมีการเข้าหน้า home ตัว request ก็จะส่งคำว่า **Hello Node.js** เช่นเดียวกัน อีกฟังค์ชันใช้ route เป็น `/index` เมื่อเข้าหน้า `/index` ก็จะแสดงคำว่า **This is index page**

ส่วนสุดท้ายคือ `app.listen(port)` รับค่าเป็นหมายเลข port เพื่อสั่งให้ server ทำการรัน Web Server ด้วย port ที่เรากำหนด ส่วนอีก parameter เป็นออฟชันเสริม จะมีหรือไม่มีก็ได้

สุดท้าย สั่ง start server ด้วยคำสั่ง `node ชื่อไฟล์` เช่น

```
node index.js

Starting node.js on port 7777
```

ของเปิด บราวเซอร์ด้วย [http://localhost:7777](http://localhost:7777) และ [http://localhost:7777/index](http://localhost:7777/index) เปรียบเทียบกันดูครับ

## Step 4 : Create RESTFul API

เป้าหมายของเรา ไม่ใช่การ render หรือให้ response กลับไปเป็นข้อความ แต่เป้าหมายคือ ต้องการส่งผลลัพธ์กลับไปเป็น JSON ฉะนั้น การส่งผลลัพธ์กลับไป เราจะใช้ฟังค์ชัน `res.json()` ครับ

ตอนนี้เป้าหมายของผมคือ เมื่อเข้าเว็บ 

- GET `localhost:7777/` : ให้แสดงข้อความต้อนรับ
- GET `localhost:7777/user` : ให้แสดงรายชื่อ user ทั้งหมดในระบบ
- GET `localhost:7777/user/:id` : แสดงชื่อ user นั้นๆ โดย :id คือ เลข id ของ user
- POST `localhost:7777/newuser` : เอาไว้สำหรับส่งค่า POST เพื่อเพิ่มข้อมูล user

ทำการสร้างไฟล์ `users.js` ขึ้นมา ตัวนี้ผมจะเอาไว้สำหรับเป็นข้อมูลของ user ส่วนนี้กำหนดขึ้นมาแบบมั่วๆ เป็น array (ไม่ได้ใช้ฐานข้อมูล)

```
var users = [
	{
		"id": 1,
		"username": "goldroger",
		"name": "Gol D. Roger",
		"position": "Pirate King"
	},
	{
		"id": 2,
		"username": "mrzero",
		"name": "Sir Crocodile",
		"position": "Former-Shichibukai"
	},
	{
		"id": 3,
		"username": "luffy",
		"name", "Monkey D. Luffy",
		"position": "Captain"
	},
	{
		"id": 4,
		"username": "kuzan",
		"name": "Aokiji",
		"position": "Former Marine Admiral"
	},
	{
		"id": 5,
		"username": "shanks",
		"name": "'Red-Haired' Shanks",
		"position": "The 4 Emperors"
	}
];

exports.findAll = function() {
	return users;
};

exports.findById = function (id) {
	for (var i = 0; i < users.length; i++) {
		if (users[i].id == id) return users[i];
	}
};
```

`exports.findAll` คือฟังค์ชันสำหรับหา user ทั้งหมดในระบบ ส่วนนี้ผมจะให้ส่งค่า users ทั้งหมด กลับไป ในขณะที่ `exports.findById(id)` คือฟังค์ชันที่หา user นั้นๆ โดยการระบุ id ก็จะส่งรายละเอียด user นั้นกลับไป ส่วน `exports` คือความสามารถของ Node.js ที่เราสามารถนำ function หรือโมดูลที่เราเขียนเอง ไปใช้กับไฟล์อื่นได้ครับ

ต่อมาเปิดไฟล์ `index.js` เพิ่ม `require()` เพื่อให้ใน `index.js` สามารถเรียกใช้ฟังค์ชันใน `users.js` ได้ ใส่เข้าไปบนสุดของไฟล์เลย

```
var users = require('./users');
```
> จะเห็นว่าเราไม่จำเป็นต้องใส่ นามสกุลของไฟล์ เช่น .js ลงไปด้วย เพียงแค่ระบุชื่อไฟล์และ path ให้ถูก Node.js มันฉลาดพอที่จะรู้ว่าเรา require ไฟล์ไหน

ต่อมา ทำการเพิ่ม route แต่ละอันเข้าไป

```html
app.get('/', function (req, res) {
	res.send('<h1>Hello Node.js</h1>');
});

app.get('/user', function (req, res) {
	res.json(users.findAll());
});

app.get('/user/:id', function (req, res) {
	var id = req.params.id;
	res.json(users.findById(id));
});

app.post('/newuser', function (req, res) {
	var json = req.body;
	res.send('Add new ' + json.name + ' Completed!');
});

app.listen(port, function() {
	console.log('Starting node.js on port ' + port);
});
```

โค๊ดด้านบน เมื่อยูเซอร์ เข้าผ่าน `localhost/user` ก็ให้ทำการเรียกฟังค์ชั่น `findAll()` จะส่งค่ากลับมาเป็น json จากนั้นใช้ `res.json()` เพื่อส่งค่าไปแสดงในหน้าเว็บ 

เช่นเดียวกัน `/user/:id` เมื่อระบุ id เป็นหมายเลขไอดีของ user ที่เราต้องการ ก็จะส่ง id เข้าไปในฟังค์ชัน `findById(id)` โดย id นั้นเราจะอ่านค่าจาก `req.params.id` 

> ตัว Route จะเป็น :id แสดงว่า params คือ id ถ้าหาก ตัว Route เป็น :name เราจะอ่านค่า name ด้วย req.params.name

ต่อมา เมื่อเข้า `/newuser` แต่เป็นแบบ POST ก็จะทำการรับ `req.body` ซึ่งเราจะส่งค่าเป็น JSON ไป ในส่วนนี้จริงๆ ก็จะนำค่าไปเซฟใน database แต่สำหรับบทความนี้ ผมแค่เอาค่าที่เราส่งไปแบบ POST มาแสดง หน้าเว็บเท่านั้นครับ

ทดสอบ รันผ่านหน้าเว็บดูครับ GET ทั้งหมดทดสอบได้ แต่ว่าเฉพาะ POST ต้องทดสอบผ่าน cURL หรือว่าจะใช้ Chrome Plugin ที่ชื่อว่า Postman ก็ได้ครับ

## Step 5 : Test with Postman

ทำการติดตั้ง Postman เพื่อเอาไว้เทส GET/POST ครับ เข้าไปติดตั้งจากลิงค์นี้เลย [Postman - REST Client](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en)

หน้าตาของ Postman

![Postman](/images/2014/09/postman.png)

สั่ง 

```
node index.js
```

จากนั้นเปิด Postman แล้วลองใส่ URL ที่ต้องการ กด Send แล้วดูผลลัพธ์ครับ 

ต่อมาทดสอบ POST โดยการเลือก POST จากนั้นเลือกข้อมูลแบบ raw ใส่ค่า JSON ที่ต้องการลงไป เช่น 

```
{
    "name": "Roronoa Zoro",
    "position": "Swordman"
}
```

ลองกด Send ดู...

![Test POST Method](/images/2014/09/post.png)

Error ซิครับ :D

```
TypeError: Cannot read property &#39;name&#39; of undefined
```

เนื่องจากว่า เราไม่สามารถส่งค่า/อ่านค่า body ได้ จึงต้องใช้ `body-parser` เข้ามาช่วย โดยการ 

```
npm install body-parser --save
```

จากนั้น ตั้งค่า Body Parser ในไฟล์ `index.js` ดังนี้ เพื่อให้สามารถ อ่านค่า JSON ได้

```
var users = require('./users');
var app = require('express')();

var bodyParser = require('body-parser');

var port = process.env.PORT || 7777;

// parse application/json
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
	extended: true
}));
```

ทดสอบ start server ใหม่อีกครั้ง

![Completed](/images/zoro.png)

่เรียบร้อย! ได้ผลลัพธ์ตามที่ต้องการ 

จะเห็นว่าในบทความนี้ ผมเน้นเรื่องการใช้งาน Node.js และ Express เบื้องต้นซะมากกว่า รู้ว่ามันใช้งาน Route ยังไง มี GET, POST รับส่ง request, response แบบฉบับย่อๆ ไม่ได้ลงรายละเอียดมาก รวมถึงยังไม่ได้พูดถึงฐานข้อมูลเลย ใช้การจำลองข้อมูลแบบเกรียนๆนี้แหละ เซฟเป็น array

สุดท้ายหวังว่าจะอ่านรู้เรื่องกันนะครับ [**Source Code : RESTFul API with Node.js and Express**](https://github.com/Devahoy/simple-rest-api)

## เนื้อหาเพิ่มเติม 

สำหรับเนื้อหาเพิ่มเติม แนะนำให้อ่านจากรายชื่อเว็บด้านล่างเหล่านี้ครับ เอาไปต่อยอดกันเอาเอง

- [Awesome Node.js](https://github.com/sindresorhus/awesome-nodejs)
- [The Node Beginner Book](http://www.nodebeginner.org/)
- [REAL-TIME WEB WITH NODE.JS](https://www.codeschool.com/courses/real-time-web-with-node-js)
- [Node : Up and Running](http://chimera.labs.oreilly.com/books/1234000001808/index.html)
- [Express.js 4, Node.js and MongoDB REST API Tutorial](http://webapplog.com/express-js-4-node-js-and-mongodb-rest-api-tutorial/)
- [Build a RESTful API Using Node and Express 4](http://scotch.io/tutorials/javascript/build-a-restful-api-using-node-and-express-4)
- [GETTING UP AND RUNNING WITH NODE.JS, EXPRESS, JADE, AND MONGODB](http://cwbuecheler.com/web/tutorials/2013/node-express-mongo/)
- [Learn You The Node.js For Much Win!](https://github.com/rvagg/learnyounode)