---
title: ทำ RESTFul API ด้วย Node.js, Express และ MongoDB
category: Web Development
cover: /images/cover/nodejs-cover.png
tags:
 - Node.js
 - Express
 - MongoDB
 - RESTFul API
 - Mongo.js
 - Node.js คือ
 - สอน Node.js
---

จากบทความที่แล้ว ผมได้พูดถึงเรื่องการทำ RESTful API ด้วย Node.js กับ Express เบื้องต้นไปแล้ว [มาทำ RESTFul API ด้วย Node.js กับ Express กันดีกว่า](http://devahoy.com/2014/09/restful-api-with-node-js-and-express/) โดยในบทความที่ผ่านมา ได้ทำ API โดยส่งข้อมูลปลอมๆที่สร้างจาก array เท่านั้น ไม่ได้ใช้ข้อมูลจากฐานข้อมูล มาวันนี้ผมเลยเพิ่มในส่วนของฐานข้อมูลเข้าไปด้วย โดยใช้ MongoDB 

บทความนี้เป็นส่วนเสริมของบทความก่อนหน้า หากใครยังไม่รู้จัก Node.js แนะนำให้อ่านบทความก่อนหน้าประกอบนะครับ

### บทความนี้ไม่เหมาะสำหรับ

- ผู้ที่ไม่เคยได้ยิน MongoDB มาก่อน
- ผู้ที่ไม่เคยใช้ Node.js
- ผู้ที่ไม่พยายามค้นคว้า/แก้ปัญหาด้วยตัวเอง

เนื่องจากบทความนี้ก็เป็นการพูดแบบพื้นฐานเท่านั้น เนื้อหาก็เป็นแค่ Basic หากอยากรู้รายละเอียดเชิงลึกก็ต้องศึกษาเพิ่มเติมเองนะครับ ซึ่งมันเกินความสามารถผมครับ ผมก็แค่ระดับผู้ใช้พื้นฐานทั่วไป :D

## Step 1 : Install MongoDB

สำหรับขั้นตอนแรก เนื่องจากบทความนี้จะใช้ MongoDB เพราะฉะนั้นทำการติดตั้ง MongoDB กันก่อนเลยครับ [Install MongoDB](http://docs.mongodb.org/manual/installation/) เลือกว่าใช้ OS ไหน ในบทความนี้นำเสนอวิธีติดตั้งบน Ubuntu Machine หากท่านใช้ OS อื่นก็ติดตั้งตาม Guide ได้เลยครับ

ตัวที่ต้องการติดตั้งคือ `mongodb-org` เป็น package ตัวเต็มที่รวมทั้ง MongoDB Server, Daemon, Shell, Tools ต่างๆ ขั้นแรกเลย

ทำการ Import public key เพื่อใช้เป็น Authentication

```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
```

จากนั้นทำการสร้างไฟล์ใหม่ `/etc/apt/sources.list.d/mongodb.list` แล้วเพิ่มโค๊ดด้านล่างนี้ ไปที่่ไฟล์

```
deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
```

Reload Package และติดตั้ง MongoDB

```
sudo apt-get update
sudo apt-get install mongodb-org
```

เมื่อติดตั้งเสร็จ ลองพิมพ์ command line ว่า 

```
mongo
```

จะสามารถ access เข้าไปในฐานข้อมูล MongoDB ได้ หากสามารถทำถึงขั้นตอนนี้ได้ แสดงว่าติดตั้งได้ไม่มีปัญหา เป็นอันว่าเรียบร้อย 

## Step 2 : Clone a repo

ขั้นตอนต่อมา ทำการ clone โปรเจ็คเก่ามาเลยครับ เราจะทำต่อจากโปรเจ็คเดิมนั่นเอง

```
git clone git@github.com:Devahoy/simple-rest-api.git
cd simple-rest-api
```

หลังจาก clone มาแล้ว ก็ทำการติดตั้ง `node_modules` ทั้งหมดที่โปรเจ็คนี้ต้องใช้ลงไปซะก่อน (ปกติเวลาอัพเป็น git ส่วนมากจะไม่รวม node_modules เข้าไปด้วย และใช้ package.json เพื่อระบุว่าเราต้องใช้ modules อะไร ถึงค่อยไป install เอาเอง)

```
npm install
```

> cmd รันด้วย Run as Administrator หรือ ใช้ sudo หากเป็นบน Linux

เมื่อติดตั้ง `node_modules` เรียบร้อยแล้ว ทดสอบรัน Server ครับ ว่าโปรเจ็คเก่ามันรันได้มั้ย?

```
node index.js
```

ทดสอบเข้าเว็บ [http://localhost:7777](http://localhost:7777) หรือ [http://localhost:7777/user](http://localhost:7777/user) หากไม่มีปัญหา เริ่มขั้นตอนต่อไปไเลยดีกว่า

## Step 3 : ใช้ Mongojs

สำหรับ [Mongojs](https://github.com/mafintosh/mongojs) เป็น Node.js Module ตัวนึงครับ หลายๆตัวๆ ที่อาจจะคล้ายๆกัน ก็คือพวก Mongoose, Mongoskin, Mongolia, Monk มีให้เลือกหลายตัว แล้วแต่คนถนัดนะครับ ส่วนตัวผมใช้แค่ Mongojs และ Mongoose อันอื่นยังไม่เคยลอง แต่เนื่องจากว่าบทความนี้เป็นโปรเจ็คง่ายๆ เล็กๆ ผมเลยเลือกใช้ Mongojs เพราะว่าเร็วกว่า ไม่ต้องไปตั้งค่า Schema อะไรให้ยุ่งยาก (อนาคตก็กะจะทำบทความทั้ง Mongojs และ Mongoose ด้วยครับ หากมีเวลา)

ติดตั้ง Module ด้วยคำสั่ง

```
npm install mongojs
```

หรือหากต้องการเซฟไปไว้ใน `package.json` ด้วย ก็ใช้คำสั่งนี้

```
npm install mongojs --save
```

่ต่อมาสร้างไฟล์ชื่อว่า `db.js` แล้วเพิ่มโค๊ดด้านล่างนี้ลงไป

```javascript
var mongojs = require('mongojs');

var databaseUrl = 'devahoy_mongojs';
var collections = ['users', 'clubs'];

var connect = mongojs(databaseUrl, collections);

module.exports = {
	connect: connect
};
```

โค๊ดด้านบนเป็นการเรียกใช้ module `mongojs` จากนั้นทำการ `connect(databaseUrl, collections)` โดยระบุชื่อ Database และชื่อ Collections (เป็น array จะ collection เดียวหรือหลาย collection ก็ได้)

> Collection ใน MongoDB ก็เหมือนกับ Table ใน SQL

สุดท้าย `module.exports` คือการ export ไฟล์ตัวนี้ไปใช้ในไฟล์อื่นของเราครับ เพื่อให้ไฟล์อื่นๆในโปรเจ็ค สามารถใช้ ฟังค์ชนในไฟล์นี้ได้

คล้ายๆกับเราทำการ `require module_name` ต่างๆนั้นแหละครับ

ต่อมาเปิดไฟล์ `index.js` แล้วทำการเรียกไฟล์ `db.js` เพื่อให้สามารถเข้าถึง `connect` ในไฟล์ `db.js` ได้

```javascript
var mongojs = require('./db');
var db = mongojs.connect;
```

หรือจริงๆ เราก็เขียนทุกอย่างไว้ในไฟล์ `index.js` ก็ได้ 

```javascript
var mongojs = require('mongojs');

var databaseUrl = 'devahoy_mongojs';
var collections = ['users', 'clubs'];

var db = mongojs(databaseUrl, collections);
```

แต่ผมคิดว่ามันแลยุ่งยาก หากอนาคต เรามีการเพิ่มเติม Database หรือเพิ่ม method ทางทีดี แยกกันทำงานไว้คนละไฟล์น่าจะดีกว่า



## Step 4 : Basic Mongojs

พักเรื่อง Project ไว้แปปนึง มาลองดูตัวอย่าง Basic Mongojs เบื้องต้นกันก่อนดีกว่า ทั้งหมดนี้หาอ่านได้จาก [Mongojs Documentation on Github](https://github.com/mafintosh/mongojs)

### Query/Find

ค้นหาข้อมูลใน MongoDB ใช้คำสั่่งนี้ `db.COLLECTION_NAME.find(QUERY, CALLBACK)` เช่น

```javascript
var callback = function(err, docs) {
    // console.log(docs.name);
};

db.users.find(callback);
```

- `QUERY` : เป็นเงื่อนไขว่าเราจะ query อะไร (เหมือน where ใน SQL) ไม่ใส่อะไรคือ select all ค้นหาทั้งหมด
- `CALLBACK` : เป็น callback function ส่งผลลัพธ์กลับเมื่อมีการ query เรียบร้อยแล้ว ตัวแรกเป็น err หากมี error เกิดขึ้น และตัวที่สอง docs คือ Document หลังจากที่ query เสร็จเรียบร้อย เราสามารถเข้า Document โดยใช้ชื่อ filed เช่น `docs.name` , `docs.username` 

และบางทีนิยมใช้ callback function เป็น annonymous inner class นะครับ ซึ่งตัวอย่างต่อๆไป ผมจะใช้แบบนี้ไปเลย

```javascript
// หา users ที่มีชื่อว่า "Luffy"
db.users.find({name: "Luffy"}, function(err, docs) {
    // Ahoy!
});
```

### Sort / Limit

เราสามารถ Sort หรือ Limit Query ได้เช่นเดียวกันกับ SQL โดย call method ต่อท้าย `find()` ได้เลย โดยระบุ 1 หรือ -1 เพื่อให้เรียงจากก่อนมาหลัง หรือหลังไปหน้า เช่น

```javascript

db.users.find().sort({_id: -1}, function(err, docs) {
   // Descending
});

db.users.find().sort({_id: 1}, function(err, docs) {
   // Ascending
});
```

ใช้ Limit ก็ต่อจาก `sort()` หรือ `find()` ก็ได้

```javascript
db.users.find().limit(5, function(err, docs) {
    // show only 5 users.
});

db.users.find().sort({_id: -1}).limit(5, function(err, docs) {
   // show only latest 5 users.
});
```

**ส่ิงสำคัญที่สุดคือ Callback function**

### Insert

การเพิ่มข้อมูลลงฐานข้อมูล MongoDB ใช้คำสั่ง `db.COLLECTION_NAME.insert(DOCUMENT, CALLBACK)` เช่น

```javascript
var user = {
    name: "Chai",
    position: "Attacking Midfielder",
    foot: "Either",
    age: "18" // :D
};

db.users.insert(user);
// หรือ
db.users.insert(user, function(err, docs) {
    // insert completed 
});
```

### Update

การ Update Document จะต่างกับอย่างอื่นเล็กน้อย คือมี 2 แบบ  ระหว่าง `update()` และ `findAndModify()`

- `update()` ทำการอัพเดทเฉยๆ ไม่มีผลลัพธ์อะไร ส่วน `findAndModify()` ทำการอัพเดท และมี callback ส่งกลับมาเป็นข้อมูลล่าสุดที่อัพเดท

โดย syntax ของ update เป็นดังนี้ `db.COLLECTION_NAME.update(QUERY, UPDATE, OPTION)` เช่น

```javascript
db.users.update(
    { name: "Chai" },
    { name: "ChaiP", $inc: {age: 1}}, 
    function(err, result) {
        // Ahoy!!
    }
);
```

ด้านบนเป็นคำสั่ง Query หา user ที่มีชื่อว่า "Chai" แล้วทำการอัพเดทเป็น "ChaiP" และเพิ่ม age ไปอีก 1 (จะอัพเดทแค่ document เดียว เนื่องจากว่าเราไม่ได้ตั้งค่า $multi (default เป็น false) )

ส่วน `findAndModify` ก็แบบนี้

```javascript
db.users.findAndModify({
    query: { name: 'Luffy' },
    update: { $set: { age: 25 } },
    new: true
}, function(err, doc, lastErrorObject) {
    // doc.age === 25
});
```

## Step 5 : Edit RESTFul API

จากบทความก่อน ที่เราใช้วิธีดึงข้อมูลจาก array เลย คราวนี้เราจะทำใหม่ โดยการแก้ไขเป็น MongoDB จาก

```javascript
app.get('/', function (req, res) {
    res.send('<h1>Hello Node.jsh1>');
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

แก้ไขที่ละ Route เลยละกัน เริ่มจาก 

- `/user` เปลี่ยนเป็น

```javascript
app.get('/user', function (req, res) {
	db.users.find(function(err, docs) {
		res.json(docs);
	});
});
```

ทำการค้นหาข้อมูลทั้งหมดใน collection ชื่อ users จากนั้นส่งผลลัพธ์ ให้ request ส่ง json ไปแสดงบนหน้า Browser.

- `/user/:id` เปลี่ยนเป็น 

```javascript
app.get('/user/:id', function (req, res) {
	var id = parseInt(req.params.id);

	db.users.findOne({id: id}, function(err, docs) {
		res.json(docs);
	});
});
```
ทำการค้นหาข้อมูลใน collection ชื่อ users โดยระบุว่าต้องการค้นหา id อะไร (id อันนี้คนละตัวกับ _id ที่เป็น default ของ MongoDB นะครับ)

##### เพิ่มเติม

หากเราต้องการ query ด้วย _id เราต้องใช้ mongojs.ObjectId แบบนี้ 

```
var ObjectId = mongojs.ObjectId;
var id = "54685538d497efe2358a7c30";
db.users.findOne({_id: ObjectId(id)}, function(err, docs) {

});

- `/newuser` เปลี่ยนเป็น 

```javascript
app.post('/newuser', function (req, res) {
	var json = req.body;

	db.users.insert(json, function(err, docs) {
		res.send('Add new ' + docs.name + ' Completed!');
	});

});
```

ในส่วนนีเราจะใช้วิธีเพิ่มข้อมูลผ่าน Postman เหมือนบทความก่อนหน้า

- สุดท้าย ที่ root `/` เปลี่ยนเป็น

```javascript
app.get('/', function (req, res) {

	db.users.count(function(err, result) {
		if (result <= 0) {
			db.users.insert(users.findAll(), function(err, docs) {
				// insert new data.
			});
		} 
		res.send('<h1>Hello Node.js</h1>');
	});

});
```

ทำการเช็คก่อนว่า มี users ในฐานข้อมูลหรือไม่ ถ้าไม่มีก็ให้ insert users ในไฟล์ `users.js` ลงไปในฐานข้อมูลซะ (ข้อมูลเดียวกันกับบทความเดิมแต่เปลี่ยนจากวิธีเรียกดูข้อมูลจากไฟล์โดยตรง เป็นเรียกดูผ่านฐานข้อมูลแล้วนะครับ อย่าสับสนนะ)


เรียบร้อยแล้วครับ ลองไปทดสอบใช้งานกันดูได้ สุดท้าย [source code](https://github.com/Devahoy/simple-rest-api/tree/part2) บน Github เช่นเดิม อยู่ branch **part2**

```
git clone https://github.com/Devahoy/simple-rest-api.git
git checkout part2
```


> เพิ่มเติม แนะนำ [RoboMongo](http://robomongo.org/) Tool ที่เอาไว้จัดการ MongoDB บนเครื่อง สำหรับคนไม่ถนัด Command Line และเพิ่มความสะดวกรวดเร็วในการทำงาน