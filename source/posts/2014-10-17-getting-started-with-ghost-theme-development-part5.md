---
title: สอนสร้าง Theme Ghost เพื่อไปขาย Themeforest ตอนที่ 5 (ตอนสุดท้าย)
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
สวัสดีครับ นี้เป็น Part 5 Part สุดท้ายของซีรีย์ สร้าง Ghost Theme กันแล้วนะครับ สำหรับ Part นี้จะเป็นในส่วนของ Additional เสริมต่างๆ เช่น 

- การใส่ Disqus Comment, Facebook Comment, Google+ หรือ แม้แต่ Muut Comment
- การใส่ Syntax Highlighter ให้กับโค๊ดของเรา เป็นต้น

สำหรับ Part อื่นๆ สำหรับผู้ที่ยังไม่ได้อ่าน เชิญอ่านตามลิงค์ข้างล่างครับ

## Table of Contents

- [Part 1 : Overview and Setup Ghost](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part1)
- [Part 2 : Create Theme, Index, Post](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part2)
- [Part 3 : Default Template & Partial](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part3)
- [Part 4 : Navigation & Pagination](http://devahoy.com/2014/10/getting-started-with-ghost-theme-development-part4)
- **Part 5 : Additional (Comment System)**
- [Source Code on Github](https://github.com/Devahoy/ghostahoy)


### Disqus

สำหรับการใส่ Disqus Comment เริ่มแรก ต้องเข้าเว็บไซต์ [https://disqus.com/admin/create/](https://disqus.com/admin/create/) เพื่อสร้าง Disqus ของเราขึ้นมาก่อน assume ว่ามีแล้วละกันนะครับ ไม่มีก็ไปสร้างเอานะ 

![Disqus](images/2014/10/disqus-500x330.png)

หากมีอยู่แล้ว เข้าไปก็อปโค๊ดในส่วน Universal Code จากหน้า [https://your-blog-name.disqus.com/admin/settings/universalcode/](https://your-blog-name.disqus.com/admin/settings/universalcode/) หรือใช้โค๊ดข้างล่างก็ได้ แต่อย่าลืมเปลี่ยนชื่อ `disqus_shortname` ด้วยละ

สร้างไฟล์ `comment_disqus.hbs` ขึ้นมาเซฟไว้ที่โฟลเดอร์ `partials` 

```hbs
<div class="row">
	<div class="container">
		<div class="col-md-12 text-center">
			<div id="disqus_thread"></div>
			<script type="text/javascript">
		    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
		    var disqus_shortname = 'devahoy'; // required: replace example with your forum shortname
		    var disqus_identifier = '{{post.id}}';

		    /* * * DON'T EDIT BELOW THIS LINE * * */
		    (function() {
		        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
		        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		    })();
			</script>
			<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		</div>
	</div>
</div>
```

จากนั้นที่ไฟล์ `post.hbs` ก็แทรก comment ที่เราต้องการให้แสดงได้เลย ใส่ไว้หลังลูป `{{/post}}`

```
{{> comment_disqus}}
```

เมื่อเวลาเข้าหน้าโพส ก็จะเห็น Comment อยู่ที่ใต้บทความดังนี้

![Disqus](images/2014/10/part5-disqus-500x161.png)

## Facebook

สำหรับการใส่ Facebook Comment ใช้วิธีคล้ายๆกัน คือ สร้างไฟล์ในโฟลเดอร์ `partials` ชื่อว่า `comment_facebook.hbs` จากนั้นเข้าไปหน้า [Facebook Developer](https://developers.facebook.com/docs/plugins/comments) แล้วทำการ Get Code ออกมา 

![Fb Gen Code](images/2014/10/part5-fb-500x319.png)

เช่น

```hbs
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&appId=1475043666088428&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
 
<div class="fb-comments" data-href="http://example.com/comments" data-numposts="5" data-colorscheme="light"></div>
``` 

ทำการเปลี่ยน `data-href` เป็น Post URL จริงๆ และจัด div row และ container ให้ใหม่ รวมถึงเปลี่ยน appId เป็นไอดีของแอพตัวเองด้วยนะครับ ดังนี้

```hbs
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&appId=1475043666088428&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
 
<div class="row">
	<div class="container">
		<div class="col-md-12 text-center">
			<div class="fb-comments" data-href="{{@blog.url}}{{url}}" data-numposts="5" data-colorscheme="light"></div>
		</div>
	</div>
</div>
``` 

- `{{@blog.url}}{{url}}` : ส่วนนี้คือ Global Helper ที่ระบุ URL ของ Blog + Url ของ Post

ในหน้า `post.hbs` ก็แทรกโค๊ด `{{> comment_facebook}}` แทน `{{> comment_disqus}}` ได้เลย

เมื่อเวลาเข้าหน้าโพส ก็จะเห็น Comment อยู่ที่ใต้บทความดังนี้

![Fb](images/2014/10/part5-facebook-500x193.png)

## Google Plus

สำหรับ Google Plus ก็สร้างไฟล์ `comment_google_plus.hbs` และใส่โค๊ดด้านล่างนี้ลงไปได้เลย

```hbs
<script src="https://apis.google.com/js/plusone.js">
</script>
<div class="row">
	<div class="container">
		<div class="col-md-12 text-center">
			<div class="g-comments"
		    data-href="{{@blog.url}}{{url}}"
		    data-width="600"
		    data-first_party_property="BLOGGER"
		    data-view_type="FILTERED_POSTMOD">
			</div>
		</div>
	</div>
</div>
```

เมื่อเวลาเข้าหน้าโพส ก็จะเห็น Comment อยู่ที่ใต้บทความดังนี้

![Google](images/2014/10/part5-google-500x245.png)


## Syntax Highlight

และสำหรับ Blog ที่ออกแนว Geek หรือสำหรับพวก Developer/Prgrammer ก็มักชอบที่แทรกโค๊ดลงไปในบทความ ฉะนั้น ใน่สวนนี้ก็จะใช้ Syntax Highligh มาช่วย โดยจะใช้ [highlight.js](https://highlightjs.org/) ทำการดาวน์โหลดไฟล์ จากนั้นแตกไฟล์ `highlight.pack.js` มาเซฟไว้ที่ `assets/js` และ style เลือกมาซักอย่าง เซฟไว้ที่ `assets/css` สำหรับผมเลือก `github.css`

เพิ่ม script ที่ไฟล์ `default.hbs` ดังนี้

```hbs
<head>
<!-- Github CSS -->
<link href="{{asset "css/github.css"}}" ref="stylesheet">
</head>
<body>
 
<!-- highlight.js -->
<script src="{{asset "js/highlight.pack.js"}}"></script>
 
<!-- Custom Theme JavaScript -->
<script src="{{asset "js/clean-blog.js"}}"></script>
</body>
```

จากนั้นเปิดไฟล์ `assets/js/clean-blog.js` ขึ้นมา ลบโค๊ดข้างในทั้งหมดทิ้งเลย (ในส่วน Contact Form ไมไ่ด้ใช้ ก็เลยไม่เอา) จากนั้นแทนที่ด้วยโค๊ดนี้

```javascript
$("pre code").each(function(i, e) {hljs.highlightBlock(e); });
```

จะได้เป็น

```javascript
(function ($) {
  "use strict";
 
  var MQL = 1170;
 
  //primary navigation slide-in effect
  if ($(window).width() > MQL) {
    var headerHeight = $('.navbar-custom').height();
    $(window).on('scroll', {
        previousTop: 0
    },
    function() {
      var currentTop = $(window).scrollTop();
      //check if user is scrolling up
      if (currentTop < this.previousTop) {
        //if scrolling up...
        if (currentTop > 0 && $('.navbar-custom').hasClass('is-fixed')) {
          $('.navbar-custom').addClass('is-visible');
        } else {
          $('.navbar-custom').removeClass('is-visible is-fixed');
        }
      } else {
        //if scrolling down...
        $('.navbar-custom').removeClass('is-visible');
        if (currentTop > headerHeight && !$('.navbar-custom').hasClass('is-fixed')) $('.navbar-custom').addClass('is-fixed');
      }
        this.previousTop = currentTop;
    });
  }
 
  //hightlight.js
  $("pre code").each(function(i, e) {hljs.highlightBlock(e); });
 
}(jQuery));
```

มีในส่วนของ Navigation Slide Effect ของ Clean-Blog อยู่ด้วย ส่วนนี้ไ่ม่ได้ลบครับ แค่แทรกส่วนของ highlight.js ในส่วนท้ายของโค๊ด

เป็นการกำหนดว่า เมื่อโหลด DOM เสร็จเรียบร้อยแล้ว ตัว highlight.js จะดูว่า มีแท็กอยู่ในรูปแบบ 

```html
<pre><code>
```

หรือไม่ ถ้ามีมันก็จะ highlight ให้ 

---

หมดแล้ว สำหรับบทสอน Ghost Theme Development ทั้ง 5 ตอน หลังจากผ่านมา 5 ตอน ตอนนี้ Theme ของเรามีหน้าตาแบบนี้

![Result](images/2014/10/part5-index-647x1024.png)

ต้องขอบคุณ Theme สวยๆ จากที่นี่ด้วย [Start Bootstrap : Clean Blog](http://startbootstrap.com/templates/clean-blog/index.html) 

สุดท้าย หวังว่าจะได้เห็น Ghost Theme สวยๆ จากคนไทย ไปขายอยู่ใน Themeforest เยอะๆนะครับ :D

[Source Code ทั้งหมดอยู่ใน Github ไปดูได้](https://github.com/Devahoy/ghostahoy) จะ Folk จะ Modified ได้ตามสะดวกเลยครับ
