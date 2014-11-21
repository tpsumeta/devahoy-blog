---
title: การทำระบบ Login ด้วย Facebook ร่วมกับ Parse.com
category: Android
cover: /images/2014/09/parse.png
tags:
 - Parse
 - Android
 - สอน Android
 - Android Parse
 - Android Login
 - Android Parse.com Login
---

บทความสอนเขียนแอพ Android บทความนี้ ขอนำเสนอ การทำระบบ Login Facebook โดยใช้ Parse.com  ซึ่งเป็นบทความบทสุดท้ายแล้ว เกี่ยวกับการสร้างระบบ Login บน Android  สำหรับรายละเอียด บทอื่นๆ ก็มีดังนี้ครับ

- [การทำระบบ Login ด้วย SharedPreferences](http://devahoy.com/2014/06/android-login-activity-with-sharedpreferences/)
- [การทำระบบ Login ด้วย SQLite](http://devahoy.com/2014/06/android-login-activity-with-sqlite/)
- [การทำระบบ Login ติดต่อผ่าน Web Server ด้วย Parse.com](http://devahoy.com/2014/08/android-login-activity-with-parse-com/)
- [การทำระบบ Login ด้วย Facebook ร่วมกับ Parse.com](http://devahoy.com/2014/09/android-login-facebook-with-parse/)

หลังจากที่ดองบทความไว้นานแล้ว ก็ได้เวลาที่จะเริ่มเขียนต่อซักที สำหรับบทความนี้ จะหลักตัวโปรเจ็คหลักๆ จากบทความก่อนๆนะครับ ใครที่ยังไม่มีโปรเจ็ค ก็อาจจาก บทความแรกได้เลยครับ ส่วนในหัวข้อวันนี้ จะมีสิ่งที่เกี่ยวข้องคือ Parse และ Facebook Android SDK ฉะนั้น ก็ให้ผู้อ่าน ทำการอ่านเนื้อหาเพิ่มเติมประกอบเองนะครับ

สำหรับรายละเอียดเกี่ยวกับ Parse.com และ Facebook SDK อ่านเพิ่มเติมได้จากบทความด้านล่างนี้ครับ

- [ทำความรู้จักกับ Parse.com](http://devahoy.com/2014/04/getting-started-with-parse/)
- [วิธีการ Save และ Query ParseObject](http://devahoy.com/2014/05/how-to-save-and-query-parse-object/)
- [ขั้นตอนการทำเว็บไซต์บน Parse โดยการใช้ Cloud Code](http://devahoy.com/2014/07/how-to-hosting-website-with-parse/)
- [สร้างปุ่ม Facebook Login บน Android](http://devahoy.com/2014/04/facebook-sdk-for-android-login-button/)
- [สร้าง Facebook Login ด้วย Android Studio](http://devahoy.com/2014/05/facebook-sdk-for-android-using-android-studio/)


## Overview

ภาพรวมของระบบล็อคอินด้วย Facebook ผ่าน parse.com จะคล้ายๆกับบทความเก่าเลย คือมีหน้าและรายละเอียดดังนี้ ทุกครั้งที่เราทำการ Login หรือว่า Register จะถูกเรียก request ไปยัง Parse.com ต่างกันที่ใช้ Facebook Login ฉะนั้นในส่วน Login และ Register จะใช้ส่วนของ Facebook SDK มาช่วย ไม่เกี่ยวกับในตัวแอพของเรา


## เริ่มต้นสร้างโปรเจ็ค

บทความนี้จะใช้โปรเจ็คจากบทความที่แล้วเลยนะครับ ฉะนั้น ใช้โค๊ดเดิมได้เลย สามารถโหลดได้จาก [Github นี้ครับ](https://github.com/Devahoy/android-login-example/tree/part3) (อยู่ที่ branch ชื่อ part3)

หรือจะ clone ก็ตามนี้ 

แบบ HTTPS

```
git clone https://github.com/Devahoy/android-login-example.git
git checkout part3
```

แบบ SSH

```
git clone git@github.com:Devahoy/android-login-example.git
git checkout part3
```

> โค๊ดจากบทความที่แล้ว branch คือ part3 นะครับ  ถ้า Part4 คือบทความนี้ เอาไว้ดูโค๊ดของ part4 เมื่อจบบทความนี้จะดีกว่านะครับ 

เมื่อได้โค๊ดมาแล้ว ก็มาต่อกันเลย

จากบทความที่แล้ว เรามี Parse SDK แล้ว ส่วน Facebook Android SDK จะมีตัว Built-in อยู่ใน Parse แล้ว 

## ทำการ Setup Facebook

1. ต้องมี Facebook App ซะก่อน ใครไม่มี [ก็ไปทำการสร้างซะ](https://developer.facebook.com) หรืออ่านจากบทความนี้ประกอบ [สร้างปุ่ม Facebook Login บน Android](http://devahoy.com/2014/04/facebook-sdk-for-android-login-button/)
2. นำ Facebook AppId และ SecretId มาใส่ใน Parse โดยเข้าไปที่ **Settings** => **Authentication** และเลือก **Allow Facebook authentication** เป็น Yes

![Add](images/2014/09/add-facebook.png)

3. ทำการเพิ่ม Facebook SDK เข้ามาในโปรเจ็คบน [Android Studio อ่านตัวอย่างนี้ประกอบ](http://devahoy.com/2014/05/facebook-sdk-for-android-using-android-studio/) เมื่อเพิ่ม Facebook SDK เป็น Module Library แล้ว ก็เปิดไฟล์ `build.gradle` ในโมดูล facebook ขึ้นมา แล้วแก้ไขเป็นแบบนี้

```java
apply plugin: 'com.android.library'

dependencies {
    compile 'com.android.support:support-v4:20.0.0'
    compile files('libs/bolts.jar')
}

android {
    compileSdkVersion Integer.parseInt(project.ANDROID_BUILD_SDK_VERSION)
    buildToolsVersion project.ANDROID_BUILD_TOOLS_VERSION

    defaultConfig {
        minSdkVersion Integer.parseInt(project.ANDROID_BUILD_MIN_SDK_VERSION)
        targetSdkVersion Integer.parseInt(project.ANDROID_BUILD_TARGET_SDK_VERSION)
    }

    lintOptions {
        abortOnError false
    }

    sourceSets {
        main {
            manifest.srcFile 'AndroidManifest.xml'
            java.srcDirs = ['src']
            res.srcDirs = ['res']
        }
    }
}
```

จากนั้นเพิ่มไฟล์ `gradle.properties` ที่อยู่ใน Root Project เลยนะ ตัวนอกสุด เพิ่ม Properties เหล่านี้ลงไป

```xml
ANDROID_BUILD_SDK_VERSION=20
ANDROID_BUILD_TOOLS_VERSION=20.0.0
ANDROID_BUILD_MIN_SDK_VERSION=10
ANDROID_BUILD_TARGET_SDK_VERSION=19
```

4. เปิดไฟล์ `MainApplication.java` จากนั้นเพิ่มโค๊ดนี้ลงไป เพื่อให้ Parse ใช้ Facebook เวลาที่จะล็อคอิน ส่วน `Parse.initialize()` ใช้ Parse AppId และ ClientKey ส่วนตรง `ParseFacebookUtils` ใช้ AppId ของ Facebook

```
@Override
public void onCreate() {
    super.onCreate();
    
    Parse.initialize(this, APPLICATION_ID, CLIENT_KEY);

    // Initial Facebook Utils
    ParseFacebookUtils.initialize(FACEBOOK_APP_ID);
}
```

5. เปิดไฟล์ `AndroidManifest.xml` แล้วทำการเพิ่ม ส่วนของ Facebook Login Activity ลงไป (หากยังไมไ่ด้เพิ่ม)

```xml
<application>
    ....
    
    <activity android:name="com.facebook.LoginActivity" />
</application>

```

## ทำการสร้าง Layout และคลาส LoginActivity

ต่อมาเปลี่ยนแปลงหน้าเลเอาท์นิดหน่อย ตรงส่วน `activity_login.xml` เหลือแค่ปุ่มกดปุ่มเดียว เพื่อไปเรียกฟังค์ชันล็อคอินของเฟซบุค ดังนี้

```xml
<?xml version="1.0" encoding="utf-8"?>

<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:layout_width="match_parent"
                android:layout_height="match_parent"
                android:background="#ff3eaff9">

    <TextView
        android:id="@+id/title"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:textColor="#ffffff"
        android:textSize="24sp"
        android:text="@string/app_name"
        android:layout_centerVertical="true"
        android:layout_centerHorizontal="true"
        android:layout_above="@+id/facebook_login_button"
        android:layout_marginBottom="32dp"/>

    <Button
        android:id="@+id/facebook_login_button"
        android:text="@string/facebook_login_button"
        android:padding="15dp"
        android:textColor="#ffffff"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_centerVertical="true"
        android:layout_centerHorizontal="true"/>

</RelativeLayout>
```

ไฟล์ `res/values/strings.xml`

```xml
<resources>
    <string name="facebook_login_button">Log in with Facebook</string>
</resources>
```

ส่วนคลาส `LoginActivity.java` จะเหลือแค่นี้

```java
package com.devahoy.sample.login.ui;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;

import com.devahoy.sample.login.R;
import com.parse.LogInCallback;
import com.parse.ParseException;
import com.parse.ParseFacebookUtils;
import com.parse.ParseUser;


public class LoginActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_login);

        Button loginButton = (Button)
                findViewById(R.id.facebook_login_button);

        loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openFacebookLogin();
            }
        });
    }

    private void openFacebookLogin() {
        ParseFacebookUtils.logIn(this, new LogInCallback() {
            @Override
            public void done(ParseUser parseUser, ParseException e) {
                if (e == null) {

                    if (parseUser == null) {
                        // user cancel
                    } else if (parseUser.isNew()) {
                        // User is new
                    } else {
                        // User login though facebook
                        Log.i("ParseUser", parseUser.getUsername());
                    }

                } else {
                    // any errors.
                }
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        ParseFacebookUtils.finishAuthentication(requestCode, resultCode, data);
    }
}
```

จากด้านบน เมื่อเรากดปุ่ม Button ก็จะไปเรียกให้ Facebook Login Dialog แสดงขึ้นมา ส่วนนี้ Parse จะจัดการให้เรา ด้วย `ParseFacebookUtils.login()` มี callback กลับมาเป็น `LogInCallback()` ภายในเมธอด `done()` เราสามารถที่จะดึงค่าต่างๆ ของ `ParseUser` ออกมาได้ แต่หาก ParseUser มีค่าเป็น null แสดงว่าผู้ใช้กดยกเลิก Facebook Login , หาก `parseUser.isNew()` เป็น True แสดงว่าผู้ใช้ ทำการสมัครแอคเคาท์ผ่าน Facebook Dialog

ส่วนตรง `onActivityResult()` จะเอาไว้สำหรับส่ง result ของ Facebook กรณีที่เครือ่งผู้ใช้ เครื่องนั้นๆ ไม่ได้ลง Facebook App มันจะทำการเปิด Dialog ด้วย WebView แล้วส่งค่า result กลับมาแทน

เมื่อรันแอพพลิเคชันขึ้นมา กดปุ่ม Button จะได้หน้าจอดังนี้

![Login Facebook](images/2014/09/screen.png)


## เชื่อม Facebook กับ Account เดิม

นอกจากการ Login หรือการสมัคร Register ด้วย Facebook แล้ว หากเรามี ParseUser เราก็สามารถนำ ParseUser มาลิงค์เข้ากับ Facebook User ได้ ด้วยคำสั่ง

```java
if (!ParseFacebookUtils.isLinked(user)) {
  ParseFacebookUtils.link(user, this, new SaveCallback() {
    @Override
    public void done(ParseException ex) {
      if (ParseFacebookUtils.isLinked(user)) {
        // Completed... 
      }
    }
  });
}
```

เมื่อเปิด Data Browser ก็จะเห็น Column ที่ชื่อ `authData` ที่มีรายละเอียดของ Facebook ของ user นั้นๆอยู่

ส่วนวิธีการ ยกเลิกการเชื่อมแอคเคาท์กับ Facebook ทำได้ด้วยคำสั่งนี้

```java
ParseFacebookUtils.unlinkInBackground(user, new SaveCallback() {
  @Override
  public void done(ParseException ex) {
    if (ex == null) {
        // Cancel Facebook Completed!
    }
  }
});
```

สำหรับรายละเอียดของการ Login Facebook ด้วย Parse ก็มีเพียงเท่านี้ครับ เป็นเหมือนส่วนเสริมของ Parse ที่ช่วยจัดการเกี่ยวกับ FacebookUser ให้กับเรา โดยเก็บข้อมูลร่วมกับ ParseUser เลย นอกจาก Login Facebook แล้ว ตัว Parse ยังสามารถที่จะใช้ Request Permission ได้เหมือนกับการใช้ Facebook SDK เลย สำหรับรายละเอียดเพิ่มเติม อ่านที่นี่ครับ [Parse - Facebook Users](https://www.parse.com/docs/android_guide#fbusers)
