---
title: สอนสร้าง Theme Ghost เพื่อไปขาย Themeforest ตอนที่ 4
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

มาต่อกันที่ Part ที่ 4 นะครับ หลังจากที่ก่อนหน้านี้ เราได้รู้จักว่าการทำ Theme Ghost ต้อง Setup ยังไง  มีไฟล์พื้นฐานอะไรบ้าง รู้จักหน้า Index หน้า Post ได้รู้จัก Default Template รวมถึง Partial สำหรับ Part 4 มันก็คือการต่อยอดมาจาก Part ที่แล้วนะครับ ตอนนี้เรื่องหลักๆ ใน Ghost คิดว่าน่าจะหมดแล้ว เหลือแค่ นำมาต่อยอด แก้ไข ดัดแปลงนิดๆ หน่อยเท่านั้น

หากใครยังไม่เคยอ่าน Part ก่อนๆ แนะนำให้อ่านก่อนครับ จากลิงค์ข้างล่างเลย

## Table of Contents

- [Part 1 : Overview and Setup Ghost](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part1)
- [Part 2 : Create Theme, Index, Post](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part2)
- [Part 3 : Default Template & Partial](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part3)
- **Part 4 : Navigation & Pagination**
- [Part 5 : Additional (Comment System)](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part5)
- [Source Code on Github](https://github.com/Devahoy/ghostahoy)

ในส่วนของ Part นี้ สิ่งที่เราจะทำคือ 

- สร้างหน้า Page 
- ปรับแต่ง Navigation ให้แสดงได้ถูกต้อง ลิงค์ไปถูกหน้า
- ปรับแต่ง Pagination ในแบบฉบับเราเอง

## สร้างหน้า Page

เริ่มต้นทำการสร้างหน้า Page และ Template Page กันครับ ในตัวอย่าง เป้าหมายใน Navigation ของเรา จะให้มีแค่เมนูหน้า Home, About และ Contact เท่านั้น ทำให้เวลาเราสร้าง Page เราสร้างแค่สองไฟล์คือ 

- `page-contact.hbs` : ไฟล์นี้เป็นไฟล์ Page เฉพาะหน้า contact 
- `page.hbs` : ไฟล์นี้เป็นเหมือน Page Template หากเราไม่ได้ระบุ `page-{{slug}}.hbs` ทุกหน้าที่เป็น Page ก็จะใช้ Template ตัวนี้ หากไฟล์ตัวนี้ไม่มีอีก มันก็จะใช้เลเอาท์ของหน้า `post.hbs`


สำหรับการสร้างหน้า Page มีขั้นตอนดังนี้
1. เข้าหน้าบทความ แล้วปรับเป็น "Turn this post into a static page" ในหน้า Dashboard ของบทความ 
2. สร้างไฟล์ `page-{{slug}}.hbs` ขึ้นมา หากไม่มี `page.hbs` หรือ `page-{{slug}}.hbs` ก็จะใช้หน้า `post.hbs` แทน

สำหรับขั้นตอนแรก ที่ใช้การปรับเป็น Static Page หน้าตาเลเอาท์ทุกอย่างของ Page จะเหมือน Post ทุกอย่าง คือใช้ไฟล์ `post.hbs`  

ฉะนั้นตอนนี้ หากเราเข้าหน้า [http://localhost:2368/about](http://localhost:2368/about) ก็จะใช้เลเอาท์ในไฟล์ `page.hbs` 
และเมื่อเข้าหน้า [http://localhost:2368/contact](http://localhost:2368/contact) ก็จะใช้เลเอาท์ไฟล์ `page-contact.hbs`

ตัวไฟล์ `page-contact.hbs` มีดังนี้

```hbs
{{!< default}}
 
{{> header_contact}}
 
<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
            <p>Want to get in touch with me? Fill out the form below to send me a message and I will try to get back to you within 24 hours!</p>
            <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
            <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
            <!-- NOTE: To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
            <form name="sentMessage" id="contactForm" novalidate>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Name</label>
                        <input type="text" class="form-control" placeholder="Name" id="name" required data-validation-required-message="Please enter your name.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Email Address</label>
                        <input type="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Phone Number</label>
                        <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required data-validation-required-message="Please enter your phone number.">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="row control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Message</label>
                        <textarea rows="5" class="form-control" placeholder="Message" id="message" required data-validation-required-message="Please enter a message."></textarea>
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <br>
                <div id="success"></div>
                <div class="row">
                    <div class="form-group col-xs-12">
                        <button type="submit" class="btn btn-default">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
 
<hr>
```

รวมถึงสร้าง `header_contact.hbs` ขึ้นมาเพื่อเก็บในส่วน header ของ contact ด้วย ดังนี้

```hbs
<header class="intro-header" style="background-image: url('{{asset "img/home-bg.jpg"}}')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="page-heading">
                    <h1>Contact Me</h1>
                    <hr class="small">
                    <span class="subheading">Have questions? I have answers (maybe).</span>
                </div>
            </div>
        </div>
    </div>
</header>
```


> การทำ Page ใน Ghost เราจำเป็นที่จะต้องสร้าง Post ขึ้นมาให้ url ตรงกันกับ Page และปรับเป็น Static Page นะครับ ตัว Page ถึงจะทำงาน ไม่อย่างงั้นก็จะเจอ 404 Error 


## Navigation 

จะเห็นว่า Navigation เดิมของเรา ยังไม่ถูกต้อง ฉะนั้นเปลี่ยนให้ถูกต้องซะ โดยเมนู เราจะมีแค่ Home, About และ Contact 

เปิดไฟล์ `partials/navigation.hbs` ขึ้นมา จากนั้น แก้ไขดังนี้

จาก 

```html
<a class="navbar-brand" href="index.html">Start Bootstrap</a>
 
<ul class="nav navbar-nav navbar-right">
    <li>
        <a href="index.html">Home</a>
    </li>
    <li>
        <a href="about.html">About</a>
    </li>
    <li>
        <a href="post.html">Sample Post</a>
    </li>
    <li>
        <a href="contact.html">Contact</a>
    </li>
</ul>
```

เปลี่ยนเป็น

```html
<a class="navbar-brand" href="{{@blog.url}}">{{@blog.title}}</a>
<ul class="nav navbar-nav navbar-right">
    <li>
        <a href="{{@blog.url}}">Home</a>
    </li>
    <li>
        <a href="{{@blog.url}}/about">About</a>
    </li>
    <li>
        <a href="{{@blog.url}}/contact">Contact</a>
    </li>
</ul>
```

- `{{@blog.url}}` : เป็น Global Helper ที่เอาไว้แสดง ๊URL ของ Blog เรา ค่านี้เราสามารถตั้งค่าได้ที่ไฟล์ `config.js` ในโฟลเดอร์ Ghost
- `{{@blog.title}}` : ส่วนนี้คือ Blog Title เราสามารถไปตั้งค่า ได้จากหน้า Settings ครับ

ต่อมาเปิดไฟล์ `partials/header_index.hbs` ขึ้นมา แล้วแก้ไขเป็นแบบนี้

```hbs
<!-- Page Header -->
<!-- Set your background image for this header on the line below. -->
<header class="intro-header" 
{{#if @blog.logo}}
    style="background-image: url('{{@blog.logo}}')">
{{else}}
    style="background-image: url('assets/img/home-bg.jpg')">
{{/if}}
 
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="site-heading">
                    <h1>{{@blog.title}}</h1>
                    <hr class="small">
                    <span class="subheading">{{@blog.description}}</span>
                </div>
            </div>
        </div>
    </div>
</header>
```

- `{{#if }}` , `{{else}}` และ `{{/if}}` : เป็น Condition Helper ที่เอาไว้ช่วยให้เราสามารถแทรก If Statement ลงไปในไฟล์ hbs ได้ อย่างกรณีนี้คือ เช็คว่า บล็อคนี้มีโลโก้หรือไม่ ถ้ามี ก็ให้แสดงโลโก้ ถ้าไม่มีก็ให้ใช้ไฟล์ใน `assets/img/home-bg.jpg` แทน
- `{{@blog.logo}}` : เป็น Global Helper ที่เอาไว้แสดง Logo ของ Blog
- `{{@blog.description}}` : เป็น Global Helper เช่นกัน เอาไว้แสดง Description ของ Blog

สำหรับ Logo และ Description เราสามารถไปเปลี่ยนค่าได้จากหน้า Dashbaord => Settings หรือเข้า url นี้ [http://localhost:2368/ghost/settings/general/](http://localhost:2368/ghost/settings/general/)

เมื่อลองกดเข้าหน้า [http://localhost:2368/](http://localhost:2368/) จะเห็นว่าหน้าตาบล็อคของเรา เปลี่ยนโลโก้และคำอธิบาย ได้ถูกต้องแล้ว

![Index with Logo](images/2014/10/part4-index.png)

> Credit Image : [Thaweepong Grunge](https://www.facebook.com/profile.php?id=100000041706306) ใครสนใจจ้างทำ Graphic Design หรือว่า Traditional Art ติดต่อได้นะครับ

และเมื่อลบ Logo ออก ก็จะแสดง Logo พื้นฐาน ที่ไฟล์ `assets/img/home-bg.jpg` ได้ถูกต้อง ดังที่ตั้งไว้ในเงื่อนไข

ต่อมา ทำแบบนี้กับหน้า Post บ้าง เปิดไฟล์ `header_post.hbs` และแก้ไขไฟล์ดังนี้ (เปลี่ยนแค่เฉพาะส่วน `header`)

```hbs
<header class="intro-header" 
{{#if image}}
    style="background-image: url('{{image}}')">
{{else}}
    style="background-image: url('{{asset "img/home-bg.jpg"}}')">
{{/if}}
```

ด้านบนจะคล้ายๆกับ `header_index.hbs` คือ เป็น If statement เพื่อเช็คว่า โพสนี้มีการตั้ง Post Image ไว้หรือไม่ ถ้ามี ก็ให้แสดง ถ้าไม่มีก็ใช้รูป default

- `{{image}}` : เป็น Helper ที่เอาไว้แสดง Post Image ในส่วนของ Post Image สามารถเพิ่มได้ในหน้า Dashboard ในส่วน Settings จะมีให้ปรับแต่งอยู่ครับ

![Post Image](images/2014/10/part4-add-image.png)

เมื่อลองเข้าหน้า โพสที่ไม่ได้ตั้งค่า Post Image ก็จะเห็นความแตกต่างครับ โดยโพสที่ตั้งค่า Image ไว้ก็จะแสดง Image ได้อย่างถูกต้องนั่นเอง

## Pagination

สำหรับ Ghost มี Pagination helper มาให้เราใช้งานอยู่ครับ การใส่ Pagination ใน Ghost จะใช้ syntax นี้ `{{pagination}}` โดย Ghost จะไปเรียกไฟล์ `core/server/helpers/tpl/pagination.hbs` 

ทีนี้ลองเพิ่มส่วน Page ไปในไฟล์ `index.hbs` ร่วมกันกับ Pager เดิมเลยครับ

```html
{{pagination}}
<!-- Pager -->
<ul class="pager">
    <li class="next">
        <a href="#">Older Posts &rarr;</a>
    </li>
</ul>
```

หน้าเว็บเรา ส่วนล่างจะเห็น ลักษณะนี้

![Page](images/2014/10/part4-page.png)

> เราสามารถปรับว่า ใน 1 หน้า เราจะให้แสดงกี่โพสได้ ในหน้า Settings 

ต่อมา เราอยากทำการ Override ตัว Pagination ของ Ghost เป็นแบบของเราเองได้โดยการสร้างไฟล์ `pagination.hbs` เซฟไว้ในโฟลเดอร์ `partials` ดังนี้

ไฟล์ `pagination.hbs`

```hbs
<!-- Pager -->
<ul class="pager">
    {{#if prev}}
    	<li class="previous">
    		<a href="{{page_url prev}}">&larr; Newer Posts</a>
    	</li>
    {{/if}}
    {{#if next}}
    	<li class="next">
    		<a href="{{page_url next}}">Older Posts &rarr;</a>
    	</li>
    {{/if}}
</ul>
```

อธิบายโค๊ดด้านบน

- `{{#if prev}}` : เป็นการเช็คว่า มีหน้า Previous หรือไม่ (ส่วนนี้เป็น function ของ Ghost เอง) ถ้ามี ก็ให้แสดง ปุ่ม `Newer Posts` คือไปหน้าก่อนหน้า เช่น จากหน้า 2 ไปหน้า 1
- `{{#if next}}` : เช่นกัน เช็คว่า มีหน้าที่ใหม่ กว่านี้อีกมั้ย ถ้ามีก็ให้โชว์คำว่า `Older Post` เพื่อจะไปหน้าถัดไป คือจากหน้า 1 ไปหน้า 2
- `{{page_url}}` : คือ URL หน้าปัจจุบันของเรา ส่วนออปชั่น `prev` และ `next` เป็น built-in ของ Ghost จะแสดงให้เองว่า ลิงค์หน้าต่อไปของ Next เป็นอะไร ลิงค์ก่อนหน้า Prev เป็นอะไร
- `{{page}}` และ `{{pages}}` : ในส่วนนี้ไม่ได้ใส่ไป แต่เราสามารถใส่ค่า สองค่านี้ลงไปได้ เพื่อแสดง ว่าเราอยู่ในหน้าที่เท่าไหร่ จากทั้งหมด กี่หน้า

เมื่อทำการ override Pagination ของเราเอง ก็ต้องสั่ง restart server ก่อนถึงจะเห็นผล ลองทดสอบเข้าเว็บใหม่อีกครั้ง จะเห็น Pagination ดังรูป

![New](images/2014/10/newer-post.png)

![Old](images/2014/10/older-post.png)

สุดท้ายไฟล์ `footer.hbs` เราแก้ไขในส่วนของ Copyright บรรทัดนี้

```html
<p class="copyright text-muted">Copyright &copy; Your Website 2014</p>
```

เป็น

```hbs
<p class="copyright text-muted">Copyright &copy; {{@blog.title}} {{date format="YYYY"}}</p>
```

ส่วนลิงค์ Social อื่นๆ ก็ใส่ลิงค์ที่ต้องการลงไปครับ


เรียบร้อย สำหรับ Navigation, page และ Pagination จริงๆตอนนี้แค่ Part4 ก็ถือว่าเป็น Blog เสร็จแล้วนะครับ หากใครที่อ่านมาถึง Part นี้คิดว่าน่าจะพอเห็นภาพ และสามารถที่จะไปปรับแต่ง และทำ Theme ของตัวเองขึ้นมาได้  หวังว่าในอนาคต จะมี Theme Ghost ที่เขียนด้วยคนไทย ออกมาขายกันเยอะๆนะครับ ตอนนี้ Ghost ยังเป็นตลาดใหม่อยู่ หากเราได้เป็นเจ้าแรกๆที่ขายได้ ก็น่าจะได้เปรียบอยู่นะครับ ถึงแม้ว่าอัตราความนิยม ยังสู่ Wordpress ไม่ได้ก็ตาม 

ขอให้โชคดีครับ :D

สำหรับ [Part 5 Part สุดท้าย](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part5) จะพูดถึงพวก ส่วนเสริมครับ เช่น การใส่ Comment การใช้ Syntax Highlighter เป็นต้นครับ
