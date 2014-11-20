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

```html
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="{{meta_description}}">
    <meta name="author" content="">

    <title>{{meta_title}}</title>

    <!-- Bootstrap Core CSS -->
    <link href="{{asset "css/bootstrap.min.css"}}" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="{{asset "css/clean-blog.min.css"}}" rel="stylesheet">

    <!-- Github CSS -->
    <link href="{{asset "css/github.css"}}" ref="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
```

ที่นี้ไฟล์ด้านบน มันยังไม่เป็น Helper เท่าไหร่ ก็จัดการเพิ่มให้มัน ดังนี้ (โค๊ดข้างล่างผมย่อมาจากข้างบนนะครับ อยากเช่นในแท็ก footer ก็จะเหลือแค่ 

```html
<footer>...</footer>
```

ต่อมา

```hbs
<head>
    ...
    <meta name="description" content="{{meta_description}}">
    <title>{{meta_title}}</title>
    ...
    {{ghost_head}}
</head>
 
<body>
 
    <!-- Navigation -->
    <nav>
        ....
    </nav>
 
    {{{body}}}
 
    <!-- Footer -->
    <footer>
        ...
    </footer>
 
    {{ghost_foot}}
    
    <!-- jQuery -->
    <!-- Javascript -->
</body>
</html>
```

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

```hbs
{{!< default}}
 
<!-- Page Header -->
<!-- Set your background image for this header on the line below. -->
<header class="intro-header" style="background-image: url('assets/img/home-bg.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="site-heading">
                    <h1>Clean Blog</h1>
                    <hr class="small">
                    <span class="subheading">A Clean Blog Theme by Start Bootstrap</span>
                </div>
            </div>
        </div>
    </div>
</header>
 
<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
 
            {{#foreach posts}}
                <div class="post-preview">
                    <a href="{{url}}">
                        <h2 class="post-title">{{title}}</h2>
                        <h3 class="post-subtitle">{{excerpt character="80"}}</h3>
                    </a>
                    <p classs="post-meta">Posted by {{author}} on {{date format="MMMM DD, YYYY"}}</p>
                </div>
                <hr>
            {{/foreach}}
 
            <!-- Pager -->
            <ul class="pager">
                <li class="next">
                    <a href="#">Older Posts &rarr;</a>
                </li>
            </ul>
        </div>
    </div>
</div>
 
<hr>
```

ไฟล์ `post.hbs`

```hbs
{{!< default}}
 
{{#post}}
    <header class="intro-header" style="background-image: url('{{asset "img/home-bg.jpg"}}')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-heading">
                        <h1>{{title}}</h1><h2 class="subheading">{{excerpt words="20"}}</h2>
 
                        <span class="meta">Posted by {{author}} on {{date format="MMMM DD, YYYY"}}</span>
                        <span class="meta">{{tags separator=" | " prefix="Tagged in:"}}</span>
 
                    </div>
                </div>
            </div>
        </div>
    </header>
 
    <article>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    {{content}}
                </div>
            </div>
        </div>
    </article>
 
    <hr>
{{/post}}
```

<a name="partial"></a>

## Partial

ต่อมาดูเรื่อง Partial กันครับ, Partial นั้นเป็น Handlebars Template โดยการทำการจะคล้ายๆกับกรณีของ `default.hbs` ต่างกันที่เราทำ Template ขึ้น 1 อัน จาก จากนั้นเวลาจะใช้ Template นี้ ก็แทรกลงไปที่ส่วนที่เราต้องการเลย

วิธีการก็คือ เริ่มต้น ทำการสร้างโฟลเดอร์ `partials` ขึ้นมาใน Theme ของเรา แบบนี้

![Add Partials](images/2014/10/partials-folder.png)

ต่อมา เราสร้างไฟล์ `header_index.hbs` ในโฟลเดอร์ `partials` ดังนี้

```hbs
<!-- Page Header -->
<!-- Set your background image for this header on the line below. -->
<header class="intro-header" style="background-image: url('assets/img/home-bg.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="site-heading">
                    <h1>Clean Blog</h1>
                    <hr class="small">
                    <span class="subheading">A Clean Blog Theme by Start Bootstrap</span>
                </div>
            </div>
        </div>
    </div>
</header>
```

แล้วไฟล์ `index.hbs` ตรงส่วน header ที่เราก็อปมาไว้ `header_index.hbs` ก็เหลือแค่นี้

```
{{> header_index}}
```

แท็ก `{{> file_name}}` คือเพื่อมองหาไฟล์ และเรียกใช้ไฟล์ในโฟลเดอร์ `partials`

> การเพิ่ม folder partials จำเป็นต้อง restart server ใหม่นะครับถึงจะเห็นการเปลี่ยนแปลง

เช่นเดียวกัน ทำแบบนี้กับหน้า `post.hbs` โดยก็อปในส่วน header ไปเซฟไว้ในไฟล์ `header_post.hbs`


```hbs
<header class="intro-header" style="background-image: url('{{asset "img/home-bg.jpg"}}')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-heading">
                    <h1>{{title}}</h1><h2 class="subheading">{{excerpt words="20"}}</h2>
 
                    <span class="meta">Posted by {{author}} on {{date format="MMMM DD, YYYY"}}</span>
                    <span class="meta">{{tags separator=" | " prefix="Tagged in:"}}</span>
 
                </div>
            </div>
        </div>
    </div>
</header>
```

และตรงส่วน header ในไฟล์ `post.hbs` ถูกแทนที่ด้วย 

```
{{> header_post}}
```

จะเห็นว่า โค๊ดของเรา เริ่มมีการจัดระเบียบ เป็นหมวดหมู่ง่ายต่อการแก้ไข พัฒนามากขึ้น ต่อไปดูที่ไฟล์ `default.hbs` มีส่วน navigation และ footer ที่ดูแล้ว น่าจะแยก template ออกมาอีก ก็เลยจัดการเพิ่ม ไฟล์ `navigation.hbs` และ `footer.hbs` ในโฟลเดอร์ `partials` เข้าไป 

`ไฟล์ navigation.hbs`

```hbs
<!-- Navigation -->
<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Start Bootstrap</a>
        </div>
 
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
```

`ไฟล์ footer.hbs`

```hbs
<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <ul class="list-inline text-center">
                    <li>
                        <a href="#">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>
                </ul>
                <p class="copyright text-muted">Copyright &copy; Your Website 2014</p>
            </div>
        </div>
    </div>
</footer>
```

ตอนนี้สังเกตว่าไฟล์ `default.hbs` ของเราในส่วน `body` นั้น clean และสะอาดมากขึ้น เวลาเราจะแก้ส่วนไหน ก็ไปเปิดไฟล์ใน partials ได้ประโยชน์ทั้งความเป็นระเบียบ และรู้ว่า หากแก้ไขแล้วมี error ก็จะรู้ว่ามาจากไฟล์นี้ 

```hbs
<!DOCTYPE html>
<html lang="en">
    ....
    ....
 
<head>
    {{ghost_head}}
</head>
<body>
 
{{> navigation}}
 
{{{body}}}
 
{{> footer}}
 
{{ghost_foot}}
 
<!-- Bootstrap Core JavaScript -->
<script src="{{asset "js/bootstrap.min.js"}}"></script>
 
<!-- Custom Theme JavaScript -->
<script src="{{asset "js/clean-blog.min.js"}}"></script>
</body>
```

โอเค สำหรับเรื่อง Default Template และ Partial ก็มีแค่นี้ครับ แต่ยังเห็นว่า Theme ของเรายังมีหลายๆส่วนที่ยังไม่ได้แก้ไข เช่น ตรงส่วน Navigation ยังเป็นชื่อ Start Bootstrap หรือ menu ยังลิงค์ไปไม่ถูกต้อง ใน [Part 4](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part4) เราจะมาพูดถึงเรื่องเหล่านี้กันครับ ติดตามอ่านได้ในวันพรุ่งนี้ :D
