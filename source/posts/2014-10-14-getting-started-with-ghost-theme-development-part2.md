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

```html
<!DOCTYPE html>
<html lang="en">
 
<head>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
 
    <title>Clean Blog</title>
 
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
 
    <!-- Custom CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
 
    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
 
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
</head>
 
<body>
 
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
 
    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('img/home-bg.jpg')">
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
                <div class="post-preview">
                    <a href="post.html">
                        <h2 class="post-title">
                            Man must explore, and this is exploration at its greatest
                        </h2>
                        <h3 class="post-subtitle">
                            Problems look mighty small from 150 miles up
                        </h3>
                    </a>
                    <p class="post-meta">Posted by <a href="#">Start Bootstrap</a> on September 24, 2014</p>
                </div>
                <hr>
                <div class="post-preview">
                    <a href="post.html">
                        <h2 class="post-title">
                            I believe every human has a finite number of heartbeats. I don't intend to waste any of mine.
                        </h2>
                    </a>
                    <p class="post-meta">Posted by <a href="#">Start Bootstrap</a> on September 18, 2014</p>
                </div>
                <hr>
                <div class="post-preview">
                    <a href="post.html">
                        <h2 class="post-title">
                            Science has not yet mastered prophecy
                        </h2>
                        <h3 class="post-subtitle">
                            We predict too much for the next year and yet far too little for the next ten.
                        </h3>
                    </a>
                    <p class="post-meta">Posted by <a href="#">Start Bootstrap</a> on August 24, 2014</p>
                </div>
                <hr>
                <div class="post-preview">
                    <a href="post.html">
                        <h2 class="post-title">
                            Failure is not an option
                        </h2>
                        <h3 class="post-subtitle">
                            Many say exploration is part of our destiny, but it’s actually our duty to future generations.
                        </h3>
                    </a>
                    <p class="post-meta">Posted by <a href="#">Start Bootstrap</a> on July 8, 2014</p>
                </div>
                <hr>
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
 
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
 
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
 
    <!-- Custom Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>
 
</body>
 
</html>
```

ด้านบน มันยังลิงค์ไปยังไฟล์ resource ของเราไม่ถูกต้องนะครับ เนื่องจากว่าเราเก็บไฟล์ assets ต่างๆ ไว้ในโฟลเดอร์ `assets` ฉะนั้นก็ทำการลิงค์ให้มันถูกต้องด้วยครับ จากโค๊ดด้านบน แก้พวก script ด้านล่างนี้ด้วย

```html
<!-- Bootstrap Core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
 
<!-- Custom CSS -->
<link href="assets/css/clean-blog.min.css" rel="stylesheet">
    
<header class="intro-header" style="background-image: url('assets/img/home-bg.jpg')">
 
<!-- jQuery -->
<script src="assets/js/jquery.min.js"></script>
 
<!-- Bootstrap Core JavaScript -->
<script src="assets/js/bootstrap.min.js"></script>
 
<!-- Custom Theme JavaScript -->
<script src="assets/js/clean-blog.min.js"></script>
```

