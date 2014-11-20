---
title: สอนสร้าง Theme Ghost เพื่อไปขาย Themeforest ตอนที่ 1
category: Ghost Theme
cover: /images/cover/ghost-cover.png
tags:
 - Ghost
 - Ghost Theme
 - Ghost Theme Development
 - Theme Ghost
 - ธีม Ghost
 - สอน Ghost Theme
 - Ghost คือ
---

สวัสดีครับ วันนี้ขอนำเสนอบทความเรื่อง Ghost Theme Development พอดีเห็นว่า Ghost เป็น Blogging Platform ที่น่าสนใจดี (ส่วนตัวผมชื่นชอบ และมี Blog ที่ใช้ Ghost อยู่อีกที่นึง) ในเมืองไทยตอนนี้ คิดว่าอาจจะยังไม่ค่อยนิยมเท่าที่ควร เนื่องจากว่า Ghost ใช้ Node.js ทำให้ Hosting ในไทยหาได้น้อย ต้องเป็น VPS หรือว่าไปใช้ของทางต่างประเทศ  อีกเหตุผลนึงน่าจะเป็นเพราะข้อจำกัด มันดูจะ geek ไปซะหน่อย ไม่ค่อยจะเหมาะกับคนที่ไม่มีพื้นฐานโปรแกรมมิ่ง ไม่เหมือนอย่าง Wordpress คุณไม่ต้องรู้โค๊ดเลย ก็ติดตั้งได้ แค่คลิกเดียว ทำให้การทำ Theme ก็อาจจะมีแหล่งศึกษาน้อยไปด้วย  วันนี้ก็เลยจะมานำเสนอวิธีการสร้าง Theme Ghost นะครับ 

![Ghost Theme](images/2014/10/ghost-getting-started.png)

ทีแรกกะทำเป็นแค่บทความเดียว แต่พอเขียนไปเขียนมา เนื้อหามันเริ่มเยอะขึ้นเรื่อยๆ ก็เลยตัดสินใจแบ่งเป็น Part ดีกว่า โดยในซีรีย์ สอนสร้าง Theme Ghost จะแบ่งออกเป็น 5 Part ตามลิงค์ข้างล่างเลยครับ แต่เนื่องจากว่า ผมตั้ง Auto Post ไว้ให้โพสวันละ 1 Part เป็นเวลา 5 วัน ฉะนั้น Part อื่นๆ ที่ยังไม่ได้โพส ก็จะยังไม่สามารถกดเข้าไปดูได้นะครับ ฉะนั้นมาติดตามเรื่อยๆละกันครับ :D

## Table of Contents

