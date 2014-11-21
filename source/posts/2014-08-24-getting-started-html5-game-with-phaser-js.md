---
title: สอนสร้างเกม HTML5 ด้วย Phaser Framework
category: Game Development
cover: /images/2014/08/phaser-js-cover.png
tags:
 - Game Dev
 - Phaser.js Tutorial
 - สอนสร้างเกม HTLM5
 - สอนเกม HTML5
 - สอน Phaser.js
 - Phaser.js
 - HTML5 Game
 - HTML5 Game Tutorial
---

วันนี้ผมจะพาไปเขียนเกม HTML5 ด้วย PhaserJS กันนะครับ ตัวอย่างเกม เมื่อเขียนเสร็จ จะได้หน้าตาแบบนี้เลย ลองเข้าไปลองเล่นได้

[![Demo Game](/images/2014/08/finish-game.png)](http://devahoy.github.io/phaser-101/)

[**PhaserJS**](http://phaser.io/) เป็น HTML5 Game Framework ตัวหนึ่ง สร้างโดย [Photo Storm](http://www.photonstorm.com/) ซึ่งสามารถสร้างเกมส์แบบ Cross-Browser ได้ สามารถทำงานร่วมกับ Browser บนมือถือได้ (ที่รองรับ Canvas) และ Browser บน Desktop ได้ จุดเด่นของ PhaserJS คือ มี Module และ Features ให้เลือกใช้มากมาย สามารถประหยัดเวลาในการสร้างเกมๆหนึ่ง 

ตัว PhaserJS เขียนด้วย Javascript หากต้องการใช้งาน PhaserJS ควรจะมีความรู้พื้นฐานในส่วน Web Development มาบ้าง  ส่วน Features ของมันมีอะไรบ้าง ก็ดูตามรูป หรือเข้าไปดูที่เว็บหลักได้เลยครับ

![Phaser Features](/images/2014/08/phaser-features.png)

ก่อนที่จะเริ่มต้นสร้างโปรเจ็ค ก็ขอแนะนำลิงค์ต่างๆ ที่น่าจะมีประโยชน์ เอาไว้อ่านประกอบครับ

- [PhaserJS Documentation](http://docs.phaser.io/)
- [PhaserJS Code Example](http://examples.phaser.io)
- [PhaserJS Webboard](http://html5gamedevs.com/forum/14-phaser)

## Table of Contents

- [Step 1 : Prepare & Setup Project](#step1)
- [Step 2 : Download Phaser & Game Assets](#step2)
- [Step 3 : Create Game](#step3)
- [Step 4 : Load Assets](#step4)
- [Step 5 : Create Game World](#step5)
- [Step 6 : Add Player](#step6)
- [Step 7 : Control Player](#step7)
- [Step 8 : Add coins](#step8)
- [Step 9 : Check Overlap](#step9)
- [Step 10 : Add Score](#step10)
- [Bonus Track](#bonus)

<a name="step1"></a>


## Step 1 : Prepare & Setup Project

ขั้นตอนแรกเลย ต้องเตรียมตัวที่จะใช้งาน PhaserJS นั้นจะต้องเตรียมตัวอะไรบ้าง? เริ่มที่

- **Text Editor** : หา Text Editor ซักตัว ไม่ว่าจะเป็น Sublime Text 2/3, Notepad++, WebStorm, Brackets, Atom หรืออื่นๆ

- **Browser** : อันนี้คาดว่าน่าจะมีทุกคน Chrome หรือ Firefox (ไม่แนะนำ IE)

- ** Web Server** : จะเป็น Apache หรือ nginx ก็ได้ หรือจะลงผ่าน WAMP, XAMPP, LAMP ก็ตามสะดวก ใครไม่รู้วิธีติดตั้ง ก็ตามนี้ครับ 
    - [ขั้นตอนการติดตั้ง Apache, MySQL, PHP บน Ubuntu](http://devahoy.com/2014/06/how-to-install-apache-mysql-php-on-ubuntu/) ส่วนถ้าเป็น OS อื่นก็ไปหาวิธีทำเองนะครับ ส่วนนี้ไม่ได้อยู่ในบทความ
    - หากใช้ PHP เวอร์ชัน 5.4 ขึ้นไป รู้สึกก็จะมี [Built-in Web Server](http://php.net/manual/en/features.commandline.webserver.php) อยู่
    
        ```
        cd /path/to/yourgame/
        php -S localhost:8000
        ```
        
    - หากใช้ Python ก็ใช้ Simple HTTP Server ไ้ด้เลย 
        
    สำหรับ Python 2
        ```
        cd /path/to/yourgame/
        python -m SimpleHTTPServer portNumber
        ```
        
    สำหรับ Python 3
    
        ```
        cd /path/to/yourgame/
        python3 -m http.server portNumber
        ```

<a name="step2"></a>


## Step 2 : Download Phaser & Game Assets

หลักจากที่เตรียมพร้อมเรียบร้อยแล้ว ต่อมาก็ทำการสร้างไฟล์ `index.html` ขึ้นมา 1 ไฟล์ จากนั้นทำการดาวน์โหลดไฟล์ [phaser.js](https://github.com/photonstorm/phaser/releases/download/v2.0.7/phaser.js) เวอร์ชันล่าสุด (2.0.7) เซฟไว้ที่เดียวกันกับ `index.html` ต่อมาก็สร้างไฟล์ `main.js` ขึ้นมา ไฟล์นี้คือไฟล์ที่เราจะใช้เขียนเกม ตอนนี้ในโปรเจ็คเรา จะมี 3 ไฟล์แล้ว  (ผมโหลดตัว phaser.js ไม่ใช้ตัว phaser.min.js เนื่องจากต้องการดูโค๊ด รวมถึง Docs มันด้วย)

```
├── index.html
├── main.js
└── phaser.js
```

ถัดมา ที่ไฟล์ `index.html` เพิ่มโค๊ด HTML ลงไป โดย `div id="game">` คือส่วนที่เราจะใช้ในการโชว์ตัวเกมเรานะครับ (ผมไม่พูดถึงรายละเอียด HTML นะครับ บทความนี้ assume ว่าทุกคนมีพื้นฐาน Web แล้ว)

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>PhaserJS Game Tutorial by Devahoy</title>

    <style>
        body {
            margin: 50px 0 0 0;
            background: #ececec;
        }
        a {
            color: #e25e5e;
        }
        .container {
            text-align: center;
            color: #fff;
        }
        #game canvas{
            margin: 15px auto;
        }
    </style>

	<script type="text/javascript" src="phaser.js"></script>
	<script type="text/javascript" src="main.js"></script>
</head>
<body>
    <div class="container">
        <h1><a href="http://devahoy.com">HTML5 Game Tutorial with PhaserJS</a></h1>
        <div id="game"></div>
    </div>
</body>
</html>
```

ส่วน File Assets ต่างๆ ที่จะใช้ในโปรเจ็คนี้ก็ทำการโหลดตามข้างล่างนี้เลยครับ

- logo.png : ![Logo](/images/2014/08/logo1.png)
- ground.png : ![ground](/images/2014/08/ground.png)
- coins.png : ![coin](/images/2014/08/coins.png)
- warrior_m.png : ![Player](/images/2014/08/warrior_m.png)

Credit 

- [Antifarea's RPG sprite set 1](http://opengameart.org/content/antifareas-rpg-sprite-set-1-enlarged-w-transparent-background-fixed)
- [Spinning Coin](http://opengameart.org/content/spinning-coin)


เมื่อโหลดหมดแล้ว ก็เซฟไว้ที่โฟลเดอร์ `assets` สุดท้ายจะได้ตัวโปรเจ็คทั้งหมดเป็นดังนี้

```
├── assets
│   ├── coins.png
│   ├── ground.png
│   ├── logo.png
│   └── warrior_m.png
├── index.html
├── main.js
├── phaser.js
```

<a name="step3"></a>



## Step 3 : Create Game

ต่อมา ถึงเวลาเริ่มลงมือเขียนโค๊ด เปิดไฟล์ `main.js` ขึ้นมา เพิ่มโค๊ดด้านล่างนี้ลงไป 

```javascript
var mainState = {
	preload: function() {

	},

	create: function() {

	},

	update: function() {

	}
};

var game = new Phaser.Game(800, 600, Phaser.AUTO, 'game');

game.state.add('main', mainState);
game.state.start('main');
```

อธิบายโค๊ดด้านบน เริ่มตั้งแต่ `mainState` คือ State หลักที่เราจะใช้ในการเขียนเกมนะครับ ภายใน State ก็จะมี ฟังค์ชั่น 3 ฟังค์ชั่น ดังนี้

- `preload` : ฟังค์ชั่นนี้จะถูก execute เป็นอันดับแรก จะทำหน้าที่ โหลดไฟล์ Game Assets ต่างๆ (images, sound)
- `create` : ฟังค์ชั่นนี้จะถูก execute หลังจาก `preload` จะเอาไว้สำหรับให้ Game Assets ต่างๆที่โหลดไว้ มาโชว์บนหน้าจอ 
- `update` : ฟังค์ชั่นนี้เปรียบเสมือน Game Logic (เช่นรับ input จากผู้เล่น, เช็คการชนกันของวัตถุ) มันจะถูกรันประมาณ 60 ครั้งต่อวินาที

ต่อมาดูที่ `game` สร้างจากออปเจ็คของ `Phaser.Game` โดยมีรายละเอียดดังนี้

```
// Phaser.Game(width, height, renderer, Html element)
new Phaser.Game(800, 600, Phaser.AUTO, 'game');
```

- `800` : คือ Width ความกว้างของเกมส์
- `600` : คือ Height ความสูงของเกมส์
- `Phaser.AUTO` : เป็นโหมดที่ใช้ในการ render มี 3 โหมดคือ Phaser.AUTO, Phaser.CANVAS, Phaser.WEBGL
- `game` : คือ element ของ HTML ในไฟล์ `index.html` ที่เราต้องการให้โหลดตัวเกม (เราสร้าง `<div id="game"></div>` ไว้ใน `index.html` แล้ว)

สุดท้ายทำการ เพิ่ม `State` ไปยังอ็อปเจ็ค `game` โดยให้ `State` ชื่อว่า main จากนั้นก็สั่งให้เริ่ม `State` 

> ตัวเกมนี้มีแค่ State เดียว แต่โดยปกติแล้ว State จะเอาไว้แบ่งการทำงานของเกม เช่น State สำหรับ MainMenu, Option หรือ MainGame เป็นต้น

ต่อมาลองเปลี่ยนสี Background ของตัวเกมซักหน่อย โดยเพิ่มลงไปตรงฟังค์ชัน `create` 

```
create: function () {
    game.stage.backgroundColor = '#e26a6b';
},
```

เปิด Browser ดู จะเห็นหน้าจอดังภาพ

![Red Background](/images/2014/08/background.png)

<a name="step4"></a>



## Step 4 : Load Assets

ผมจะเริ่มทำการโหลดไฟล์ Assets ต่างๆที่จะใช้ในเกม เริ่มด้วย `logo.png` เป็นรูปโลโก้ของเว็บนี้แหละครับ  ทำการโหลด และเก็บไว้ในชื่อ `devahoy` คล้ายๆโหลดไฟล์ `logo.png` มาเก็บไว้ในตัวแปร devahoy

```
preload: function() {
    game.load.image('devahoy', 'logo.png');
},
```

และที่ฟังค์ชัน `create` ก็ใช้ไฟล์รูปที่โหลดไว้ ด้านบน มาแสดงบนหน้าจอที่ตำแหน่ง x = 0 และ y = 0

```
create: function() {
    game.stage.backgroundColor = '#e26a6b';
    // devahoy คือชื่อที่เราเอาไว้เรียกภายในโปรแกรม คนละชื่อกับชื่อไฟล์นะครับ
    game.add.sprite(0, 0, 'devahoy'); 
},
```

#### Anchor Point

Anchor Point คือจุดที่เราต้องการให้ `add.sprite(0, 0, 'devahoy');` แสดงในตำแหน่ง x, y โดยค่า default แล้ว Anchor Point จะเป็น (0, 0) ฉะนั้น จุดที่แสดง sprite x = 0, y = 0 คือนับจากมุมซ้ายของรูปภาพ จากตัวอย่าง จุดที่ เส้นตรงสองเส้นวิ่งมาตัดกัน นั้นคือ Anchor Point

![Anchor Point](/images/2014/08/anchor-point-0-0.png)

ที่นี้ เมื่อเราไม่ได้กำหนดอะไรเลย ค่า default ของมันคือ 0, 0 ฉะนั้น รูปมันก็จะอ้างอิง Anchor Point โดยใช้ มุมซ้ายบนของรูปภาพ เป็นจุดอ้างอิง  เมื่อเปิด Browser จะได้ดังนี้

![Load Assets](/images/2014/08/load-assets.png)

ส่วนตัวแล้ว เวลาจะคำนวนอะไรหลายๆ อย่าง มันทำให้อาจจะดูงงๆ เพราะฉะนั้นก็เลยปรับ anchor point โดยนับจุด x, y จากกึ่งกลางรูปภาพแทนดังนี้

```
game.add.sprite(0, 0, 'devahoy').anchor.setTo(0.5, 0.5);
```

ทีนี้ เมื่อเวลาเราปรับ Anchor Point เป็น (0.5, 0.5) มันก็จะเริ่มคำนวณ โดยนับจาก กึ่งกลางของรูปภาพแทน  เวลาเราสั่่งให้มันแสดงภาพที่ตำแหน่ง x = 0, y = 0 ก็จะนับจากกึ่งกลางของรูปภาพ ดังรูป

![Anchor Point 0.5](/images/2014/08/anchor-poin-0-5.png)

ลองทดสอบรัน Browser ใหม่อีกครั้ง คราวนี้รูปมันจะหลุดออกนอกจอเลย เนื่องจากจุด x = 0, y = 0 มันคือจุดกึ่งกลางของรูป

![Anchor Point Result](/images/2014/08/anchor-05.png)

<a name="step5"></a>



## Step 5 : Create Game World

OK หลังจากที่รู้วิธีการ โหลด image การแสดง image ต่อมาก็ถึงขั้นตอนการสร้าง Game World เนื่องจากตัวเกมเดโม่อันนี้ จะทำแบบง่ายๆ ฉะนั้นตัว World ก็จะมีแค่พื้นหญ้า ด้านล่าง  มีเกาะ 2 - 3 เกาะ ให้กระโดดขึ้นไปเท่านั้น เริ่มด้วยการ ทำการโหลดรูป ที่จะใช้ก่อน ที่ฟังค์ชัน `preload()` 

```
preload: function () {
    game.load.image('ground', 'assets/ground.png');
},
```

ต่อมา ที่ฟังค์ชั่น `create()` ก็สั่งให้ Phaser ใช้ `Physics.ARCADE` โดยเพิ่มโค๊ดด้านล่างนี้ลงไป ผมจะอธิบายโดยใส่คอมเม้นไว้ในโค๊ดนะครับ

```
create: function() {
    game.physics.startSystem(Phaser.Physics.ARCADE);

    // สร้าง Group ขึ้นมา เปรียบเสมือน Game World ของเรา 
    // และเอาเก็บไว้ในตัวแปร myWorld (เป็น global)
    this.myWorld = game.add.group();

    // จากนั้นเซตให้ enableBody เป็น true คือให้อยู่ในโหมด Physics
    // สามารถที่จะเช็คการชนกันของวัตถุ (collision) เช็คการ overlap กันได้
    this.myWorld.enableBody = true;
},
```

ต่อมาเมื่อเรามี Group ของ Game World แล้ว ต่อมาผมก็ทำการสร้างพื้นหญ้าเขียวๆ ด้านล่างขึ้น 

```
var ground = this.myWorld.create(0, game.world.height - 64, 'ground');
ground.scale.setTo(2, 2);
ground.body.immovable = true;
```

ด้านบน คือการสร้างพื้นหญ้าขึ้นมา โดยระบุตำแหน่ง x, y และชื่อภาพที่เราต้องการ ส่วน `scale.setTo(2, 2)` คือการขยายรูปภาพ เนื่องจากตัว `ground.png` ที่ผมใช้ มีขนาด 400x32 เมื่อ setScale ก็จะทำใ้ห้มันโหลดรูปมามีขนาด 800x64 ซึ่งเต็มความกว้างของจอพอดีเลย  

![Create Ground](/images/2014/08/create-ground.png)

ทีนี้ เราก็ใช้หลักการเดียวกัน สร้างเกาะ หรือพื้นที่มันลอยฟ้า เพื่อที่จะเอาไว้ให้ผู้เล่นกระโดดขึ้นไปได้

```
var left = this.myWorld.create(0, 450 - 32, 'ground');
left.body.immovable = true;

var right = this.myWorld.create(450, 350 - 32, 'ground');
right.body.immovable = true;

var middle = this.myWorld.create(250, 250 - 32, 'ground');
middle.scale.setTo(0.3, 1);
middle.body.immovable = true;

var top = this.myWorld.create(100, 150 -32, 'ground');
top.scale.setTo(0.2, 1);
top.body.immovable = true;
```

![Create Ground2](/images/2014/08/create-all-ground.png)

<a name="step6"></a>



## Step 6 : Add Player

การสร้างตัวผู้เล่น เราจะทำการโหลดภาพมาจาก spritesheet ที่ชื่อว่า `warrior_m.png` นะครับ เริ่มด้วยการเพิ่มโค๊ดที่ฟังชั่น `preload()`

```
preload: function() {
    // game.load.spritesheet('name', 'path/to/filename', width, height)  optional : frame count.
    game.load.spritesheet('player', 'assets/warrior_m.png', 32, 36);
},
```
ข้างบนเป็นการโหลดรูป spritesheet มาเก็บไว้ในชื่อ `player` โดยแต่ละเฟรมมีขนาด 32x36 pixel จากนั้นเมื่อโหลดรูปแล้ว ก็ให้มันแสดง ด้วยการเพิ่มโค๊ดที่ `create()`


```
// เพิ่ม sprite ที่ตำแหน่ง 0, 450 จาก spritesheet warrior_m.png
this.player = game.add.sprite(0, 450, 'player');

// สั่งให้ตัว player นี้ใช้โหลด Physics
game.physics.arcade.enable(this.player);

// กำหนดการเด้งของวัตถุ, แรงโน้มถ่วง 
// และก็ตั้งค่าให้ตัว Player ไม่สามารถออกนอก Game World ได้
this.player.body.bounce.y = 0.25;
this.player.body.gravity.y = 980;
this.player.body.collideWorldBounds = true;
```

ต่อมา ทำการใส่ animation ให้กับ player 

```
// animations.add(name, frames, frame rate, loop);
// name - ชื่อ animation เพื่อที่จะเอาไว้เรียก เวลาเราจะสั่ง animation.play()
// frames คือตำแหน่ง frames ต่างๆที่ต้องการให้ animation
// rate : คือค่า frame rate
// loop : true/false ว่าจะให้มันวนลูปเล่น animation เรื่อยๆ หรือไม่?
this.player.animations.add('right', [3, 4, 5], 10, true);
this.player.animations.add('left', [9, 10, 11], 10, true);

// ตั้งค่าให้ player ใ้ช้รูปที่ frame ตำแหน่ง 6
this.player.frame = 6;
```

หากใครยังงง เรื่องตำแหน่ง frames ลองดูรูปนี้ประกอบครับ การนับตำแหน่ง จะเริ่มนับที่ 0 ถัดมาเรื่อยๆ 

![Frames Animation](/images/2014/08/player-frames.png)

ฉะนั้น animation ของเรา ที่ชื่อ `right` ได้ทำการเล่น frame ตำแหน่ง 3, 4, 5  ก็คือ ภาพนี้

![Right](/images/2014/08/right.png)

เ่ช่นเดียวกัน animation ชื่อ `left` เล่น frame ตำแหน่ง 9, 10, 11 ก็คือภาพนี้

![Left](/images/2014/08/left.png)

ลองทดสอบรันบน Browser จะเห็นตัว Player แล้ว แต่ว่ามันดันทะลุไปอยู่ในพื้น ซะได้

![Player](/images/2014/08/create-player.png)

อัพเดท player เมื่อเวลาโดน พื้นแล้วไม่ให้ทะลุ โดยการเพิ่มลงไปในฟังค์ชั่น `update()`

```
update: function () {
    game.physics.arcade.collide(this.player, this.myWorld);
},
```

`collide(object, object)` เป็นการเช็คกันของวัตถุสองอัน ส่วนนี้ PhaserJS จะคำนวณให้เราเอง เมื่อเรากำหนดแบบนี้ วัตถุสองชิ้น เมื่อมีการแตะกันเกิดขึ้น ก็จะหยุดทันที ผลลัพธ์ก็เป็นแบบที่เห็นเลยครับ คือตัวผู้เล่นจะไม่ทะลุพื้น ตอนนี้ก็เหมือนผู้เล่น ยืนบนพื้นแล้ว

![Player Collide](/images/2014/08/player-collide.png)


<a name="step7"></a>



## Step 7 : Control Player

หลักจากที่เราทำการแสดง Player ได้แล้ว ต่อมาก็ถึงเวลาที่เราจะมาควบคุมมันแล้ว สั่งให้ตัวเกมใช้ฟังค์ชันเพื่อรับค่าปุ่ม Curosr คือลูกศร ขึ้น ลง ซ้าย ขวา ในส่วนฟังค์ชัน `create()`

```
create: function() {
  this.cursors = this.input.keyboard.createCursorKeys();
},
```

โดยปกติ ส่วน Logic ของเกม หรือการรับ Input จากผู้เล่น จะทำที่ฟังค์ชั่น `update()` นะครับ เพราะมันจะเหมือน Game Loop คือจะ loop ไปเรื่อยๆ 60 ครั้งต่อวินาที จนกว่าจะปิดเกม ฉะนั้นไปที่ฟังค์ชั่น `update()` 

ทำการเช็คว่าผู้เล่น กด Keyboard <kbd>Right</kbd> หรือไม่

```
if (this.cursors.right.isDown) {

}
```

และเช็คว่าผู้เล่น กด Keyboard <kbd>Left</kbd> หรือไม่ด้วย

```
if (this.cursors.left.isDown) {

}
```

เมื่อผู้เล่นมีการกดปุ่ม ก็จะให้เลื่อนตำแหน่ง แกน x จะได้ดังนี้

```
// reset player velocity
this.player.body.velocity.x = 0;
if (this.cursors.right.isDown) {
  this.player.body.velocity.x = 200;
  this.player.animations.play('right');
} else if (this.cursors.left.isDown) {
  this.player.body.velocity.x = -200;
  this.player.animations.play('left');
} else {
  this.player.animations.stop();
  this.player.frame = 6;
}
```

ด้านบนเป็นการ reset ค่าให้ความเร็วแกน x เป็น 0 ก่อน เมื่อเวลาไม่ได้กดปุ่ม มันจะได้อยู่กับที่ ส่วนเมื่อกดปุ่มขวา มันก็จะขยับไปทางขวามือ 200 pixel ต่อวินาที เช่นเดียวกัน เมื่อกดปุ่มลูกศรซ้าย ก็จะขยับไปทางซ้าย 200 pixel ต่อวินาที  แล้วจะเห็นว่านอกจากให้ตัว `player` ขยับแล้ว เรายังสั่งให้มันเล่น animation จาก spritesheet ที่เราตั้งค่าไว้ ชื่อ `right` และ `left` ด้วย หากไม่ได้กดปุ่มอะไรเลย มันก็จะหยุดเล่น animation แล้วแสดงผล frame ที่ 6

ต่อมา เพิ่มให้ผู้เล่นสามารถกระโดดได้ด้วย โดยเมื่อผู้เล่นกดปุ่มลูกศรขึ้น ให้ต้ัว `player` มันกระโดดได้ ด้วยโค๊ดนี้

```
if (this.cursors.up.isDown && this.player.body.touching.down) {
  this.player.body.velocity.y = -500;
}
```

ด้านบน เมื่อกดลูกศรขึ้น ตัว `plyaer` จะลอยขึ้นไปด้านบน (แกน y ด้านบนสุดคือ 0 ล่างสุดคือความสูงของจอ = 800) และสังเกตว่าตรงเงื่อนไข if มีการเช็ค

```
this.player.body.touching.down
```

ตรงส่วนนี้คือ เมื่อตัว `player` มีการแตะกับวัตถุด้านล่าง ฉะนั้น เงื่อนไขนี้จะเป็นจริงได้ ต้องให้ผู้เล่นกดปุ่มลูกศรขึ้น และตัวละคร ต้องยืนอยู่บนฟื้นเท่านั้น

![Jump](/images/2014/08/jump.png)

<a name="step8"></a>



## Step 8 : Add coins

ต่อมา เพิ่มไอเท็มเข้าไปในเกมซักหน่อย โดยผมจะทำการเพิ่มเหรียญ เข้ามานะครับ ตัวเหรียญเป็น spritesheet ฉะนั้นจะทำการโหลด ที่ฟังค์ชัน `preload()` ดังนี้

```
preload: function() {
  ...
  game.load.spritesheet('coin', 'assets/coins.png', 40, 44, 4);
},
```

ด้านบนเป็นการโหลดรูป `coins.png` โดยแต่ละเฟรมมีขนาด 40x44 pixel จำนวน 4 เฟรม

ต่อมาที่ฟังค์ชั่น `create()` ทำการสร้าง group ชื่อ coins และสั่งเรียกฟังค์ชัน `spawnCoins()` เพื่อให้สุ่มเกิดเหรียญทั้งหมด 10 เหรียญบนหน้าจอ ดังนี้

```
create: function() {
  ...
  this.coins = game.add.group();
  this.coins.enableBody = true;
  this.spawnCoins();
},
```

เพิ่มฟังค์ชัน `spawnCoins()` ต่อจากฟังค์ชัน `update()` ได้เลย (ระวังเรื่องเครื่องหมายคอมมา (,) )

```
update: function() {
  ...
},

spawnCoins: function() {

  for (var i = 0; i < 10; i++) {

    var x = this.rnd.integerInRange(0, game.world.width - 40);
    var y = this.rnd.integerInRange(0, game.world.height - 100);

    this.coins.create(x, y, 'coin');
    this.coins.forEach(function(coin) {
      coin.animations.add('effect', [0, 1, 2, 3], 5, true);
      coin.animations.play('effect');
      coin.scale.setTo(0.5, 0.5);
      coin.body.gravity.y = 200;
      coin.body.bounce.y = 0.5;
    });
  }
  
},
```

ฟังค์ชันด้านบนเป็นการวนลูป 10 ครั้งเพื่อสุ่มเกิดเหรียญ 10 เหรียญ ในตำแหน่ง x, y ที่แตกต่างกัน ส่วนแต่ละเหรียญ เราก็จะเพิ่ม animation ให้มัน โดยการโหลดจาก frame 0, 1, 2, 3 มีเฟรมเรตเท่ากับ 5 และวนลูป animation ไปเรื่อยๆ  

มีการปรับ scale รูปภาพ เนื่องจากเหรียญมันใหญ่ เลยปรับขนาดให้มันเล็กลง และปรับ gravity ในแกน y = 200 มีค่าการกระทบเท่ากับ 0.5 (คือเมื่อตกลงพื้นมันจะเด้งกับมาเป็นระยะทางครึ่งนึงของระยะทางเดิม)

ลองทดสอบเปิด Browser ดู

![Coins](/images/2014/08/coins1.png)

จะเห็นว่า เหรียญมันลอย แล้วตกลงไปทะลุพื้นและหายไปจากจอเลย ทำไมหว่า? เพราะว่าเราลืม เช็ค `collide` ครับ ไปที่ฟังค์ชัน `update()` เพิ่มนี้ลงไป

```
update: function () {
  ...
  game.physics.arcade.collide(this.coins, this.myWorld);
},
```

เพื่อเช็คว่า เมื่อเกิด collide (เกิดการชนกันของวัตถุ 2 ชิ้น) คือเช็คระหว่าง เหรียญ และตัว `myWorld` พวกพื้นและเกาะต่างๆ

ทดสอบรัน Browser อีกครั้ง

![Coins2](/images/2014/08/coin2.png)

คราวนี้จะเห็น เหรียญ ตกมาแล้ว หยุดตรงส่วนที่เป็นพื้นแล้ว แต่จะเห็นว่าตัวละคร เดินผ่านเหรียญได้ 

<a name="step9"></a>



## Step 9 : Check Overlap

ขั้้นตอนต่อมา เราจะทำการเก็บเหรียญ เมื่อผู้เล่นเดินไปทับกับตำแหน่งเหรียญ ด้วยการเช็ค overlap โดย overlap มีการใช้งาน ดังนี้

```
overlap(object1, object2, overlapCallback, processCallback, callbackContext);
```

- `object1` : คือออปเจ็คตัวแรก ที่เราจะไว้เช็ค
- `object2` : ออปเจ็คตัวที่สอง ที่จะเอาไว้เช็ค
- `overlapCallback` : ฟังค์ชันที่จะเอาไว้ถูกเรียก เมื่อมีการ overlap เกิดขึ้น
- `processCallback` : เป็นฟังค์ชันเสริม ที่จะเอาไว้เช็ค จะ return true/false หาก true ก็จะทำการ onOverlap
- `callbackContext` : คือ Context ส่วนมากจะอ้างถึง this หรือหมายตัว `this.game`

ทำการเปิดฟังชัน `update()` แล้วเพิ่มนี้ลงไป

```
game.physics.arcade.overlap(this.player, this.coins, this.collectCoin, null, this);
```

จะเห็นว่าเราเช็คว่า ผู้เล่น และ เหรียญ มีการ overlap กันเกิดขึ้นหรือไม่ ถ้าเกิดขึ้น ก็ให้ไปเรียกฟังค์ชัน `collectCoin()` ส่วน processCallback ไม่ได้ใช้งาน 

สร้างฟังค์ชัน `collectCoin()` ขึ้นมา 

```
spawnCoins: functionI() {
  ..
},

collectCoin: function(player, coin) {
  coin.destroy();
},
```

จะเห็นว่า `collectCoin(player, coin)` มีการรับ parameter 2 ตัว ก็คือ 2 อ็อปเจ็คที่เราให้มันเช็ค overlap กันนั่นแหละ เมื่อมีการเรียกฟังค์ชันนี้เกิดขึ้น ก็ทำการ `coin.destroy()` เป็นฟังค์ชันของ PhaserJS ที่เอาไว้ลบ sprite ออกครับ

ตอนนี้เราก็สามารถบังคับตัวละคร เดินไปเก็บเหรียญ แล้วเหรียญหายไปได้แล้ว ต่อไป ขั้นตอนสุดท้าย ใส่คะแนนให้กับมัน เวลาที่เก็บเหรียญครับ

<a name="step10"></a>



## Step 10 : Add Score

ขั้นตอนนี้จะทำการโชว์ Text บนหน้าจอภาพ เพื่อแสดงคะแนนที่เราทำได้ Text เราไม่จำเป็นต้องโหลดอะไร ฉะนั้้น ก็เริ่มสร้างได้เลยที่ฟังค์ชัน `create()` สร้างตัวแปรขึ้นมาสองตัว ตัวแรก `score` เอาไว้เก็บค่าคะแนน ส่วน `scoreText` เอาไว้แสดงคะแนนที่หน้าจอของเกม

```
create: function () {
  this.score = 0;
  this.scoreText;

  this.scoreText = game.add.text(16, 16, 'Score : ' + this.score, {
    fontSize: '20px',
    fill: '#ed3465'
  });
},
```

เราสามารถให้เกมแสดงข้อความได้ ด้วยการใช้ `game.add.text(x, y, text, style)` โดยมีพารามิเตอร์คือ 

- `x` : ตำแหน่ง x
- `y` : ตำแหน่ง y
- `text` : ค่าที่ต้องการแสดง 
- `style` : รูปแบบที่ต้องการ เช่น ขนาดฟ้อน สีฟ้อน 

ทดสอบรันโปรแกรมดูครับ

![Add Score](/images/2014/08/score.png)

สุดท้าย เราจะให้มันได้คะแนน เมื่อเราเก็บเหรียญได้ ฉะนั้น ก็แก้ไขฟังค์ชัน `collectCoin()` นิดหน่อย เมื่อเก็บเหรียญ ก็ทำการเพิ่ม `score` ด้วย ดังนี้

```
collectCoin: function(player, coin) {
  coin.destroy();
  this.score += 10;
  this.scoreText.text = 'Score : ' + this.score;
}
```

สุดท้าย เกมก็พร้อมเล่นแล้วครับ!

<iframe src="http://devahoy.github.io/phaser-101/" width="800" height="600"></iframe>

## Conclusion

เมื่ออ่านมาถึงตรงนี้ เชื่อว่าทุกคนก็ได้เรียนรู้ PhaserJS ไปพอสมควร ได้รู้จักกับการสร้าง spritesheet, โหลด image รู้เกี่ยวกับ Physics ทั้งการ collision และ overlap รวมถึงรู้จักกับการรับ Input ต่างๆ คาดว่าทั้งหมดนี้ สามารถนำไปประยุกต์และสร้างเกมในแบบฉนับของตนเองได้ รวมถึงหากใครสนใจ ก็นำไปต่อยอด หาทางศึกษาเพิ่มเติมเอาเอง ในระดับ Advanced นะครับ นอกเหนือจากนี้ผมก็คงแนะนำได้เพียงแค่ แหล่งศึกษาเพิ่มเติมครับ ตามนี้เลย

- [HTML5 Game Development using Phaser by Lynda](http://www.youtube.com/playlist?list=PLuPKgtwSH_obQV2rJF6TU8SR8KI9wINoi) - Video สอนของ Lynda อันนี้ผมไม่แน่ใจว่าที่เอาลง Youtube มันแอคเคาท์จริงหรือปลอมนะครับ
- [Discover Phaser](https://www.discoverphaser.com/) - เป็นหนังสือเล่มล่าสุด และเล่มเดียวของ PhaserJS
- [List of Phaser Tutorials](http://www.lessmilk.com/phaser-tutorial/) - รวมบทความ Tutorial ่ต่างๆจากเว็บ lessmilk
- [Open Source Project on Github](https://github.com/search?utf8=%E2%9C%93&q=phaserjs) - ลองค้นหา Open Source บน Github ดูครับ มีเยอะมากๆ

ตัวโปรเจ็ค อยู่บน [Github](https://github.com/Devahoy/phaser-101) และ ทดลองเล่นตัวเดโมได้ครับ

<a name="bonus"></a>

## Bonus Track

แถมครับ 1 เพลง เอ้ย ไม่ใช่!  แถมเพิ่มเติมเกี่ยวกับ การ Cross Platform ไปลง Mobile ครับ พอดีว่าช่วงนี้สนใจ HTML5 แล้วอยากรู้ว่ามันจะ Cross-Platform ไปลง Android, iOS ยังไง ก็เลยไปลอง [Ludei CocoonJS](https://www.ludei.com/) มา 
![Ludei](/images/2014/08/ludei-1024x435.png)

ปรากฎว่ามันน่าสนใจเลย ลองเข้าไปในเว็บ แล้วสมัคร และลองเล่นดูครับ  ส่วนนี้ผมแค่เอาตัวอย่าง มาให้ดู ไม่ได้เขียนวิธีการให้นะครับ หากมีคนสนใจเยอะอาจจะทำบทความให้ครับ :D

ปัจจุบันผมก็กำลังศึกษาจาก [Tutorial นี้อยู่](https://leanpub.com/html5shootemupinanafternoon) ส่วน [Source Code ก็นี้](https://github.com/Phonbopit/learn-html5-shmup) ก็เลยนำตัวเกมที่ศึกษาลง Ludei ด้วยเลย ผลก็เป็นแบบภาพครับ เขียนด้วย HTML5/Javascript ก็สามารถทำเกมลง iOS, Android ได้เหมือนกันนะ! ภาพด้านล่าง ผมเปิดตัวเกมเดียวกัน ด้วยมือถือ Android

![Ludei SS](/images/2014/08/ludei-ss.png)

สุดท้าย หากบทความนี้มีประโยชน์ อย่าลืม ช่วยแชร์ รวมถึงบอกต่อเพื่อนๆ ด้วยนะครับ หรือพบโค๊ดหรือข้อความส่วนไหน พิมพ์ตกหล่น ก็แจ้งเข้ามาได้นะครับ ขอบคุณครับ

