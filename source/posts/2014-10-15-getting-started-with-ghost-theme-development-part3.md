---
title: สอนสร้าง Theme Ghost เพื่อไปขาย Themeforest ตอนที่ 3
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
วันนี้มาต่อเรื่อง สอนทำ Theme Ghost เพื่อขายบน Themeforest ใน Part ที่ 3 ครับ สำหรับ Part 3 จะมาพูดถึงเรื่อง Default Template และ Partial กัน 

หลังจากก่อนหน้านี้ เราสามารถ ทำ Index และ Post ได้แล้ว หากใครยังไม่เคยอ่าน Part ก่อนๆ แนะนำให้อ่านก่อนครับ จากลิงค์ข้างล่างเลย

## Table of Contents

- [Part 1 : Overview and Setup Ghost](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part1)
- [Part 2 : Create Theme, Index, Post](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part2)
- **Part 3 : Default Template & Partial**
- [Part 4 : Navigation & Pagination](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part4)
- [Part 5 : Additional (Comment System)](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part5)
- [Source Code on Github](https://github.com/Devahoy/ghostahoy)

## Default Template

มาต่อกันเลย จะเห็นว่า ทั้ง Index และ Post จะมีส่วน Head และ Footer ที่เหมือนกัน ทำไมเราไม่ทำให้มันจัดการง่ายๆ โดยการใช้ Default Template ละ

อย่างที่ได้พูดไว้ใน Part 1 ว่า Default Template หรือตัว Base Template มันเป็นเหมือนคล้ายๆ Blue Print หรือเราวางโครงสร้างไว้ละ ว่า Template นี้มี Header แบบนี้นะ มี Footer แบบนี้นะ แต่สิ่งที่อยากให้มันต่างกันก็คือ ในส่วนของ content โดยการใช้แท็ก `{{{body}}}` เพื่อบอกให้รู้ว่า ไฟล์ไหน ที่คุณจะมาใช้ Default Template โค๊ดทั้งหมดในไฟล์นั้น จะถูกแทนที่ด้วย `{{{body}}}`  และ ไฟล์ไหนที่จะใช้ Default Template ก็จะต้องกำหนด `{{!< default}}` ไว้ที่บรรทัดบนสุดของไฟล์ด้วย


ฉะนั้น เราย้ายมันไปไว้ที่ไฟล์ `default.hbs` เลยครับ จะได้ไฟล์ `default.hbs` เป็นดังนี้

<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=default.hbs"></script>

ที่นี้ไฟล์ด้านบน มันยังไม่เป็น Helper เท่าไหร่ ก็จัดการเพิ่มให้มัน ดังนี้ (โค๊ดข้างล่างผมย่อมาจากข้างบนนะครับ อยากเช่นในแท็ก footer ก็จะเหลือแค่ 

```html
<footer>...</footer>
```

<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=default2.hbs"></script>

จากโค๊ดด้านบน 

- `{{meta_title}}` : แสดง Title ของ Post เป็น Title ของ Browser
- `{{meta_description}}` : แสดง description ในแท็ก meta
- `{{ghost_head}}` : ใส่ไว้ก่อน ปิดแท็ก `</head>` เป็นฟังค์ชันของ Ghost เพื่อเอาไว้แสดง script, style และ meta tags. ตัว Ghost จะ generate พวก rss, `rel="canonical"` เป็นต้น
- `{{ghost_foot}}` : ใส่ไว้ก่อนปิดแท็ก `</body>` และก่อนใช้งาน javascript ของเรา ส่วนนี้ Ghost จะเอาไว้เรียกใช้ jquery หากเรามี jquery อยู่แล้ว ก็ไม่จำเป็นต้องเรียก Helper นี้ก็ได้
- `{{{body}}}` : สำคัญสุดเลย Template ไหนที่มีการเรียกใช้หน้า Default มันก็จะเอาของหน้านั้น มาใส่ใน tag `{{{body}}}` นี้แหละ (สังเกตว่าต้องเป็น { 3 ตัวนะครับ ไม่ใช่ 2 ตัว)

ทีนี้เมื่อได้หน้า `default.hbs` แล้ว ต่อไป ก็แก้หน้า `index.hbs` ใ้ห้มันทำการใช้ `default.hbs` เป็น Default Template ซะ โดยเพิ่ม 

```
{{!< default}}
```

ไว้ที่บรรทัดบนสุดของไฟล์เลย และทำการแก้ไขหน้า `post.hbs` ด้วยเช่นกัน

สุดท้าย ตอนนี้หน้า `index.hbs` และหน้า `post.hbs` ของเราก็จะเหลือโค๊ดสั้นๆแค่นี้ (จริงๆยังสั้นได้อีก ด้วยการใช้ Partial เอาไว้พูดในหัวข้อถัดไป)

`index.hbs`

<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=index.hbs"></script>

ไฟล์ `post.hbs`

<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=post.hbs"></script>

<a name="partial"></a>

## Partial

ต่อมาดูเรื่อง Partial กันครับ, Partial นั้นเป็น Handlebars Template โดยการทำการจะคล้ายๆกับกรณีของ `default.hbs` ต่างกันที่เราทำ Template ขึ้น 1 อัน จาก จากนั้นเวลาจะใช้ Template นี้ ก็แทรกลงไปที่ส่วนที่เราต้องการเลย

วิธีการก็คือ เริ่มต้น ทำการสร้างโฟลเดอร์ `partials` ขึ้นมาใน Theme ของเรา แบบนี้

![Add Partials](images/2014/10/partials-folder.png)

ต่อมา เราสร้างไฟล์ `header_index.hbs` ในโฟลเดอร์ `partials` ดังนี้

<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=header_index.hbs"></script>

แล้วไฟล์ `index.hbs` ตรงส่วน header ที่เราก็อปมาไว้ `header_index.hbs` ก็เหลือแค่นี้

```
{{> header_index}}
```

แท็ก `{{> file_name}}` คือเพื่อมองหาไฟล์ และเรียกใช้ไฟล์ในโฟลเดอร์ `partials`

> การเพิ่ม folder partials จำเป็นต้อง restart server ใหม่นะครับถึงจะเห็นการเปลี่ยนแปลง

เช่นเดียวกัน ทำแบบนี้กับหน้า `post.hbs` โดยก็อปในส่วน header ไปเซฟไว้ในไฟล์ `header_post.hbs`


<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=header_post.hbs"></script>

และตรงส่วน header ในไฟล์ `post.hbs` ถูกแทนที่ด้วย 

```
{{> header_post}}
```

จะเห็นว่า โค๊ดของเรา เริ่มมีการจัดระเบียบ เป็นหมวดหมู่ง่ายต่อการแก้ไข พัฒนามากขึ้น ต่อไปดูที่ไฟล์ `default.hbs` มีส่วน navigation และ footer ที่ดูแล้ว น่าจะแยก template ออกมาอีก ก็เลยจัดการเพิ่ม ไฟล์ `navigation.hbs` และ `footer.hbs` ในโฟลเดอร์ `partials` เข้าไป 

<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=navigation.hbs"></script>

<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=footer.hbs"></script>

ตอนนี้สังเกตว่าไฟล์ `default.hbs` ของเราในส่วน `body` นั้น clean และสะอาดมากขึ้น เวลาเราจะแก้ส่วนไหน ก็ไปเปิดไฟล์ใน partials ได้ประโยชน์ทั้งความเป็นระเบียบ และรู้ว่า หากแก้ไขแล้วมี error ก็จะรู้ว่ามาจากไฟล์นี้ 

<script src="https://gist.github.com/Phonbopit/18252438dd74bd1adc3a.js?file=default-clean.hbs"></script>

โอเค สำหรับเรื่อง Default Template และ Partial ก็มีแค่นี้ครับ แต่ยังเห็นว่า Theme ของเรายังมีหลายๆส่วนที่ยังไม่ได้แก้ไข เช่น ตรงส่วน Navigation ยังเป็นชื่อ Start Bootstrap หรือ menu ยังลิงค์ไปไม่ถูกต้อง ใน [Part 4](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part4) เราจะมาพูดถึงเรื่องเหล่านี้กันครับ ติดตามอ่านได้ในวันพรุ่งนี้ :D
