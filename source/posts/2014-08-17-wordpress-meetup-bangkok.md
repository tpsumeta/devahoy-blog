---
title: สรุปงาน Wordpress Meetup Bangkok
cover: /images/2014/08/picjumbo.com_3187040303_e5d3a8efc1_o.jpg
tags:
 - Bootstrap
 - Foundation
 - Web Design
 - web Development
 - Wordpress
 - Wordpress Meetup
 - Wordpress Meetup Bangkok
---

## Wordpress Meetup

สวัสดีครับ บทความนี้เป็นบทความสรุป หลังจากที่ไปงาน **Wordpress Meetup Bangkok** ในหัวข้อ [How to design and create themes faster and better](http://www.meetup.com/Bangkok-WordPress/events/200080882/) นะครับ จริงๆ ถือเป็นงาน Wordpress Meetup ครั้งแรกเลยก็ว่าได้ วันนี้ผมก็เลยสรุปตามความเข้าใจของผม รวมถึงใส่รายละเอียด และแหล่งศึกษาเพิ่มเติมไปบ้างนิดหน่อย  หากส่วนไหนผิดพลาด ก็ขออภัยด้วยครับ

สำหรับคนที่ไม่รู้ว่า Wordpress Meetup คืออะไร ผมขอพิมพ์สั้นๆว่า WP Meetup ละกันครับ เป็นงานที่จัดขึ้นเพื่อรวมผู้ใช้ Wordpress ในประเทศไทย ทั้ง Developer, Designer และ Blogger มาแลกเปลี่ยน แชร์ความรู้กันนะครับ สำหรับรายละเอียดต่างๆ ลองติดตามอ่านเว็บไซต์ Designil เพิ่มเติมครับ [WordPress Meetup 3 & 4 – สอนทำ Plugin & Theme ขายใน WordPress.com](http://www.designil.com/wordpress-meetup-plugin-theme.html)

## How to design and create themes faster and better

![Poster](/images/2014/08/poster.jpeg)

สำหรับวันนี้ มีหัวข้อที่ Speaker จะมาพูดอยู่ 3 หัวข้อครับ คือ 

- [Foundation and Underscore](#foundation) : พูดโดยคุณ [Aum Watcharapol](https://www.facebook.com/c.watcharapol)
- [Bootstrap Basic](#bootstrap)  : พูดโดยคุณ [Woratana Perth Ngarmtrakulchol](https://www.facebook.com/perthmon) จากเว็บ [Designil](http://www.designil.com/) นั่นเอง
- [Child Theme](#child-theme)  : พูดโดยคุณ [Shinichi Nishikawa](https://www.facebook.com/shinichi.nishikawa)

<a name="founcation"></a>

## Foundation and Underscore

### Underscores คืออะไร?

เริ่มต้นที่หัวข้อแรกเลยครับ ในหัวข้อนี้คุณ Aum จะพูดถึง **Underscore** ก่อนว่ามันคืออะไรนะครับ [UnderScore](http://underscores.me/) มันเป็น Starter Theme ตัวนึง ที่มีพวก functions และ feature พื้นฐานที่จำเป็นมาให้เราแล้ว  ขั้นตอนการใช้งาน Underscores ง่ายมากครับ เพียงแค่เข้าเว็บไซต์ [underscores.me](http://underscores.me/) จากนั้น ทำการใส่ค่า แล้วกด **Generate** ก็จะได้ Theme พื้นฐานมาแล้ว

![Underscore](/images/2014/08/underscores.png)

ส่วนรายละเอียด การตั้งค่าก่อนการ Generate มีดังนี้

- Theme Name : ชื่อของธีมที่จะใช้ ในส่วนนี้จะแสดงชื่อธีม เวลาเราเลือก Theme ในหน้า Admin
- Theme Slug : ชื่อธีมที่ให้เป็น unique ส่วนมากจะเป็นตัวเล็กหมด ในส่วนนี้ underscore จะใช้เป็นชื่อโฟลเดอร์ของธีมเรา
- Author : ชื่อคนทำธีม (เป็น option เสริม จะใส่ไม่ใส่ก็ได้ ถ้าใส่ ก็จะไปปรากฎอยู่ในไฟล์ `style.css` 
- Author URI : ที่อยู่ URI ของคนทำธีม เช่นเดียวกัน เป็น option เสริม
- Description : เป็นการอธิบายว่าธีมนี้คืออะไร (option เสริมเช่นกัน)

เมื่อโหลดไฟล์ที่ Generate มาเรียบร้อยแล้ว ภายในโฟลเดอร์ จะประกอบไปด้วย ไฟล์พื้้นฐานที่จำเป็นของ Wordpress ดังนี้

![Folder Structure](/images/2014/08/folder.png)

และไฟล์ `style.css` ก็จะมีรายละเอียดด้านบน ประมาณนี้

```css
/*
Theme Name: SimpleX
Theme URI: http://underscores.me/
Author: devahoy
Author URI: http://devahoy.com
Description: Simple Underscores Theme
Version: 1.0-wpcom
License: GNU General Public License v2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html
Text Domain: simple-x
Tags:

This theme, like WordPress, is licensed under the GPL.
Use it to make something cool, have fun, and share what you've learned with others.

 SimpleX is based on Underscores http://underscores.me/, (C) 2012-2014 Automattic, Inc.

Resetting and rebuilding styles have been helped along thanks to the fine work of
Eric Meyer http://meyerweb.com/eric/tools/css/reset/index.html
along with Nicolas Gallagher and Jonathan Neal http://necolas.github.com/normalize.css/
and Blueprint http://www.blueprintcss.org/
*/
```

สำหรับ Underscore ก็มีแค่นี้แหละครับ ส่วนอื่น หรือ style อื่นๆ เราก็ต้องไปเขียนเพิ่มเอาเอง Underscore เพียงแค่รวมรวบ feature และไฟล์พื้นฐานให้เท่านั้น

### Foundation

![Foundation](/images/2014/08/foundation.png)

มาถึงในหัวข้อของ Foundation (ต้องบอกก่อนว่าในส่วนนี้ ผมไม่ค่อยได้ตามเท่าไหร่ เนื่องจากว่า การ Install มันมีหลายวิธี รวมถึงเป็นแนวๆ Overview แนะนำ Feature ต่างๆซะมากกว่านะครับ)

- Foundation คือ CSS Framework โดย Zurb 
- ใช้หน่วย em แทนที่จะเป็น px แบบปกติ (em คือหน่วยที่ใช้ เทียบกับขนาด font-size ของ parent รายละเอียดเพิ่มเติม Google นะครับ)
- รองรับ IE9+ ขึ้นไป หากต้องการให้รองรับ IE ต่ำกว่า 9 ด้วยนี่ หมดสิทธิ์ครับ เนื่องจาก Foundation ใช้ `@media-queries` ซึ่งใช้ได้เฉพาะ IE9
- ใช้ [SCSS](http://sass-lang.com/) SCSS คือ SASS เวอร์ชั่นปรับปรุง ถ้าผมจำไม่ผิดนะครับ 

#### What'new in Foundation5 

ในหัวข้อนี้ทางคุณ Aum พูดเกี่ยวกับมี Features อะไรบ้างที่น่าสนใจบ้างใน Foundation เวอร์ชัน 5 สำหรับ Features ที่น่าสนใจก็มีดังนี้ครับ

- Fast Click : เอาไว้แก้ปัญหาการหน่วง เวลาคลิกบน mobile พอใส่แล้วมันจะหายดีเลย์ ~~ได้ยินคร่าวๆว่าคือเอาไว้ทำ Delay ให้กับ Button 300ms~~ 
- [Off Canvas](http://foundation.zurb.com/docs/components/offcanvas.html) : คือรูปแบบเมนูที่ในส่วนรายละเอียดเมนูจะอยู่นอกจอที่เรามองเห็น เมื่อกดที่ปุ่ม Menu หรือ Hamburger Menu ส่วนที่เรามองไม่เห็น ก็จะสไลด์จากด้านข้าง มาแสดงครับ 
- GPU Accelaration : Animation ต่างๆดีขึ้น ไหลลื่นขึ้น
- [Interchange](http://foundation.zurb.com/docs/components/interchange.html) : อยากบอกว่า Feature นี้ผมก็ชอบเช่นกัน สำหรับ Interchange มันคือการทำ Dynamic content ได้ทั้ง HTML, Image หรือ Map ต่างๆโดยปรับขนาดตามไซต์ของหน้าจอ Browser ให้เราเองอัตโนมัติ

#### Why mobile First?

ทำไมต้อง Mobile First? ในหัวข้อนี้คุณ Aum พูดถึง เมื่อก่อน การออกแบบดีไซน์หน้าเว็บไซต์จะเริ่มแบบ Top-Down คือเริ่มจากหน้าจอใหญ่ๆ ไปหน้าจอขนาดเล็ก (มือถือ) ทำให้เกิดปัญหา เรื่องขนาดไซต์ เช่น รูปภาพ แสดงผลได้ดีในหน้าจอ Desktop แต่เมื่อแสดงในหน้า mobile กลับมีขนาดใหญ่กว่าหน้าจอ ทำให้จึงเกิดไอเดีย **Bottom-Up** ขึ้นมา คือการทำจาก Mobile ก่อน จากนั้นถึงค่อยทำDesktop ข้อดีคือ โค๊ดสั้นและทางคุณ Aum ก้แนะนำ วิธีนี้

#### Grid System

ตัว Foundation จะเป็นระบบ Grid System (12 Columns)  ขนาดต่างๆ ของ Grid ก็จะมี `small`, `medium` และ `large` ตัวอย่างเช่น 

```html
<div class="row">
  <div class="small-2 large-4 columns">...</div>
  <div class="small-4 large-4 columns">...</div>
  <div class="small-6 large-4 columns">...</div>
</div>
```

โค๊ดด้านบน เมื่อแสดงที่หน้าจอมือถือ แถวจะถูกแบ่ง Column เป็น 2 : 4 : 6 รวมเป็น 12 Columns  หากแสดงในหน้าจอขนาดใหญ่ พวก Desktop แถวก็จะถูกแบ่งเป้น ขนาดเท่าๆกัน คือ 4 : 4 :  4 รวมเป็น 12 Columns ครับ ส่วนรายละเอียดเพิ่มเติม ก็อ่านได้จาก [Documentation ของ Foundation ได้เลย](http://foundation.zurb.com/docs/)


> Note : ตัว Foundation สามารถที่จะจัด Center ใหักับ Columns ได้แบบเดียวกับ Bootstrap โดยใช้คลาส `centered` ต่อท้าย เช่น `small-centered`


#### Workshop

ในส่วนท้ายๆของการบรรยาย มีการสอน การ Install การนำ Foundation มาใช้ร่วมกับ Underscore เบื้องต้น ในส่วนนี้ ผมเรียกมันว่าในส่วน Workshop ละกันครับ  ส่วนนี้ผมไม่ได้ตามเท่าไหร่ แต่ว่าจะนำวิธีการ Install Foundation มาให้ดูละกันครับ เนื่องจาก การติดตั้ง มันทำได้หลายๆวิธี ดังนี้

- ติดตั้งแบบ Complete : แบบนี้ง่ายสุด ดาวน์โหลดมา แล้วก็นำไปใช้งานได้เลย
- แบบ Essential : แบบนี้คล้ายแบบแรก แต่จะถูกตัดพวก Feature และ Component บางส่วนออก
- แบบ Custom : แบบนี้เราสามารถที่จะ Custom อะไรก็ได้ตามใจเรา จากนั้น ก็ Gen ออกมาเป็น css ในแบบของเรา
- ติดตั้งผ่าน SCSS : แบบนี้จะเป็นแบบยาก แต่การติดตั้งแบบนี้เราสามารถ Custom และ Build CSS ของเราเองได้ สำหรับการติดตั้งผ่าน SCSS [อ่านรายละเอียดทั้งหมดที่นี่ครับ](http://foundation.zurb.com/docs/sass.html) ส่วนวิธีการติดตั้งผมก็ยกตัวอย่างเฉพาะ ที่เคยทำมานะครับ คือติดตั้งผ่าน Ruby Gem นะครับ


> Note : การที่เราจะติดตั้งผ่าน SCSS ได้เราจำเป็นต้องมี NodeJS, Ruby Gem เพื่อเอาไว้ติดตั้ง Foundation และก็ยังต้องทำการติดตั้งในส่วน Compile ที่เอาไว้แปลงไฟล์ SCSS ของเราให้เป็น CSS อีก อย่างเช่น Compass หรือ Libsass & Grunt


ขั้นตอนการติดตั้งมีดังนี้ (ควรมีความรู้ NodeJS รวมถึง Ruby Gem มาบ้างนะครับ)

```
sudo npm install -g bower grunt-cli 
sudo gem install foundation
```

จากนั้นเวลาเราจะสร้างโปรเจ็คที่ใช้ Foundation ก็เพียงแค่พิพม์ CLI แบบนี้

```
foundation new YOUR_PROJECT_NAME
```

ทีนี้ หากเราจะทำ SCSS แต่ไม่มีตัว Compile และ Watch มันก็จะไม่สามารถแปลงเป็นไฟล์ CSS ให้เราได้นะครับ ฉะนั้นต้องลง Compass ด้วย

```
gem install compass
```
เวลาเราทำการแก้ไข Foundation ก็แค่สั่งโค๊ดด้านล่างนี้

```
compass watch
```

ทุกครั้งที่ทำการแก้ไขไฟล์ scss มันก็จะทำการ generate ให้เราเองอัตโนมัติ

#### รายละเอียดเพิ่มเติม

- [ตัวอย่าง Theme ที่ใช้ Underscore ร่วมกับ Foundation ](https://github.com/stevezehngut/ocwc2014-foundation)
- [Tool เพิ่มเติมที่ใช้ Foundation](http://foundation.zurb.com/develop/tools.html)

<a name="bootstrap"></a>
## Bootstrap

มาถึงในหัวข้อที่ 2 เป็นเวลาของ Bootstrap บรรยายโดยคุณ Perth คุณ Perth เล่าว่าตัว Bootstrap นั้นเริ่มมาจาก พนักงาน 2 คนใน Twitter ผมจำได้คนนึงชื่อ [Mark Otto](https://twitter.com/mdo) อีกคนจำไม่ได้แฮะ :D  

แต่ก่อนใช้ชื่อ Twitter Bootstrap ตอนหลัง คนสร้าง Twitter ย้ายไป Github ก็เลยต้องเปลี่ยนชื่อ โดยตัดคำว่า Twitter ทิ้ง และกลายมาเป็น Bootstrap ส่วนหน้าเว็บ ก็เป็น [http://getbootstrap.com/](http://getbootstrap.com/) รู้สึกว่าจะเริ่มเปลี่ยนตั้งแต่เวอร์ชัน 2.3.2 รึเปล่าไม่แน่ใจ ช่วงนั้นเห็นบางที เข้าเว็บผิดบ้าง ไม่ redirect ไปเว็บใหม่บ้าง ส่วนนี้ไม่แน่ใจนะครับ ใครรู้ช่วยคอมเม้นบอกด้วยนะครับ


### Bootstrap คืออะไร?

![Bootstrap](/images/2014/08/bootstrap.png)

- Front-End Framework : ที่ประกอบไปด้วย HTML, CSS, Javascript
- Component : มี Component ต่างๆ ให้เราเลือกใช้งาน ไม่ว่าจะเป็น Button, form, table, Label, Navigation Bar หรืออื่นๆ อีกเยอะแยะ

### ทำไมต้องใช้ Bootstrap?

- อย่างแรกเลย มันช่วยประหยัดเวลาในการเขียนโค๊ดลงไปได้เยอะเลย 
- ใช้งานง่าย แค่ก็อปโค๊ดมาใส่ ก็ใช้งานได้แล้ว ส่วนไฟล์สำคัญๆ มีอยู่ด้วยกัน 3 ไฟล์คือ 
    - CSS : ชื่อว่า `bootstrap.css`
    - JS : ชื่อ `bootstrap.js`
    - Icon Font : glyphicons
    
หากเราไม่ต้องการดาวน์โหลด Bootstrap มาไว้ในโปรเจ็ค เรายังสามารถเรียกตัว Bootstrap ผ่าน [CDN](http://www.bootstrapcdn.com/) ได้เช่นกัน มันคือ Host Server ที่เอาไว้ฝากพวกไฟล์เหล่านี้ เวลาเราโหลดหน้าเว็บ มันก็จะไปดึงข้อมูลจาก Host เหล่านั้น ช่วยลดภาระของ Server ของเราได้ครับ แต่ข้อเสียก็คือ หากโฮสนั้นๆล่ม เว็บเราก็จะโหลดช้า หรือว่าไม่มีไฟล์ css, js ให้ใช้งานนะครับ หน้าเว็บก็จะเน่านั่นเอง :D

ใน Section นี้คุณ Perth จะใช้ Bootstrap Playground เขียนโค๊ดและแสดงผลลัพธ์ให้ดูไปด้วยเลย ผ่านเว็บไซต์ [Codepen.io](http://codepen.io/) นะครับ

### Grid คืออะไร?

ทุกๆเว็บไซต์ จะออกแบบในระบบ Grid System คือการแบ่งส่วนต่างๆ ออกเป็น 12 Grid 

![Grid System](/images/2014/08/grid.png)

*ตัวอย่าง เอามาจากเว็บ sourcecookbook.com/en/recipes/66/introduction-to-960-grid-system*

ตัวอย่างเพิ่มเติม [Grid Overlay Bootstrap & Foundation](http://alefeuvre.github.io/foundation-grid-displayer/)

### Bootstrap Grid

Grid ใน Bootstrap จะถูกแบ่งขนาด ออกเป็น 4 ขนาดคือ 

- Extra small Device (Phone) : ใช้คลาส `col-xs-*`
- Small Device (Tablet) : ใช้คลาส `col-sm-*`
- Medium Devices(Desktop) : ใช้คลาส `col-md-*`
- Large Device : ใช้คลาส `col-lg-*`

> (*) คือ เลขของ grid มีตั้งแต่ 1-12

ตัวอย่าง [Template Agency](http://startbootstrap.com/templates/agency/)

ส่วนหลังจากนั้นก็จะเป็น Workshop มีการถามว่า แบบนี้ แบ่ง Grid ยังไง หน้านี้มีกี่ row อธิบายขั้นตอน และวิธีการสร้าง row และ column รายละเอียดเพิ่มเติม ดูจาก Slide ของคุณ Perth เพิ่มเติมเลยครับ ในขณะที่ผมกำลังเขียนบทความนี้ เห็นทางคุณ Perth โพสสไลด์พอดีเลย เชิญตามไปอ่านเลยครับ [\[Slide\] Bootstrap Basic – Bangkok WordPress Meetup](http://www.designil.com/slide-bootstrap-basic-bangkok-wordpress-meetup.html)

<a name="child-theme"></a>

## Child Theme

มาถึงในหัวข้อสุดท้ายครับ Speaker ของเรา คุณ Shinichi Nishikawa พูดถึงเรื่องการทำ Child Theme ครับ 

Slide ประกอบคำบรรยาย 

<iframe style="margin: 0 auto; display: block" src="//www.slideshare.net/slideshow/embed_code/38060537" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="https://www.slideshare.net/NSKW/child-theme" title="Child Theme" target="_blank">Child Theme</a> </strong> from <strong><a href="http://www.slideshare.net/NSKW" target="_blank">Shinichi Nishikawa</a></strong> </div>


### Child Theme คืออะไร?

Chile Theme คือธีม ที่ถูกสืบทอด (Inherit) คุณสมบัติ function ต่างๆ มาจากอีกธีมหนึ่ง (Parent Theme) โดยเราสามารถที่จะแก้ไข เปลี่ยนแปลง  function ต่างๆของ Parent Theme ได้  Child Theme เหมาะสำหรับการแก้ไข ปรับแต่ง Theme ที่มีอยู่แล้ว แทนที่จะก็อปปี้ Theme นั้นๆ

รายละเอียดเพิ่มเติมเกี่ยวกับ Child Theme : [http://codex.wordpress.org/Child_Themes](http://codex.wordpress.org/Child_Themes)

### Parent Theme คืออะไร?

- ทุกๆ Theme สามารถเป็น Parent Theme ได้ **แต่ว่าไม่สามารถสร้าง Child Theme จาก Child Theme อีกทีนึงได้**

### วิธีการสร้าง Child Theme สร้างอย่างไร?

1. ทำการสร้างโฟลเดอร์ใน `wp-content/themes/` โดยตั้งชื่อโฟลเดอร์อะไรก็ได้แล้วแต่เราเลย เช่น `my-child-theme`
2. สร้างไฟล์ `style.css` ในโฟลเดอร์ที่เราสร้างขึ้น โดยภายในไฟล์ `style.css` จะมีส่วนที่ระบุในส่วนคอมเม้น ว่ามาจาก Parent Theme อะไรแบบนี้ `Template: ParentThemeTemplate` (ระบุชื่อโฟลเดอร์ของ Parent Theme)
3. Boom! จัดการปรับแต่ง Child Theme ได้ตามใจชอบ

ด้านบนเป็นขั้นตอนการทำ Child Theme ต่อมาคุณ Shinichi ได้ยกตัวอย่าง Demo ให้ลองทำตามดู โดยใช้ Child Theme ชื่อว่า Shin 2014 และ Parent Theme คือ Twenty Fourteen นะครับ

### Concept ของ Child Theme คือ

- Don’t re-invent the wheel : คือไม่ต้องทำในส่วนที่มีคนทำแล้ว (ที่แรกผมก็งงว่า อย่าประดิษฐ์ล้ออะไรหว่า~~)
- เปลี่ยนแปลงเฉพาะส่วนที่ต้องการเท่านั้น
- ป้องกันความเสียหาย เวลาที่มีการอัพเดท Theme
- สิ่งที่เราสามารถสืบทอดมาจาก Parent Theme ได้มี css, ไฟล์ template และไฟล์ functions.php 

ตัวอย่างเช่น สร้าง Child Theme ขึ้นมา 1 Theme ตั้งชือ่ว่า `demo1` ไว้ใน `wp-content/themes/` จากนั้นสร้างไฟล์ `style.css` แล้วภายในไฟล์ ก็มีคอมเม้นแบบนี้

```
/*
Theme Name: My Demo Child Theme
Template: twentyfourteen
*/
```

จากด้านบน เป็นการกำหนดชื่อ Theme ส่วนนี้จะเอาไว้แสดงหน้า Admin เวลาเราจะเปลี่ยน Theme และส่วน Template คือชื่อของ Parent Theme ที่เราต้องการ จะต้องมีโฟลเดอร์ชื่อ `twentyfourteen` อยู่ด้วยนะ

หากลองรันหน้า Browser โดยใช้ Child Theme จะเห็นว่า หน้าตา ไม่มีอะไร  หากเราเพิ่ม stylesheet ของ Twenty Fourteen เข้าไปแบบนี้

```
@import url("../twentyfourteen/style.css");
```

มันก็จะได้หน้าตาเดียวกันกับ Twenty Fourteen เลย

> Recommended Plugin: [Show Current Template](http://wordpress.org/plugins/show-current-template/) เอาไว้ดูว่าเราใช้ Theme อะไร และมีการเรียกใช้ไฟล์อะไรบ้าง

### Demo 2 - 3

แสดงการทำในส่วนของการ override template ไฟล์นะครับ คอนเซปคือ ถ้าหากตัว Child Theme มี Template มันก็จะโหลดของ Child Theme แต่ถ้าไม่มี ตัว Wordpress จะโหลดไฟล์ Template จาก Parent Theme แทน

ส่วนการ override functions.php ทำได้ 2 วิธีคือ

- ตัวอย่าง Theme Nu2013 ที่คุณ Shinichi ทำให้ดู ส่วนนี้ผมไม่มีตัวอย่างนะครับ 
- ตัวอย่างโดยใช้ [DevDmBootstrap3](https://wordpress.org/themes/devdmbootstrap3) - มีพวก options เสริม เช่น เลือก ขนาด Sidebar

โดย คอนเซปของ functions.php มีดังนี้

- โหลด `functions.php` ของ Child theme ก่อนที่จะอ่านของ Parent Theme
- ถ้า Child theme ไม่มี `functions.php` Wordpress จะใช้ `functions.php` ของ Parent Theme
- สามารถที่จะ override function ของ Parent Theme ได้เลย (คุณ Shinichi แนะนำว่าการเขียนที่ดี ต้องทำการเช็คเงื่อนไขก่อนว่ามีการประกาศ function ไว้หรือยัง)

## Child Theme กับ Theme Framwork เลือกอะไรดี?

Theme Framework (Starter Theme) ก็อย่างเช่น 

- [Underscore](http://underscores.me/)
- [Root](http://roots.io/starter-theme/)
- [Bones](http://themble.com/bones/)
- [Thematic](http://themeshaper.com/thematic/)
- [Gantry](http://www.gantry-framework.org/)

#### เลือก Child Theme เมื่อ

- มองหา Parent Theme ที่น่าสนใจ มีฟังค์ชัน คุณสมบัติครบตามที่เราต้องการ
- ต้องการเปลี่ยนแปลงนิดๆหน่อยๆ
- เมื่อมีงบประมาณจำกัด ไม่มีตังนั่นเอง :)

กรณีตัวอย่าง เช่น อย่างคุณ Shinichi ให้ลูกค้าเลือก Theme ที่ลูกค้าต้องการในเว็บไซต์ [wordpress.org](http://wordpress.org) จากนั้น เค้าก็จะสร้าง Child Theme จาก Parent Theme พวกนี้ขึ้นมา หรืออีกกรณีนึง เรามี Parent Theme ตัวนึง แต่เราอยากให้มันรองรับ ทั้ง Mobile/PC เราก็อาจจะทำเป็น Child Theme 2 เวอร์ชันก็ได้

#### เลือก Theme Framework เมื่อ

- ต้องการสร้าง ออกแบบ เองจาก 0 เลย
- เมื่อต้องการเปลี่ยนแปลงเยอะมากๆจาก Parent Theme ให้สร้าง Theme ใหม่เถอะ


### Q&A

ในส่วนของคำถาม มีคนพูดถึงตัว Wordpress Builder ผมก็เลยไปลองๆดูพวกตัว Builder พบว่ามันก็มีน่าสนใจหลายๆตัวเลย เช่น

- [Themify](http://themify.me/builder)
- [Elegant Builder](http://www.elegantthemes.com/gallery/elegant-builder/)
- [FastLine](http://themes.fastlinemedia.com/)
- [VelocityPage](http://velocitypage.com/)


ส่วนอีกคำถามที่น่าสนใจคือ Child Theme สามารถขายได้มั้ย? ผมก็เลยลอง search ดูปรากฎเจอโพสนี้ครับ [Selling Child-Themes for Commercial Theme Framework?](http://themeforest.net/forums/thread/selling-childthemes-for-commercial-theme-framework/84962)  และเมื่อลองค้นหาใน Themeforest ด้วย keyword genesis child theme ก็เจอ [Theme ที่วางขายอยู่ครับ](http://themeforest.net/search?term=genesis+child+theme)

## สรุป

จบไปแล้วครับ สำหรับสรุปต่างๆ ที่ได้จากงาน Meetup ครั้งนี้ (บางส่วนผมก็ทำการเพิ่มเข้าไปเองเพิ่มเติมนะครับ) หวังว่าบทความนี้จะมีประโยชน์แก่ทั้งคนที่ไปร่วมงาน แล้วจดไม่ทัน ผมก็มีบางช่วงที่ไม่ได้จดบ้าง ขี้เกียจจดบ้าง ข้ามไปบ้าง ก็ขออภัยด้วยครับ หากใครอยากพูดคุย Wordpress เพิ่มเติม แนะนำ Facebook Group นี้เลยครับ [กรุ๊ป WordPress Alliance](https://www.facebook.com/groups/wpalliance/) ผมก็ได้รู้ข่าวมาจากกรุ๊ปนี้เหมือนกัน

นอกจากบทความผมแล้ว ยังมีเพื่อนๆที่ไปร่วมงาน ได้เขียนสรุปเอาไว้เช่นกันครับ สรุปไว้ค่อนข้างดีครับ

- เพื่อนๆที่ไปร่วมงานอีกคน ได้เขียนสรุปไว้เช่นกันครับ อ่านเพิ่มเติมได้ที่นี่ [\[Event\] WordPress meet up ครั้งที่ 5 at Hubba](http://www.oxygenyoyo.com/2014/08/18/event-wordpress-meet-up-5-at-hubba/)

สุดท้ายขอขอบคุณ [Hubba](http://hubbathailand.com/) สำหรับสถานที่ ขอขอบคุณ Speaker ทั้ง 3 ท่าน และก็ขอขอบคุณผู้ร่วมงานทุกท่านครับ ที่ทำให้มีงานนี้เกิดขึ้นมา หากมีคำถาม หรือข้อเสนอแนะ ติชม แนะนำกันเข้ามาได้นะครับ ขอบคุณที่อ่านจนจบครับ :D
