---
title: ขั้นตอนการติดตั้ง LibGDX สำหรับเขียนเกม Android ด้วย Android Studio
category: Game Development
cover: /images/2014/08/libgdx-cover.png
tags:
 - Game Dev
 - LibGDX
 - สอน LibGDX
 - LibGDX คือ
 - ติดตั้ง LibGDX
 - Android LibGDX
 - LibGDX Android Studio
---

หลังจากที่ผมเคยเขียนบทความเกี่ยวกับการทำ Game ด้วย libGDX กันไปแล้ว เนื่องจากว่า libGDX นั้นเป็น Library ที่สามารถจะเขียนโค๊ดเพียงแค่ครั้งเดียว แล้วรัน Cross Platform ได้เลย ทำให้บทความเก่าๆ ผมไม่ได้โฟกัสไปที่ Platform ใดๆเลย แต่พูดถึงภาพรวม function และ feature ของ libGDX และวิธีการเขียนเกมซะมากกว่า 

ในบทความนี้ จะเน้นการติดตั้ง libGDX สำหรับมือใหม่ เพื่อพัฒนาเกมลงบน Android ส่วนเครื่องมือที่ใช้ก็จะเป็น Android Studio นะครับ

สำหรับบทความ LibGDX ที่เคยเขียนไว้แล้ว มีดังนี้ครับ (สามารถอ่านเพิ่มเติมได้ครับ)

