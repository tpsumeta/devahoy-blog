---
title: สอนสร้าง Theme Ghost เพื่อไปขาย Themeforest ตอนที่ 2
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

มาต่อที่ Part 2 กันเลยครับหลักจาก [Part 1](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part1) เราพูดถึง Ghost และการ Setup โปรเจ็คพื้นฐานได้แล้วนะครับ ตอนที่สิ่งที่ทุกคนเป็นก็คือ การติดตั้ง Ghost ลงบน localhost มีไฟล์ HTML Template ที่ดาวน์โหลดมาจาก [StartBootstrap](http://startbootstrap.com/template-overviews/clean-blog/) และพร้อมที่จะทำการ develop แล้ว 

ต่อไปก็คือการแปลง Template Clean-Blog จาก HTML ให้เป็น Template ของ Ghost กัน ก่อนอื่น หากท่านเพิ่งมาอ่าน ขอบอกว่า บทความนี้เป็น Part 2 จากทั้งหมด 5 บทความ ในซีรีย์ สอนเขียน Ghost Theme เพื่อขายบน Themeforest นะครับ ติดตามอ่านได้จากรายชื่อข้างล่างเลย

## Table of Contents

- [Part 1 : Overview and Setup Ghost](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part1)
- **Part 2 : Create Theme, Index, Post**
- [Part 3 : Default Template & Partial](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part3)
- [Part 4 : Navigation & Pagination](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part4)
- [Part 5 : Additional (Comment System)](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part5)
- [Source Code on Github](https://github.com/Devahoy/ghostahoy)

## Create Index Page

เริ่มต้น ทำการก็อปปี้ไฟล์ `index.html` ใน Template Clean-Blog มาใส่ในไฟล์ `index.hbs` ของเราเลยครับ แบบนี้

<script src="https://gist.github.com/Phonbopit/04163202000242619503.js?file=index.html"></script>

ด้านบน มันยังลิงค์ไปยังไฟล์ resource ของเราไม่ถูกต้องนะครับ เนื่องจากว่าเราเก็บไฟล์ assets ต่างๆ ไว้ในโฟลเดอร์ `assets` ฉะนั้นก็ทำการลิงค์ให้มันถูกต้องด้วยครับ จากโค๊ดด้านบน แก้พวก script ด้านล่างนี้ด้วย

<script src="https://gist.github.com/Phonbopit/04163202000242619503.js?file=index2.html"></script>

จากนั้นลองเปิดหน้าเว็บเราใหม่ [http://localhost:2368](http://localhost:2368) ต้องได้เหมือน Template ดังภาพ

![Index](images/2014/10/part2-index.png)

ทีนี้จะเห็นว่าบทความ มันไม่ได้มาจากบทความที่เราเขียนเลย แต่เป็นบทความที่ใส่ไว้ในหน้า index เท่านั้น ฉะนั้นเราก็จะมาแก้ส่วนนี้กัน ให้มันดึงโพสจากฐานข้อมูลของเรามาแสดง 

ลองสังเกตในไฟล์ `index.hbs` จะเห็นว่ามีส่วนที่เป็นการแสดงโพสอยู่ ก็คือ tag นี้ 

<script src="https://gist.github.com/Phonbopit/04163202000242619503.js?file=index.hbs"></script>

หนึ่งโพส จะมีครอบด้วย tag ด้านบน 1 ชุด แสดงถึง 1 โพส ฉะนั้น เราจะเปลี่ยนเป็นการใช้ Helper Class ของ Ghost เพื่อทำการวนลูปหาโพสทั้งหมด มาแสดงในหน้าแรก ก็จะได้ดังนี้

<script src="https://gist.github.com/Phonbopit/04163202000242619503.js?file=index-with-helper.hbs"></script>

- `{{#foreach posts}}` : หมายถึงการเริ่มวนลูป เพื่อหาจำนวนบทความทั้งหมดของเรา เหมือน `the_loop()` ใน Wordpress
- `{{url}}` : เป็นการแสดง url ของโพส จะใช้ได้ต้องอยู่ภายใน Post Context ซึ่ง `foreach posts` ก็คือการเรียก Post มาที่ละ Post
- `{{title}}` : แสดงชื่อ Title ของโพส เช่นเดียวกันกับ `{{url}}` คือต้องใช้ภายใน Post Context
- `{{excerpt character="80"}}` : คือการใช้ excerpt เป็นการตัดบทความ โดยกำหนดไว้ว่า ให้มีจำนวนตัวอักษรทั้งหมด ไม่เกิน 80 ตัวอักษร
- `{{author}}` : ก็เป็นการเรียก ใช้ Author ซึ่งปกติจะอยู่ในแต่ละ Post อยู่แล้ว ทำให้เราสามารถเรียกใช้เช่น `{{author.name}}` ชื่อผู้โพส - -- `{{author.bio}}` : รายละเอียดคนโพส ส่วน `{{author}}` เฉยๆ มันคือ Helper ที่แสดงชื่อคนโพส และลิงค์ไปหน้า Author ให้เลย
- `{{date format="MMMM DD, YYYY"}}` : เป็นการแสดงวันที่โพส โดยกำหนด format เป็น เดือน วันที่, ปี

เข้าไปเพิ่มบทความให้เว็บเราซักเล็กน้อย

![Add Content](images/2014/10/ghost-content-500x308.png)

ต่อมาลองเปิดหน้าเว็บดูอีกครั้ง [http://localhost:2368](http://localhost:2368) จะเห็นโพสของเราแล้ว 

![Complete Index](images/2014/10/ghost-create-index-471x1024.png)

หน้า Index ก็ถือว่าเป็นอันเรียบร้อย :D


## Create Post & Page

ต่อมาสร้างหน้า Post เอาไว้สำหรับเข้าไปดูรายละเอียด ของแต่ละโพส ทำเหมือนกันกับ Index เลย คือไปก็อปหน้า `post.html` ของ Template Clean Blog มาไว้ในไฟล์ `post.hbs` ดังนี้

<script src="https://gist.github.com/Phonbopit/04163202000242619503.js?file=post.html"></script>

จากนั้นก็แก้ไข path assets ให้ตรงเหมือนกันกับ Index (จะเห็นว่าโค๊ดเรายาว และมีหลายๆจุดที่โค๊ดเราซ้ำๆใช่มั้ยครับ หากมี 1-2ไฟล์ ก็ยังคงไม่ค่อยมีปัญหาเท่าไหร่ แต่หากลองคิดดู หากเรามี 10-20 หน้า ต้องมานั่งเปลี่ยน assets ก็อปโค๊ดยาวๆ คงไม่ดีแน่ นั่นแหละครับ จึงเกิดเป็นการใช้ default template และ partial ขึ้นมา เดียวใน Step ถัดไปจะมีการพูดถึงครับ

ทีนี้ลองเข้าหน้าเว็บ แล้วกดเข้าไปโพสไหนก็ได้ เพื่อจะดูว่าหน้า `post.hbs` มันเวิร์คหรือไม่ ??

จะเห็นหน้าเว็บมันเสีย ทำไมมันมองไม่เห็นไฟล์ css ทั้งที่เราเซทค่าแบบเดียวกันกับหน้า Index เมื่อลองดูโค๊ด จะเห็นว่ามันลิงค์ไปหน้านี้

```
http://localhost:2368/post-title/assets/css/clean-blog.min.css/
```

ซึ่งถ้าหาก อยู่หน้าแรก ไฟล์ css มันยังคงเรียกไปถูก แต่เมื่อไหร่ที่มันไปหน้า อื่น มันดันลิงค์ไปผิด path ทำให้หา Path ของ css จริงๆ ไม่เจอ วิธีแก้คือใช้ Assets Helper ครับ  เปลี่ยนตรงแท็กทั้งหมดเป็นแบบนี้

<script src="https://gist.github.com/Phonbopit/04163202000242619503.js?file=post2.html"></script>

- `{{asset "path/to/style.css"}}` : คือ Asset Helper ซึ่งช่วยให้เราระบุ Relative Path ได้อย่างถูกต้อง โดยจะอ้างอิง relative กับโฟลเดอร์ `assets` ของเรา 

ลองเข้าหน้าเว็บอีกรอบ คราวนี้ไม่มีปัญหาแล้ว

ต่อมา ในไฟล์ มีอะไรก็ไม่รู้เต็มไปหมดเลย ไม่ใช่โพสที่เราเขียนเองซักหน่อย เราจะแก้ไขโดยการแสดงเนื้อหาจริงๆ ของโพสนี้กัน ลองสังเกตว่า โพสจะอยู่ภายในแท็ก article และมี meta-post อยู่ในส่วน header แบบนี้

```html
<header>
    {{meta-post}}
</header>
<article>
    {{post}}
</article>
```

ฉะนั้น เราก็ทำการเปลี่ยนแปลง โดยลบ header และ article ทั้งหมดทิ้ง แล้วใช้ Helper แทน ดังนี้

<script src="https://gist.github.com/Phonbopit/04163202000242619503.js?file=post.hbs"></script>

จากโค๊ดด้านบน สิ่งที่ไม่เปลี่ยนคือ Header Background จะใช้รูปเดียวกันกับหน้า Home ส่วนนี้เดียวจะเอาไว้ปรับแต่งที่หลัง คือเราสามารถเลือกใช้ Image ของแต่ละโพสได้ (Post Image)

- `{{#post}}` และ `{{/post}}` : หมายถึงการเรียกข้อมูลของ Post หากเราไม่ใส่ ค่าที่ได้จะเป็น `undefined`
- `{{title}}` : แสดง Title ของโพส
- `{{excerpt words="20"}}` : แสดง Excerpt ของโพส โดยจำกัดที่ 20 คำ
- `{{author}}` : แสดงชื่อ Author และลิงค์ไปยังหน้า Author ด้วย
- `{{date format="MMMM DD, YYYY"}}` : แสดงวันที่ ฟอแมตเดียวกันกับหน้า Index
- `{{tags separator=" | " prefix="Tagged in:"}}` : คือการแสดง Tag โดยจะได้เป็น List รายชื่อของ Tag แต่ว่ามีออปชั่นเพิ่มขึ้นมา 2 อย่างคือ
    - `separator` : หมายถึง หากมีหลายๆ Tag เราจะใช้อะไรแบ่ง หรือขั้นระหว่าง Tag ในที่นี้ใช้ | (pipe)
    - `prefix` : หมายถึง คำขึ้นต้น ก่อนที่จะแสดง Tag List


เมื่อลองเข้าหน้า บทความ ไหนก็ได้ ก็จะสามารถเห็นเนื้อหาของบทความนั้นๆ ได้อย่างถูกต้อง ดังรูป

![Post](images/2014/10/part2-post.png)

โอเค ตอนนี้เราก็สามารถที่จะทำ Index และ Post ได้แล้ว แต่ยังมีโค๊ดหลายๆส่วนยังดูเยอะ และจัดการลำบากอยู่ ใน [Part 3](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part3) เราจะมาพูดถึง Default Template และ Partial กันครับ เพื่อทำให้มันสะดวกขึ้น คอยติดตามในวันพรุ่งนี้นะครับ :D