- **Part 1 : Overview and Setup Ghost**
- [Part 2 : Create Theme, Index, Post](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part2)
- [Part 3 : Default Template & Partial](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part3)
- [Part 4 : Navigation & Pagination](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part4)
- [Part 5 : Additional (Comment System)](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part5)
- [Source Code on Github](https://github.com/Devahoy/ghostahoy)


## Setup & Installation

ก่อนที่เราจะไปเริ่มต้นสร้าง Theme Ghost อย่างแรกเลย ทำการดาวน์โหลดและติดตั้งการใช้งานลงบน localhost กันก่อนครับ เข้าไปที่เว็บไซต์ [Ghost.org](https://ghost.org/download/) และทำการดาวน์โหลด (ณ เวลาที่เขียนบทความ เวอร์ชัน 0.5.2)

[![Download](images/2014/10/ghost-download-500x199.png)](https://ghost.org/download/)

เมื่อทำการดาวน์โหลดมาแล้ว ก็แตกไฟล์ จากนั้นก่อนจะติดตั้ง Ghost เราจำเป็นต้องติดตั้ง Node.js ซะก่อน

> Note : การติดตั้ง Ghost ควรจะใช้ Node.js เวอร์ชัน 0.10.x ขึ้นไป. แนะนำ Node.js 0.10.30 และ npm 1.4.21

หากใครติดตั้ง Node.js ไม่เป็น อ่านบทความนี้ประกอบ

- [Node.js คืออะไร ? + สอนวิธีใช้](http://www.siamhtml.com/introduction-to-node-js/)
- [เจาะลึกกับ node.js แบบเริ่มต้นทำความรู้จัก](http://meewebfree.com/site/nodejs/441-learn-about-node-js-with-basic-of-node-js)

เมื่อเรามี Node.js และ npm พร้อมแล้ว ขั้นตอนต่อมาก็คือการติดตั้ง dependencies ต่างๆ ของ Ghost

```
cd path/to/ghost
npm install --production

...
express-hbs@0.7.11 node_modules/express-hbs
├── readdirp@0.3.3 (graceful-fs@2.0.3, minimatch@0.2.14)
├── handlebars@2.0.0 (optimist@0.3.7, uglify-js@2.3.6)
└── js-beautify@1.4.2 (mkdirp@0.3.5, config-chain@1.1.8, nopt@2.1.2)

sqlite3@2.2.7 node_modules/sqlite3
├── set-immediate@0.1.1
└── nan@1.1.2
```

วิธีการติดตั้งเพิ่มเติม อ่านได้ที่นี่ครับ

- [Install Ghost on Windows](http://support.ghost.org/installing-ghost-windows/)
- [Install Ghost on Linux](http://support.ghost.org/installing-ghost-linux/)
- [Install Ghost on Mac](http://support.ghost.org/installing-ghost-mac/)

> อ้อสำหรับบท Windows มีบัคนิดหน่อย คือบัคบน Node.js เวอร์ชัน 0.10.30 ขึ้น “Error: ENOENT” หากมี error ลักษณะนี้ ต้องทำการสร้างโฟลเดอร์ด้วยตัวเองที่ “C:\Users\%USERNAME%\AppData\Roaming\npm”

หากขึ้นแบบด้านบน แสดงว่าติดตั้ง Dependencies เรียบร้อย ต่อไปสั่ง Start Server ด้วยคำสั่งนี้

```
npm start

> node index

Migrations: Database initialisation required for version 003
Migrations: Creating tables...
Migrations: Creating table: posts
Migrations: Creating table: users
...
...
Migrations: Complete
Ghost is running in development... 
Listening on 127.0.0.1:2368 
Url configured as: http://localhost:2368 
Ctrl+C to shut down

```

ครั้งแรกที่ทำการสั่ง Start Server ตัว Ghost จะสร้างฐานข้อมูลขึ้นมา จากนั้นเมื่อสร้างเสร็จ ก็จะขึ้นว่า "Ghost is running in development...." หากเข้าดูที่ [http://localhost:2368](http://localhost:2368 ) จะเห็นหน้าตา Ghost ของเราประมาณนี้

![Welcome to Ghost](images/2014/10/ghost-landing-page-500x249.png)

ส่วนหน้าจัดการ Admin ของเราจะอยู่ที่ [http://localhost:2368/ghost](http://localhost:2368/ghost) เมื่อเข้าครั้งแรก ต้องทำการกำหนด User, Password เหมือนกับการใช้งาน Wordpress ครั้งแรก

![Admin Ghost](images/2014/10/ghost-admin-500x239.png)

ส่วนหน้า Dashboard ไม่ขอพูดถึงนะครับ ข้ามไปในส่วน Settings => Theme หรือเข้า [http://localhost:2368/ghost/settings/general/](http://localhost:2368/ghost/settings/general/) ตรงส่วนนี้คือ ส่วนที่จะเอาไว้เปลี่ยน Theme Ghost ของเราครับ ตอนนี้ มีให้เลือกแค่ Casper หากเราสร้าง Theme เสร็จเรียบร้อยแล้ว ก็มาตั้งค่าตรงส่วนนี้

![Change Theme](images/2014/10/ghost-choose-theme-500x124.png)


## Overview

![Overview](images/2014/10/ghost-theme-500x229.png)

มาดูที่ Overview ของ Ghost Theme กันก่อนเลย แนะนำ [เว็บต้นฉบับ เพื่อเอาไว้อ่านเพิ่มเติม](http://themes.ghost.org/)

Ghost Theme นั้นใช้ภาษา Javascript ในการเขียน สิ่งที่จำเป็นต้องรู้ (แค่พอรู้ก็สามารถเขียนได้แล้ว)

- [พื้นฐาน Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [Node.js](http://nodejs.org/)
- [Handlebars.js](http://handlebarsjs.com/)

![Handlebars](images/2014/10/handlebars-500x145.png)

สำหรับ Handlebars เป็น semantic templates เช่น เราสามารถแทรกค่า Javascript ลงไปในไฟล์ HTML ได้เลย หรือแม้แต่การใช้พวก Statement for-loop โดยปกติแล้วไฟล์ HTML เราจะไม่สามารถทำได้ แต่เมื่อใช้ Handlebars แล้วสามารถทำได้หมด ไฟล์ของ Handlebars จะลงท้ายด้วย .hbs และการแทรกโค๊ดในไฟล์ HTML ก็อย่างเช่น `{{asset}}` หรือ `{{body}}` 

ในการเขียน Theme จะต้องใช้ Handlebars มาเขียนค่อนข้างมากเลย ในขั้นต้นแนะนำให้ลองศึกษาพื้นฐานดูก่อนว่ามัน แทรกโค๊ดยังไง ใส่ statement ลงไปในไฟล์อย่างไร เป็นต้น Handlebars ยังสามารถทีจะทำไฟล์ Template เช่นพวก Header, Footer หรือแม้แต่ Sidebar จากนั้นก็ใช้ความสามารถของ Handlebars ทำการ include มา แทนที่เราจะต้องมาเขียนสิ่งเหล่านี้ในทุกๆไฟล์ อีกทั้งยังมีในส่วนของ [Part 3 : Default Template & Partial](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part3) อีกด้วย ส่วนความสามารถอื่นๆ ของ Handlebars ยังมีอะไรอีกเยอะ ลองไปหาอ่านดูครับ

สรุปแล้วจุดเด่น/จุดด้อย ของ Ghost Theme ในความคิดของผมคือ

#### จุดเด่น

- เขียนธีมง่ายมาก เมื่อเทียบกับ Wordpress 
- ใช้เวลาพัฒนาน้อย เนื่องด้วยมันเป็น Blogging ฉะนั้น ก็จะมีหน้าอยู่ไม่กี่หน้าเอง เช่น Post, Page, Index เป็นต้น
- ใช้ Javascript, HTML/CSS ซึ่งส่วนใหญ่คนทำเว็บก็พอมีพื้นฐานอยู่แล้ว ไม่ต้องไปศึกษาพวก Server Script เพิ่มเติม 
- เริ่มมี Marketplace ให้ขายเพิ่มมากขึ้น เช่นของทาง [Ghost เอง](http://marketplace.ghost.org/) หรือของ [Themeforest](http://themeforest.net/category/blogging/ghost-themes?ref=phonbopit)

#### จุดด้อย

- ตัว Ghost ยังคงอยู่ในสถานะ Beta อยู่และคนยังรู้จักน้อย
- หาโอสติ้้งค่อนข้างยาก ต้องไปใช้บริการ VPS ซึ่งส่วนตัวผมใช้ของ [Digital Ocean](http://devahoy.com/2014/03/getting-started-with-digital-ocean/) อยู่
- ความนิยมและ ราคาเมื่อเปรียบเทียบราคาขายจาก Themeforest กับ Wordpress แล้ว ราคาต่างกันมาก ตัว Ghost ราคาอยู่ราวๆ $18-$22 ในขณะที่ Wordpress มีตั้งแต่ $35-$65

ฉะนั้นใครจะทำ Theme Ghost ขาย ก็ลองประเมินดูนะครับ ใช้เวลาน้อยกว่า Wordpress มาก แต่ราคาก็ต่ำกว่ามากเช่นกัน ถ้าตัดส่วนการออกแบบดีไซน์ออกไป หากคุณเขียนด้วย Wordpress อาจจะใช้เวลา 2 อาทิตย์ - 2 เดือน แต่ถ้าเป็น Ghost ไม่น่าจะเกิน 1 อาทิตย์ (ไม่นับแบบ Multi-Purpose นะ)

อันนี้คือตัวอย่าง Theme ที่เค้าทำในเวอร์ชัน Ghost และ Wordpress ลองดูจำนวน Sale และ ราคาดูนะครับ

Orca

![Orca](images/2014/10/orca-500x203.png)

Astro

![Astro](images/2014/10/astro-500x204.png)

RAIN

![Rain](images/2014/10/rain-500x202.png)

> สำหรับใครที่เป็น Frond-End หากสนใจ มาจอยกันได้นะครับ กำลังต้องการ Web Design พอดี :D 


## File Structure

มาดูในส่วนของไฟล์ Structure ที่จำเป็นในการสร้าง Theme กันบ้าง หากเราเปิดดู Theme ของ casper จะพบว่ามีไฟล์ดังนี้

![File Structure](images/2014/10/ghost-file-structure.png)


โครงสร้างไฟล์ที่จำเป็น

```
├── /assets
├── default.hbs
├── index.hbs [จำเป็น]
└── post.hbs [จำเป็น]
└── package.json [เอาไว้ระบุตัวตน]
```

สำหรับไฟล์พื้นฐานที่จำเป็นของ Theme เลยก็คือ `index.hbs` และ `post.hbs` หากไม่มี 2 ไฟล์นี้ Ghost จะรันไม่ได้เลย ส่วน `package.json` ก็ค่อนข้างจำเป็น เพราะมันจะเป็นไฟล์ที่เอาไว้ระบุรายละเอียดโปรเจ็คของเรา และ `default.hbs` ไม่จำเป็นต้องมีก็ได้ แต่ส่วนมากจะมี และเอาไว้สำหรับเป็น template พื้นฐาน และโฟลเดอร์ `/assets` ควรจะเก็บไฟล์ css, javascript, images ต่างๆ ไว้ในโฟลเดอร์นี้ เนื่องจากว่าเราสามารถเรียกใช้งาน Helper Class ได้ รูปแบบนี้ `{{asset}}` รายละเอียดเพิ่มเติม ดูใน [ตัวอย่างการใช้งาน Helper](#helper)

สำหรับ Concept คร่าวๆ ก่อนนะครับ อาจจะยังไม่เห็นภาพ หรือไม่ค่อยเข้าใจ ก็ข้ามๆไปก่อนได้ 

### `package.json`

ไฟล์นี้จริงๆ ก็ถือว่าค่อนข้างจำเป็น แต่ว่าไม่ได้จำเป็นสำหรับไฟล์ Ghost มันเป็นฟอร์แมตของ npm เนื่องจาก Ghost จะดูว่า Theme นี้ชื่ออะไร และเวอร์ชันอะไร ก็จะดูจากไฟล์นี้แหละ เราจึงควรที่จะมีไฟล์นี้ระบุไว้ว่า Theme ชื่ออะไร เวอร์ชันอะไร ใครเป็นคนสร้าง และรายละเอียดครา่วๆ เช่น

```
{
  "name": "Casper",
  "version": "1.1.0"
}
```

### `index.hbs`

`index.hbs` เป็นเหมือนไฟล์ Home Page ของ Blog เราเลย โดยส่วนมาก หน้านี้ จะเป็นการแสดง Post บทความทั้งหมดของเรา แสดง Title, แสดงรายละเอียดเนื้อหา โดยใช้ Helper มาช่วย เพื่อวนลูปแสดงเนื้อหาของเรา เช่น `{{#foreach}}`

### `post.hbs`

`post.hbs` เป็นหน้า Single Post หรือว่าหน้ารายละเอียดแต่ละโพส โดย Helper ที่เราสามารถใช้ได้คือ Global Helper เช่น `@blog` หรือจะใช้ Helper ภายในโพส เช่น `{{#post}}` 

### `default.hbs`

 `default.hbs` เป็นตัวเลเอาท์ default หรือตัว base template ของเรา เช่น แต่ละหน้า มีส่วน header และ footer เหมือนกันหมดเลย ต่างกันแค่เนื้อหาเท่านั้น เราก็จะใช้ตัว `default.hbs` นี้แหละ เป็นตัวกำหนด ว่า หน้านี้ body เป็นแบบนี้ อีกหน้านึง body เป็นอีกอย่าง โดยอิงพื้นฐานจาก `default.hbs` เช่น เราใช้แค่ `{{ghost_head}}` หรือ `{{ghost_foot}}` ก็สามารถแทรกโค๊ด header และ footer ได้เลยไม่ต้องเขียนโค๊ดทุกหน้า สำหรับส่วนไฟล์อื่นๆ ที่ต้องการจะใช้ตัว `default.hbs` เป็น Base template จำเป็นต้องกำหนด `{{!< default}}` ระบุไว้ที่บรรทัดแรกของไฟล์ด้วย เช่น ไฟล์ `index.hbs` เราอยากใช้ Base Template ก็ต้องระบุไว้ที่บรรทัดแรก ส่วนข้อมูล ในส่วน body ที่เป็นส่วน content จะต้องระบุไว้ในไฟล์ `default.hbs` ด้วย `{{{body}}}}` ส่วนนี้จะถูกแทนที่ด้วยเนื้อหาแต่ละหน้าเอง
 
### `page.hbs`

หน้า `page.hbs` เป็นเหมือนหน้า Page ของ Blog หากไม่มีไฟล์นี้้ Ghost จะใช้ไฟล์ `post.hbs` แทน Page ใช้ข้อมูลเหมือนกับ Post เลย ต่างกันที่ เราสามารถสร้าง Page ของเราขึ้นมาเฉพาะเองได้ เช่น หน้า เพจ About, Contact Us, Portfolio เป็นต้น เราก็ตั้งชื่อ ไฟล์ฟอแมตดังนี้ `page-{{slug}}.hbs` เช่น `page-about.hbs` , `page-contact.hbs` และ `page-portfolio.hbs` ส่วนหน้าเว็บ เวลาจะเข้าเพจ ก็จะเป็น [http://localhost:2368/about](http://localhost:2368/about), [http://localhost:2368/contact](http://localhost:2368/contact) และ [http://localhost:2368/portfolio](http://localhost:2368/portfolio) ตามลำดับ


### `tag.hbs`

`tag.hbs` เป็นไฟล์ option เสริม เอาไว้สำหรับหน้า tag และหน้า Archive ของ Blog เรา หากไม่มีไฟล์นี้ ตัว Ghost ก็จะใช้เลเอาท์แบบหน้า `index.hbs` เราสามารถทำ custom tage ได้เหมือนกับ Page เลย โดยการตั้งชื่อไฟล์ ฟอแมตดังนี้ `tag-{{slug}}.hbs` เช่น tag เรื่อง Ghost `tag-ghost.hbs` 

### `author.hbs`

ไฟล์นี้ เอาไว้ทำ template สำหรับหน้า Author หากไม่มีไฟล์ `author.hbs` Ghost ก็จะใช้เลเอาท์แบบเดียวกันกับหน้า Index

### `error.hbs`

ไฟล์นี้เอาไว้สำหรับทำ custom 404 เวลาที่เว็บเราเกิดมี errors หาหน้าเว็บไม่เจอ ก็จะ render หน้านี้แทน ส่วนไฟล์ default มันจะอยู่ที่ `/core/server/views/user-error.hbs` 

### Partial

Partial เป็นคล้ายๆกับว่า เราสามารถที่จะ include ไฟล์อะไรก็ได้ ลงไปในไฟล์ hbs ที่เราต้องการ เช่น เราทำ partial ในส่วนของ script Google Analytics ไว้ ที่ไฟล์ชื่อ `analytics.hbs` ในโฟลเดอร์ `partial` เวลาที่เราจะแทรกโค๊ดนี้ลงไปในหน้า `index.hbs` เราก็แค่เรียก `{{> analytics}}`  รายละเอียดเพิ่มเติม พูดไว้ใน [Part 3 : Default Template & Partial](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part3)


## Template & Helper

Ghost มีส่วนของ Helper ที่เอาไว้ให้เราสามารถเรียกใช้ได้สะดวก เปรียบเหมือนกับ Wordpress มีพวก API เช่น `the_loop()`, `the_title()` อะไรพวกนี้  ส่วน Helper ของ Ghost จะใช้ syntax ของทาง Handlebars นะครับ  สำหรับ Helper ก็จะมีด้วยกัน 2 แบบคือ 

### Block Helpers

Block Helpers เริ่มต้น และ จบ tag ด้วย format นี้ `{{#foreach}}  {{/foreach}}`  ภายในบล็อค เราสามารถใส่ค่าได้ เช่น `{{title}}` หรือจะเป็น symbol เช่น `{{@index}}`

### Output Helpers

เป็นเหมือนกับการแสดง ผลลัพธ์ เช่น ข้อมูลเนื้อหาของโพส `{{content}}`  หรือ `{{body}}`

<a name="helper"></a>

### ตัวอย่างการใช้งาน Helper 

- วนลูป เพื่อแสดงโพสทั้งหมดในหน้า Index

```html
{{#foreach posts}}
    <h2>{{title}}</h2>
{{/foreach}}
```

- แสดงเนื้อหาของโพสด้วย

```html
{{#foreach posts}}
    <h2>{{title}}</h2>
    <p>{{content}}</p>
{{/foreach}}
```

หากเราอยากกำหนด ความยาวของตัวอักษร หรือ limit จำนวนคำ ก็สามารถใส่ option เพิ่มได้ เช่น

```
{{content words="50"}} 
หรือ 
{{content characters="100"}}
```

- ใช้ระบุ path ในโฟลเดอร์ assets โดยปกติเราอาจจะต้องใส่ path หรือ url แบบยาวๆ ได้เลย บางทีใส่ relative path ผิดบ้างก็มี ถ้าใช้ assets helper มาช่วยก็จะง่ายมาก เช่น

```html
<script type="text/javascript" src="{{asset "js/index.js"}}"></script>
```

ก็จะมีค่า เท่ากับ

```html
<script type="text/javascript" src="/assets/js/index.js?v=3eed1508c6"></script>
```

สำหรับ Helper อื่นๆ อ่านเพิ่มเติมต่อเองครับ [Helpers](http://themes.ghost.org/v5.2/docs/helpers)

> ลืมพูดถึง การ comment ในไฟล์ `.hbs` จะใช้ รูปแบบนี้ `{{! ข้อความในนี้คือ comment }}`


## Setup Theme & Free Template

เอาละ พูดถึง Concept หลักการและวิธีไปก็ยาวแล้ว ต่อมา ก็เริ่มลงมือทำ Theme ของเราเองเลยดีกว่า ผมตั้งชื่อ Theme ว่า `ghostahoy` ไฟล์พื้นฐานของผมตอนนี้มีแค่นี้ (ใส่ไฟล์ LICENSE เข้าไปด้วย)

```
├── assets
├── default.hbs
├── index.hbs
├── LICENSE
├── package.json
└── post.hbs
```

จากนั้นไฟล์ `package.json` ใส่รายละเอียดให้รู้ว่าเป็น Theme ชื่ออะไร และ version อะไร

```javascript
{
	"name": "ghostahoy",
	"version": "0.0.1"
}
```

ต่อมา สั่ง Start Server แล้วเข้าไปเปลี่ยน Theme จาก casper เป็น ghostahoy ที่ [http://localhost:2368/ghost/settings/general/](http://localhost:2368/ghost/settings/general/)

![GhostAhoy](images/2014/10/choose-ghostahoy-500x108.png)

แน่นอน หากเข้าหน้าเว็บ จะไม่เห็นอะไร เนื่องจาก Theme เรายังไม่มีไรเลย

สำหรับ Theme นี้ผมจะใช้ Template แจกฟรี จากเว็บนี้ครับ [Clean Blog](http://startbootstrap.com/template-overviews/clean-blog/)

[![CleanBox](images/2014/10/cleanblog.png)](http://startbootstrap.com/template-overviews/clean-blog/)

เมื่อดาวน์โหลดมา ก็เอาเฉพาะโฟลเดอร์ `css`, `fonts`, `img` และ `js` ก็อปปี้ไปไว้ในโฟลเดอร์ `assets` ใน Theme ของเรา ตอนนี้ไฟล์ทั้งหมดจะได้ดังนี้

```
├── assets
│   ├── css
│   │   ├── bootstrap.css
│   │   ├── bootstrap.min.css
│   │   ├── clean-blog.css
│   │   └── clean-blog.min.css
│   ├── fonts
│   │   ├── glyphicons-halflings-regular.eot
│   │   ├── glyphicons-halflings-regular.svg
│   │   ├── glyphicons-halflings-regular.ttf
│   │   └── glyphicons-halflings-regular.woff
│   ├── img
│   │   └── home-bg.jpg
│   └── js
│       ├── bootstrap.js
│       ├── bootstrap.min.js
│       ├── clean-blog.js
│       ├── clean-blog.min.js
│       ├── jquery.js
│       └── jquery.min.js
├── default.hbs
├── index.hbs
├── LICENSE
├── package.json
└── post.hbs
```

สำหรับตัวอย่างหน้า Index ของ Template Clean Blog จะมีลักษณะนี้

![Index](images/2014/10/clean-blog-index-713x1024.png)

และ หน้า Post จะเป็นแบบนี้

![Post](images/2014/10/clean-blog-post-353x1024.png)

สำหรับ Part 1 นี้ก็เป็นการรู้จักกับ Ghost ขั้นตอนการติดตั้ง การเตรียมความพร้อม และพูดถึง Concept ต่างๆรวมถึง File Structure & Helper สำหรับ [Part 2 : Create Theme, Index, Post](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part2) รอติดตามอ่านต่อ ในวันพรุ่งนี้นะครับ :D