- [มาทำความรู้จักกับ LibGDX กันครับ](http://devahoy.com/2014/04/introduction-to-libgdx/)
- [เขียนเกมด้วย libGDX #1 – สร้างโปรเจ็ค](http://devahoy.com/2014/04/libgdx-game-development-create-project/)
- [เขียนเกมด้วย LibGDX #2 – Hello World](http://devahoy.com/2014/04/libgdx-tutorial-hello-world/)
- [เขียนเกมด้วย LibGDX #3 – Render และการรับ input](http://devahoy.com/2014/04/libgdx-tutorial-render-and-input-handling/)
- [เขียนเกมด้วย LibGDX #4 – Simple Game ภาคแรก](http://devahoy.com/2014/04/libgdx-tutorial-simple-game-part-1/)
- [เขียนเกมด้วย LibGDX #5 – Simple Game ภาคจบ](http://devahoy.com/2014/04/libgdx-tutorial-simple-game-part-2/)
- [เขียนเกมด้วย LibGDX #6 – Simple Game ภาคพิเศษ](http://devahoy.com/2014/04/libgdx-tutorial-simple-game-part-3/)
- [เขียนเกมด้วย LibGDX #7 - Simple Game - scene2d.ui](http://devahoy.com/2014/04/libgdx-tutorial-simple-game-part-4-scene2d/)
- [เขียนเกมด้วย LibGDX #8 - Simple Game - Actor](http://devahoy.com/2014/04/libgdx-tutorial-simple-game-implement-actor/)

## Prerequisite

การเตรียมเครื่องมือให้พร้อมที่จะเขียนเกมบน Android อย่างแรกเลย ที่ทุกคนต้องมีคือ

- Java JDK : [ขั้นตอนการติดตั้ง Java JDK บน Windows](http://devahoy.com/2014/03/install-java-jdk8-on-windows/)
- Android SDK : [ขั้นตอนการติดตั้ง Android SDK](http://devahoy.com/2014/03/setup-and-installation-android) 
- Android Studio : เวอร์ชั่นปัจจุบัน ณ เวลาที่เขียนคือ 0.8.6 ใครติดตั้งไม่เป็นอ่าน [ขั้นตอนการติดตั้ง Android Studio](http://devahoy.com/2014/03/setup-and-installation-android/#android-studio)

## Installation

ขั้นตอนการติดตั้ง libGDX เริ่มแรกให้เข้าไปยังเว็บไซต์ของ [LibGDX](http://libgdx.badlogicgames.com/) จากนั้นเลือกดาวน์โหลด 

[![Download](/images/2014/08/libgdx-download.png)](http://libgdx.badlogicgames.com/nightlies/dist/gdx-setup.jar)

ทำการดาวน์โหลดตัว [GDX-Setup.jar](http://libgdx.badlogicgames.com/nightlies/dist/gdx-setup.jar) เมื่อดาวน์โหลดเสร็จแล้ว เปิดโปรแกรมขึ้นมา 

## Setup Project

ต่อมา เมื่อเราเปิดโปรแกรม GDX-Setup.jar ขึ้นมาแล้ว ให้ทำการ Setup ตัวโปรเจ็คของเรา ตามรูปข้างล่างเลย (ส่วนนี้ คือการตั้งค่า เพื่อที่จะให้ libGDX ทำการ Generate Project ให้เรา)

![LibGDX Setup](/images/2014/08/libgdx-project-setup.png)

- **Name** : คือชื่อโปรเจ็คที่เราต้องการต้ัง เช่น AhoyShooter
- **Package** : ชื่อ Package ของโปรเจ็ค เช่น com.devahoy.games 
- **Game Class** : ชื่อของคลาสหลัก ที่เราจะเอาไว้เขียนเกม เช่น Game, MyGame, Shooter
- **Destination** : คือโฟลเดอร์ที่เรา้ต้องการบันทึก หลังจากที่ทำการ Generate Project เสร็จแล้ว
- **Android SDK** : คือ path ที่อยู่ของ Android SDK ที่เราทำการติดตั้งไว้  ส่วนมากจะอยู่ที่โฟลเดอร์ที่ติดตั้ง IDE เช่น `eclipse/sdk` หรือ  `android-studio/sdk`

ในส่วนของตัวโปรเจ็ค ก็ทำการเลือกแค่นี้ ต่อไปในส่วนของ libGDX version ล่าสุดจะเป็น [Release 1.3.0](http://www.badlogicgames.com/wordpress/?p=3484) ซึ่งออกมาได้ประมาณ 2 วันละครับ

ต่อมาในส่วน Sub Folder เลือกเฉพาะ Android เนื่องจากเป้าหมายคือ ต้องการรันบน Android อย่างเดียว (แต่ว่าในกรณีที่ต้องการรันหลายๆ Platform ก็เลือกตามใจเลยครับ)

ส่วนสุดท้าย Extensions ไม่ต้องเลือกครับ ในส่วนเริ่มต้นเขียน ยังไม่มีความจำเป็นต้องเลือกครับ แต่ว่า default ของมันจะเลือก Box2D มาให้ หากใครจะเลือกก็ไม่มีปัญหาครับ  ทำการกด **Generate** 

หากใครขึ้นข้อความแบบนี้ จะเกิดในกรณีที่เรามี API มากกว่า 19 ติดตั้งอยู่ในเครื่อง เนื่องจากว่า มี API สูงกว่า 19 ซึ่งเป็นเวอร์ชันที่ libGDX แนะนำ หากต้องการใช้เวอร์ชันที่สูงกว่า ก็กด Yes แต่หากต้องการใช้เวอร์ชัน 19 ก็กด No

![Warning](/images/2014/08/warning.png)

ตัว libGDX-Setup จะทำการ config และดาวน์โหลดไฟล์ต่างๆ ที่ใช้ในการเขียนเกม มาให้เราทั้งหมด สิ่งที่เราทำได้ตอนนี้มีอย่างเดียว คือนั่งรอมันดาวน์โหลดจนเสร็จครับ 

![libgdx downloading](/images/2014/08/libgdx-setup-download.png)

เมื่อเสร็จแล้ว จะมีข้อความขึ้นประมาณนี้

```
BUILD SUCCESSFUL

Total time: 37.096 secs
Done!
To import in Eclipse: File -> Import -> Gradle -> Gradle Project
To import to Intellij IDEA: File -> Import -> build.gradle
To import to NetBeans: File -> Open Project...
```

เมื่อเข้าไปดูโฟลเดอร์ที่เราเลือก Destination ก็จะเห็นโฟลเดอร์ต่างๆดังนี้ ต่อไปก็เตรียมตัวนำไป Import ได้เลย

![Project Structure](/images/2014/08/libgdx-folder.png)


ในส่วน Extensions หากใครไม่ต้องการรู้ก็ข้ามไปได้เลยครับ อันนี้จะอธิบายคร่าวๆ ว่าแต่ละ Extensions มันคืออะไร

- Bullet : เป็นส่วนเสริม ของ 3D เกี่ยวกับการ Collision(การจับการชนกันของวัตถุ)
- Freetype : ส่วนเสริมสำหรับการ Custom Font ต่างๆของเรา เช่นเปลี่ยน Font-Family
- Tools : ส่วนเสริม Tools ต่างๆ เช่น Texture Packer สำหรับรวมรูปภาพ เป็นไฟล์เดียวกัน, Hiero ตัวช่วยสำหรับรวม Bitmap Font, 2D Particle Editor ทำ effect
- Controllers : เป็นส่วนเสริมในกรณีที่ต้องการเขียนติดต่อกับ gamepads หรือ Joystick 
- Box2d : เป็น Physics Library น่าจะรู้จักกันดี อ่านเพิ่มเติมจากเว็บนี้ [Box2D](box2d.org/)
- Box2dlights : ส่วนเสริมเกี่ยวกับพวก Shadow Light แสงเงา โดยใช้ Box2d และ OpenGL 2.0
- Ashley : เป็นส่วนเสริมเกี่ยวกับการจัดการพวก Entity ภายในเกม  [Entity คืออะไร? อ่านโลด](http://www.richardlord.net/blog/what-is-an-entity-framework)


## Import Project

ขั้นตอนต่อมา เมื่อทำการ Generate LibGDX เสร็จเรียบร้อยแล้ว ขั้นตอนต่อมาก็ทำการ Import Prject ที่ได้ ด้วย Android Studio โดยเปิด Android Studio ขึ้นมา ให้เปิดหน้าแรกเลย หากใครค้างโปรเจ็คไว้อยู่ ก็กด Close Project ซะก่อนนะครับ

จากนั้น กด **Import Project..** 

![Import Project](/images/2014/08/import-project1.png)

ทำการ Browse ไปที่โฟลเดอร์ที่เราเลือก Destination ตอน Generate ไว้ เลือกที่ `build.gradle` กด OK 

![Choose Folder](/images/2014/08/choose-folder-dest.png)

รอให้ Android Studio ทำการ config ค่าต่างๆอีกซักครู่ เช่นพวก Gradle File การ cache ต่างๆ ปรากฎว่ามี error เกิดขึ้นครับ ดังภาพ

![Error](/images/2014/08/error-gradle.png)

เนื่องจากว่า Android Studio เวอร์ชันล่าสุด รองรับ Gradle Plugin เวอร์ชั่น 0.12 ขึ้นไป (ถ้าจำไม่ผิด) แต่ว่า libGDX ยังใช้ gradle plugin เวอร์ชัน 0.10.4 อยู่เลย เพราะฉะนั้นต้องแก้ด้วยการเปลี่ยนเป็นเวอร์ชันล่าสุด ทำได้โดยการกด **Fix plug-in version and re-import project** หรือเลือกที่ไฟล์ `build.gradle` ของ Root Project แล้วเปลี่ยน เป็น 

```
buildscript {
    ...
    dependencies {
        classpath 'com.android.tools.build:gradle:0.12.2'
    }
}
...
```

กด Try Again หรือ Sync Project with Gradle Files.

## Start Application

หลังจากที่เราทำการ Import Project มาเรียบร้อยแล้ว จะเห็นว่า Project เราจะมี 2 module คือ app และ android ในส่วน app จะเป็นโมดูลที่เป็น core คือการเขียนโค๊ดทั้งหมดจะทำที่โมดูลนี้ ในขณะที่ app เป็นเพียงแค่โมดูลที่เอาไว้สร้าง AndroidLauncher  เท่านั้น

Project ของเราจะมีโครงสร้างประมาณนี้

```
├── android
│   ├── android.iml
│   ├── AndroidManifest.xml
│   ├── assets
│   ├── build
│   ├── build.gradle
│   ├── ic_launcher-web.png
│   ├── libs
│   ├── proguard-project.txt
│   ├── project.properties
│   ├── res
│   └── src
├── build.gradle
├── core
│   ├── build.gradle
│   ├── core.iml
│   └── src
├── gradle
│   └── wrapper
├── gradle.properties
├── gradlew
├── gradlew.bat
├── libgdx-game.iml
├── local.properties
└── settings.gradle

```

ทำการเปิดคลาสหลัก ที่อยู่ในโฟลเดอร์ `core` ชื่อคลาส ตามที่เราตั้งค่า Game Class ตอนที่ทำการ Generate ส่วนตัวผม ตั้งชื่อว่า Shooter เพราะฉะนั้นเปิดไฟล์ Shooter ขึ้นมาดังนี้

```
package com.devahoy.games;

import com.badlogic.gdx.ApplicationAdapter;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.graphics.g2d.SpriteBatch;

public class Shooter extends ApplicationAdapter {
	SpriteBatch batch;
	Texture img;
	
	@Override
	public void create () {
		batch = new SpriteBatch();
		img = new Texture("badlogic.jpg");
	}

	@Override
	public void render () {
		Gdx.gl.glClearColor(1, 0, 0, 1);
		Gdx.gl.glClear(GL20.GL_COLOR_BUFFER_BIT);
		batch.begin();
        batch.draw(img, 0, 0);
		batch.end();
	}
}
```

แก้ไขในส่วน `render()` โดยเปลี่ยน ตรง `batch.draw(img, 0, 0);` เป็นแบบนี้

```
batch.draw(img, 0, 0, Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
```

ด้านบนเป็นการนำรูปที่ชื่อ `badlogic.jpg` ในโฟลเดอร์ `android/assets/badlogic.jpng` ขึ้นมาแสดง แบบเต็มหน้าจอ

ต่อมา ให้เราทำการเลือกโมดูล android จากนั้นกด Run เพื่อทำการทดสอบ จะเห็นหน้าตาประมาณนี้ (เทสได้ทั้งบนเครื่องจริง หรือ Emulator ที่มี GPU Support)

![result2](/images/2014/08/result22.png)


## สรุป

ขั้นตอนแรกของ libGDX ก็จบไปแล้ว ทั้งการติดตั้ง  การ Generate Project, การ Import Project และการทดสอบรันโปรแกรมเบื้องต้น ไม่ได้พูดถึง รายละเอียด หรือวิธีการเขียน libGDX นะครับ หากต้องการรายละเอียดเพิ่มเติม ก็อ่านจากบทความเก่าๆ ไปก่อนครับ ส่วนบทความใหม่ๆ กำลังทยอยอัพเดท เรื่อยๆครับ หวังว่าบทความนี้จะเป็นประโยชน์แก่ผู้ที่กำลังเริ่มศึกษา libGDX หรือว่ากำลังศึกษาการเขียนเกมบน Android อยู่นะครับ