จากนั้นลองเปิดหน้าเว็บเราใหม่ [http://localhost:2368](http://localhost:2368) ต้องได้เหมือน Template ดังภาพ

![Index](images/2014/10/part2-index.png)

ทีนี้จะเห็นว่าบทความ มันไม่ได้มาจากบทความที่เราเขียนเลย แต่เป็นบทความที่ใส่ไว้ในหน้า index เท่านั้น ฉะนั้นเราก็จะมาแก้ส่วนนี้กัน ให้มันดึงโพสจากฐานข้อมูลของเรามาแสดง 

ลองสังเกตในไฟล์ `index.hbs` จะเห็นว่ามีส่วนที่เป็นการแสดงโพสอยู่ ก็คือ tag นี้ 

```hbs
<div class="post-preview">
    <a href="post.html">
        <h2 class="post-title">
            Failure is not an option
        </h2>
        <h3 class="post-subtitle">
            Many say exploration is part of our destiny, but it’s actually our duty to future generations.
        </h3>
    </a>
    <p class="post-meta">Posted by <a href="#">Start Bootstrap</a> on July 8, 2014</p>
</div>
<hr>
```

หนึ่งโพส จะมีครอบด้วย tag ด้านบน 1 ชุด แสดงถึง 1 โพส ฉะนั้น เราจะเปลี่ยนเป็นการใช้ Helper Class ของ Ghost เพื่อทำการวนลูปหาโพสทั้งหมด มาแสดงในหน้าแรก ก็จะได้ดังนี้

```hbs
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
```

- `{{#foreach posts}}` : หมายถึงการเริ่มวนลูป เพื่อหาจำนวนบทความทั้งหมดของเรา เหมือน `the_loop()` ใน Wordpress
- `{{url}}` : เป็นการแสดง url ของโพส จะใช้ได้ต้องอยู่ภายใน Post Context ซึ่ง `foreach posts` ก็คือการเรียก Post มาที่ละ Post
- `{{title}}` : แสดงชื่อ Title ของโพส เช่นเดียวกันกับ `{{url}}` คือต้องใช้ภายใน Post Context
- `{{excerpt character="80"}}` : คือการใช้ excerpt เป็นการตัดบทความ โดยกำหนดไว้ว่า ให้มีจำนวนตัวอักษรทั้งหมด ไม่เกิน 80 ตัวอักษร
- `{{author}}` : ก็เป็นการเรียก ใช้ Author ซึ่งปกติจะอยู่ในแต่ละ Post อยู่แล้ว ทำให้เราสามารถเรียกใช้เช่น `{{author.name}}` ชื่อผู้โพส - -- `{{author.bio}}` : รายละเอียดคนโพส ส่วน `{{author}}` เฉยๆ มันคือ Helper ที่แสดงชื่อคนโพส และลิงค์ไปหน้า Author ให้เลย
- `{{date format="MMMM DD, YYYY"}}` : เป็นการแสดงวันที่โพส โดยกำหนด format เป็น เดือน วันที่, ปี

เข้าไปเพิ่มบทความให้เว็บเราซักเล็กน้อย

![Add Content](images/2014/10/ghost-content.png)

ต่อมาลองเปิดหน้าเว็บดูอีกครั้ง [http://localhost:2368](http://localhost:2368) จะเห็นโพสของเราแล้ว 

![Complete Index](images/2014/10/ghost-create-index.png)

หน้า Index ก็ถือว่าเป็นอันเรียบร้อย :D


## Create Post & Page

ต่อมาสร้างหน้า Post เอาไว้สำหรับเข้าไปดูรายละเอียด ของแต่ละโพส ทำเหมือนกันกับ Index เลย คือไปก็อปหน้า `post.html` ของ Template Clean Blog มาไว้ในไฟล์ `post.hbs` ดังนี้

```html
<!DOCTYPE html>
<html lang="en">
 
<head>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
 
    <title>Clean Blog - Sample Post</title>
 
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
 
    <!-- Custom CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
 
    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
 
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
</head>
 
<body>
 
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
 
    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('img/post-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-heading">
                        <h1>Man must explore, and this is exploration at its greatest</h1>
                        <h2 class="subheading">Problems look mighty small from 150 miles up</h2>
                        <span class="meta">Posted by <a href="#">Start Bootstrap</a> on August 24, 2014</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
 
    <!-- Post Content -->
    <article>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman's earth, if free men make it, will be truly round: a globe in practice, not in theory.</p>
 
                    <p>Science cuts two ways, of course; its products can be used for both good and evil. But there's no turning back from science. The early warnings about technological dangers also come from science.</p>
 
                    <p>What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.</p>
 
                    <p>A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That's how I felt seeing the Earth for the first time. I could not help but love and cherish her.</p>
 
                    <p>For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.</p>
 
                    <h2 class="section-heading">The Final Frontier</h2>
 
                    <p>There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>
 
                    <p>There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>
 
                    <blockquote>The dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten.</blockquote>
 
                    <p>Spaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development.</p>
 
                    <h2 class="section-heading">Reaching for the Stars</h2>
 
                    <p>As we got further and further away, it [the Earth] diminished in size. Finally it shrank to the size of a marble, the most beautiful you can imagine. That beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart. Seeing this has to change a man.</p>
 
                    <a href="#">
                        <img class="img-responsive" src="img/post-sample-image.jpg" alt="">
                    </a>
                    <span class="caption text-muted">To go places and do things that have never been done before – that’s what living is all about.</span>
 
                    <p>Space, the final frontier. These are the voyages of the Starship Enterprise. Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before.</p>
 
                    <p>As I stand out here in the wonders of the unknown at Hadley, I sort of realize there’s a fundamental truth to our nature, Man must explore, and this is exploration at its greatest.</p>
 
                    <p>Placeholder text by <a href="http://spaceipsum.com/">Space Ipsum</a>. Photographs by <a href="https://www.flickr.com/photos/nasacommons/">NASA on The Commons</a>.</p>
                </div>
            </div>
        </div>
    </article>
 
    <hr>
 
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
 
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
 
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
 
    <!-- Custom Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>
 
</body>
 
</html>
```

จากนั้นก็แก้ไข path assets ให้ตรงเหมือนกันกับ Index (จะเห็นว่าโค๊ดเรายาว และมีหลายๆจุดที่โค๊ดเราซ้ำๆใช่มั้ยครับ หากมี 1-2ไฟล์ ก็ยังคงไม่ค่อยมีปัญหาเท่าไหร่ แต่หากลองคิดดู หากเรามี 10-20 หน้า ต้องมานั่งเปลี่ยน assets ก็อปโค๊ดยาวๆ คงไม่ดีแน่ นั่นแหละครับ จึงเกิดเป็นการใช้ default template และ partial ขึ้นมา เดียวใน Step ถัดไปจะมีการพูดถึงครับ

ทีนี้ลองเข้าหน้าเว็บ แล้วกดเข้าไปโพสไหนก็ได้ เพื่อจะดูว่าหน้า `post.hbs` มันเวิร์คหรือไม่ ??

จะเห็นหน้าเว็บมันเสีย ทำไมมันมองไม่เห็นไฟล์ css ทั้งที่เราเซทค่าแบบเดียวกันกับหน้า Index เมื่อลองดูโค๊ด จะเห็นว่ามันลิงค์ไปหน้านี้

```
http://localhost:2368/post-title/assets/css/clean-blog.min.css/
```

ซึ่งถ้าหาก อยู่หน้าแรก ไฟล์ css มันยังคงเรียกไปถูก แต่เมื่อไหร่ที่มันไปหน้า อื่น มันดันลิงค์ไปผิด path ทำให้หา Path ของ css จริงๆ ไม่เจอ วิธีแก้คือใช้ Assets Helper ครับ  เปลี่ยนตรงแท็กทั้งหมดเป็นแบบนี้

```html
<!-- Bootstrap Core CSS -->
<link href="{{asset "css/bootstrap.min.css"}}" rel="stylesheet">
 
<!-- Custom CSS -->
<link href="{{asset "css/clean-blog.min.css"}}" rel="stylesheet">
 
<header class="intro-header" style="background-image: url('{{asset "img/home-bg.jpg"}}')">
<!-- jQuery -->
<script src="{{asset "js/jquery.min.js"}}"></script>
 
<!-- Bootstrap Core JavaScript -->
<script src="{{asset "js/bootstrap.min.js"}}"></script>
 
<!-- Custom Theme JavaScript -->
<script src="{{asset "js/clean-blog.min.js"}}"></script>
```

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

```hbs
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
