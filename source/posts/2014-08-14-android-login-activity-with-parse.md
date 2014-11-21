---
title: "การทำระบบ Login ผ่าน Web Service ด้วย Parse.com"
category: Android
cover: /images/2014/09/parse.png
tags:
- android
- android Login
- android Parse
- android Parse Login
- parse
- parse.com
---

บทความสอนเขียนแอพ Android บทความนี้ ขอนำเสนอ การทำระบบ Login ติดต่อผ่าน Web Server โดยใช้ Parse.com  ซึ่งเป็นความบทที่ 3 ใน 4 เกี่ยวกับการสร้างระบบ Login บน Android  สำหรับรายละเอียด บทอื่นๆ ก็มีดังนี้ครับ

- [การทำระบบ Login ด้วย SharedPreferences](http://devahoy.com/2014/06/android-login-activity-with-sharedpreferences/)
- [การทำระบบ Login ด้วย SQLite](http://devahoy.com/2014/06/android-login-activity-with-sqlite/)
- [การทำระบบ Login ติดต่อผ่าน Web Server ด้วย Parse.com]()
- การทำระบบ Login ด้วย Facebook ร่วมกับ Parse.com

หลังจากที่ดองบทความไว้นานแล้ว ก็ได้เวลาที่จะเริ่มเขียนต่อซักที สำหรับบทความนี้ก็จะคล้ายๆกับ 2 บทความที่แล้วเลยครับ [การทำระบบ Login ด้วย SharedPreferences](http://devahoy.com/2014/06/android-login-activity-with-sharedpreferences/) และ [การทำระบบ Login ด้วย SQLite](http://devahoy.com/2014/06/android-login-activity-with-sqlite/) จะแต่งต่างกันที่บทความนี้จะไม่ใช่การเก็บข้อมูลในเครื่องแล้ว แต่จะใช้ฐานข้อมูลภายนอกแทน นั้นก็คือใช้ Web Server ซึ่งในส่วน Web Server เราจะใช้บริการของ Parse.com เข้ามาช่วย ทำให้ไม่ต้องไปยุ่งยาก จัดการฝั่ง Server มากนัก

สำหรับรายละเอียดเกี่ยวกับ Parse.com อ่านเพิ่มเติมได้จากบทความด้านล่างนี้ครับ

- [ทำความรู้จักกับ Parse.com](http://devahoy.com/2014/04/getting-started-with-parse/)
- [วิธีการ Save และ Query ParseObject](http://devahoy.com/2014/05/how-to-save-and-query-parse-object/)
- [ขั้นตอนการทำเว็บไซต์บน Parse โดยการใช้ Cloud Code](http://devahoy.com/2014/07/how-to-hosting-website-with-parse/)

## Overview

ภาพรวมของระบบล็อคอินด้วย Web Service ผ่าน parse.com จะคล้ายๆกับบทความเก่าเลย คือมีหน้าและรายละเอียดดังนี้ ทุกครั้งที่เราทำการ Login หรือว่า Register จะถูกเรียก request ไปยัง Parse.com สุดท้าย Mockup คร่าวๆ ก็จะได้แบบนี้

![Mockup](/images/2014/06/mockup.png)

- มีหน้าล็อคอิน สำหรับ ใส่ username, password เพื่อเข้าระบบ
- มีหน้า register สำหรับลงทะเบียน กรณีที่ไม่มี username
- หน้าหลัก หลักจากที่ล็อคอินได้เรียบร้อยแล้ว  จะมีปุ่มให้กดเปลี่ยนพาสเวิร์ดด้วย


## เริ่มต้นสร้างโปรเจ็ค

บทความนี้จะใช้โปรเจ็คจากบทความที่แล้วเลยนะครับ ฉะนั้น ใช้โค๊ดเดิมได้เลย สามารถโหลดได้จาก [Github นี้ครับ](https://github.com/Devahoy/android-login-example/tree/part2) (อยู่ที่ branch ชื่อ part2)

หรือจะ clone ก็ตามนี้ 

แบบ HTTPS

```
git clone https://github.com/Devahoy/android-login-example.git
git checkout part2
```

แบบ SSH

```
git clone git@github.com:Devahoy/android-login-example.git
git checkout part2
```

> โค๊ดจากบทความที่แล้ว branch คือ part2 นะครับ  ถ้า Part3 คือบทความนี้ เอาไว้ดูโค๊ดของ part3 เมื่อจบบทความนี้จะดีกว่านะครับ 

เมื่อได้โค๊ดมาแล้ว ก็มาต่อกันเลย

ทำการเพิ่ม library ของ parse-sdk เข้ามาในโปรเจ็คก่อน โดยดาวน์โหลดไฟล์ [Parse-1.5.1.zip](https://www.parse.com/downloads/android/Parse/latest) จากนั้นก็นำไฟล์ Parse-1.5.1.jar มาใส่ไว้ในโฟลเดอร์ `libs` ของโปรเจ็ค ต่อจากนั้นเปิด `build.gradle` แล้วเพิ่มนี้ลงไป 

```
dependencies {
    compile files('libs/Parse-1.5.1.jar')
}
```

หรือจะใส่แบบนี้ เพื่อให้มัน compile ไฟล์ jar ทั้งโฟลเดอร์ libs

```
dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])
}
```

ทำการกด Sync Now หรือ Sync Project with Gradle File.

## สร้างคลาส Application

ทำการสร้างคลาสชื่อว่า `MainApplication` และทำการ extends `Application` จากนั้นก็ตั้งค่า Parse ในเมธอด `onCreate()` แบบนี้

```
package com.devahoy.sample.login;

import android.app.Application;

import com.parse.Parse;

public class MainApplication extends Application {

    private final String APPLICATION_ID = "YOUR_APP_ID";
    private final String CLIENT_KEY = "YOUR_CLIENT_KEY";

    @Override
    public void onCreate() {
        super.onCreate();
        // Add your initialization code here
        Parse.initialize(this, APPLICATION_ID, CLIENT_KEY);
    }
}
```


สำหรับ APPLICATION_ID กับ CLIENT_KEY ใครไม่รู้วิธีการหา แนะนำ อ่านบทความก่อนนะครับ มีบอกไว้อยู่ [ทำความรู้จักกับ Parse.com](http://devahoy.com/2014/04/getting-started-with-parse/)


จากนั้นแก้ไข `AndroidManifest.xml` โดยการเพิ่ม คลาส `MainApplication` เข้าไปในส่วนของ tag application และ Permission สำหรับเชื่อมต่ออินเตอร์เนต ดังนี้

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <uses-permission android:name="android.permission.INTERNET" />
    
    <application
        ...
        android:name=".MainApplication">
        ...
    </application>
</manifest>
```

## LoginActivity

เปิดหน้า `LoginActivity.java` ทำการลบ `UserManager` ออกครับ เนื่องจากเราไม่ได้ใช้ SQLite แล้ว  ไฟล์จะได้แบบนี้

```java
package com.devahoy.sample.login.ui;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.devahoy.sample.login.R;
import com.devahoy.sample.login.model.User;


public class LoginActivity extends ActionBarActivity {

    private Button mLogin;
    private EditText mUsername;
    private EditText mPassword;
    private TextView mRegister;
    private Context mContext;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_login);
        mContext = this;

        mLogin = (Button) findViewById(R.id.button_login);
        mUsername = (EditText) findViewById(R.id.username);
        mPassword = (EditText) findViewById(R.id.password);
        mRegister = (TextView) findViewById(R.id.register);

        mLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                checkLogin();
            }
        });

        mRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(mContext, RegisterActivity.class);
                startActivity(intent);
            }
        });
    }

    private void checkLogin() {
        String username = mUsername.getText().toString().trim().toLowerCase();
        String password = mPassword.getText().toString().trim();

        User user = new User(username, password);


    }
}
```

ต่อมา ทำการแก้ไขในส่วน `checkLogin()` ให้เป็นการส่งข้อมูลไปเช็คกับ Parse แทนที่จะเป็นการ query sqlite แบบนี้

```
private void checkLogin() {
    String username = mUsername.getText().toString().trim().toLowerCase();
    String password = mPassword.getText().toString().trim();

    ParseUser.logInInBackground(username, password, new LogInCallback() {
        @Override
        public void done(ParseUser user, ParseException e) {
            if (e == null) {
                Intent intent = new Intent(mContext, MainActivity.class);
                startActivity(intent);
                finish();
            } else {
                Toast.makeText(getApplicationContext(),
                        e.getMessage(),
                        Toast.LENGTH_LONG).show();
            }
        }
    });
}
```

จะเห็นว่าเราใช้คลาส `ParseUser` สำหรับจัดการ User กับ Parse ใช้เมธอด `logInInBackground()` ข้อมูลก็จะถูกส่งไปยัง Parse เพื่อทำการเช็คว่ามียูเซอร์นี้อยู่ในระบบหรือไม่ แน่นอนว่าไม่มี เพราะเรายังไม่ได้ทำการสมัคร ฉะนั้นจะมี error เกิดขึ้น แสดงที่ Toast แต่ถ้าหากว่ามี User ในระบบ ก็จะทำการส่ง objectId ของยูเซอร์เพื่อไปเปิดในคลาส `MainActivity` ต่อไป

![Invalid Login](/images/2014/08/invalid.png)


## RegisterActivity

ต่อมาสร้างหน้าสำหรับ Register เพื่อเอาไว้ทำการสมัครสมาชิก และส่งข้อมูลไปเก็บไว้ในฐานข้อมูลของ Parse รูปแบบของมันก็ประมาณนี้

```java
ParseUser user = new ParseUser();
user.setUsername("my name");
user.setPassword("my pass");

user.signUpInBackground(new SignUpCallback() {
  public void done(ParseException e) {
    if (e == null) {
        // completed.
    } else {
        // some errors.
    }
  }
});
```

ใช้คลาส `ParseUser` จากนั้นก็ใช้เมธอด `setUsername()` และ `setPassword()` จากนั้นก็เรียกเมธอด `signUpInBackground()` เพื่อส่งข้อมูลการสมัครไปยัง Parse 

ทีนี้มาแก้ไขคลาส `RegisterActivity.java` ที่ทำไว้จากบทความก่อนกันครับ ลบ `UserManager` ออกครับ เนื่องจากไม่ได้ใช้แล้ว ไฟล์ก็จะเหลือแบบนี้

```java
package com.devahoy.sample.login.ui;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.devahoy.sample.login.R;

public class RegisterActivity extends ActionBarActivity {

    private EditText mUsername;
    private EditText mPassword;
    private EditText mConfirmPassword;
    private Button mRegister;

    private Context mContext;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        mContext = this;

        mUsername = (EditText) findViewById(R.id.username);
        mPassword = (EditText) findViewById(R.id.password);
        mConfirmPassword = (EditText) findViewById(R.id.confirm_password);
        mRegister = (Button) findViewById(R.id.button_register);

        mRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String username = mUsername.getText().toString().trim().toLowerCase();
                String password = mPassword.getText().toString();
                String confirmPassword = mConfirmPassword.getText().toString();

                if (password.equals(confirmPassword)) {
                

                } else {
                    String message = getString(R.string.register_password_error);
                    Toast.makeText(mContext, message, Toast.LENGTH_SHORT).show();
                }

            }
        });
    }

}
```

ทีนี้สิ่งที่เราจะแก้คือในส่วน `mRegister` คือเมื่อมีการคลิกปุ่ม Register ก็จะทำการเช็คว่า password กับ confirm password ตรงกันมั้ย ถ้าตรงกันก็ให้ทำการสมัครสมาชิกได้ สิ่งที่เราจะเพิ่มก็คือในส่วน หลักจากที่ password ตรงกัน จะได้แบบนี้

```
 mRegister.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {

        String username = mUsername.getText().toString().trim().toLowerCase();
        String password = mPassword.getText().toString();
        String confirmPassword = mConfirmPassword.getText().toString();

        if (password.equals(confirmPassword)) {
            ParseUser user = new ParseUser();
            user.setUsername(username);
            user.setPassword(password);

            user.signUpInBackground(new SignUpCallback() {
                @Override
                public void done(ParseException e) {
                    if (e == null) {
                        // Register Completed!
                        finish();
                    } else {
                        // Some Errors!
                    }
                }
            });

        } else {
            String message = getString(R.string.register_password_error);
            Toast.makeText(mContext, message, Toast.LENGTH_SHORT).show();
        }
    }
});
```

ลองรันโปรแกรม จากนั้นลองไปดูที่หน้า Data Browser ของ Parse จะเห็นว่ามี User ใหม่เพิ่มขึ้นมา 

![Data Browser](/images/2014/08/devahoy.png)

## MainActivity

สุดท้าย MainActivity เราจะเพิ่มเติมนิดหน่อย จากบทความเก่า เราจะใช้ข้อมูลจาก `Bundle` ที่ส่งมาจาก Activity ก่อนหน้ามาแสดง แต่ว่า สำหรับบทความนี้ เราจะใ้ช้ `ParseUser.getCurrentUser()` เพื่อทำการดึงค่าของ ParseUser ปัจจุบันมาโชว์ Parse มันฉลาดพอที่จะรู้ว่าเราล็อคอิน User ปัจจุบันเป็นอะไรอยู่ครับ เนื่องจากมันจัดเก็บข้อมูลลง local cache ในเครื่องไว้ก่อน เมื่อมีการ Logout ถึงจะลบข้อมูล session ออกครับ สำหรับไฟล์ `MainActivity.java` จะได้แบบนี้

ไฟล์ `MainActivity.java`

```java
package com.devahoy.sample.login.ui;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.devahoy.sample.login.R;
import com.parse.ParseException;
import com.parse.ParseUser;
import com.parse.RequestPasswordResetCallback;

public class MainActivity extends ActionBarActivity {

    Button mChangePassword;
    TextView mUsername;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mChangePassword = (Button) findViewById(R.id.change_password);
        mUsername = (TextView) findViewById(R.id.say_hi);

        ParseUser user = ParseUser.getCurrentUser();
        mUsername.setText(getString(R.string.say_hi) + " " + user.getUsername());

        mChangePassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDialogPassword();
            }
        });
    }
    ...
}
```

ต่อมายังมีในส่วนของ ChangePassword อีกทีนึง ฉะนั้นก็ทำการแก้ไข โดยการเปลี่ยนตรงส่วน Dialog จากเดิมที่ขึ้น Dialog มาให้ใส่ password ใหม่เลย ก็เปลี่ยนเป็นให้กรอก email address แทน ฉะนั้นไฟล์ `dialog.xml` มีการแก้ไขนิดหน่อย คือจากเดิม สำหรับ SQLite และ SharedPreference เราสามารถกด ChangePassword แล้วทำการเปลี่ยน Password ได้เลย แต่ Parse เราทำได้เพียงแค่ กด Reset Password จากนั้น Parse จะทำการส่งลิงค์พร้อมกับการรีเซ็ต Password ส่งมาที่อีเมล์ของเราครับ  สำหรับในส่วนนี้ ก็จะเป็นการให้กรอก email address สำหรับส่งรหัสไปแทนครับ จะได้แบบนี้

`dialog.xml`

```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
              android:orientation="vertical"
              android:layout_width="match_parent"
              android:layout_height="match_parent">
    <EditText
        android:id="@+id/email_address"
        android:inputType="textEmailAddress"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginTop="4dp"
        android:layout_marginLeft="4dp"
        android:layout_marginRight="4dp"
        android:layout_marginBottom="16dp"
        android:hint="@string/email_address"/>
</LinearLayout>
```

ไฟล์ `strings.xml`

```xml
<resources>
    <string name="email_address">Email Address</string>
</resources>
```

ส่วนเมธอด `showDialogPassword()` เมื่อ User กดปุ่มเปลี่ยน Password ก็มีการเปลี่ยนแปลงเป็นดังนี้

```
private void showDialogPassword() {
    AlertDialog.Builder builder =
            new AlertDialog.Builder(MainActivity.this);
    LayoutInflater inflater = getLayoutInflater();
    View view = inflater.inflate(R.layout.dialog, null);

    final EditText emailAddress = (EditText) view.findViewById(R.id.email_address);
    builder.setView(view);

    builder.setPositiveButton(getString(android.R.string.ok),
            new DialogInterface.OnClickListener() {
        @Override
        public void onClick(DialogInterface dialog, int which) {
            String email = emailAddress.getText().toString();
            if(!TextUtils.isEmpty(email)) {

                ParseUser.requestPasswordResetInBackground(email,
                    new RequestPasswordResetCallback() {
                        public void done(ParseException e) {
                            if (e == null) {
                                Toast.makeText(getApplicationContext(),
                                        getString(R.string.change_password_message),
                                        Toast.LENGTH_SHORT).show();
                                goToLogin();
                            } else {
                                Toast.makeText(getApplicationContext(),
                                        e.getMessage(),
                                        Toast.LENGTH_SHORT).show();
                            }
                        }
                });
            }
        }
    });
    builder.setNegativeButton(getString(android.R.string.cancel), null);
    builder.show();
}
```

เราจะใช้ `ParseUser.requestPasswordResetInBackground()` เพื่อทำการ reset password โดย parameter แรก เป็นชื่อที่อยู่เมล์ อันที่สองเป็น Callback กลับมา

ทดสอบรันโปรแกรมอีกครั้ง สังเกตว่า เราไม่ได้ส่ง `putExtra()` อะไรมาเลย แต่ว่า MainActivity ก็รู้ได้ว่า User ปัจจุบัน Login โดยใช้ Username อะไรผ่าน `Parseuser.getCurrentUser()`

![Result](/images/2014/08/result5.png)

เมื่อกด Change Password ก็จะให้ใส่ email (โดยเราต้องแก้ Data Broser ในเว็บ ด้วยการใส่ email ไปครับ จริงๆเวลาเราทำแอพของจริง จะต้องมีในส่วนที่กรอก email อยู่แล้ว แต่ว่าแอพนี้เป็นแค่ตัวอย่าง แค่ให้ใส่ username และ password ก็สมัครได้แล้ว)

![Reset password](/images/2014/08/reset-password.png) 

จากนั้น password ใหม่จะถูกส่งเข้าเมล์ เมื่อกดลิงค์ ก็จะเป็นการตั้ง password ใหม่ เวลาล็อคอินอีกครั้ง ก็จะใช้ password เก่าไม่ได้แล้ว

## สรุป

สำหรับตัวอย่างนี้ เป็นวิธีการ Login ด้วยการเก็บข้อมูลไปยัง Web Server ของ Parse.com โดยการใช้ Android Parse SDK ผ่านคลาส `ParseUser` จริงๆแล้วในคลาส `ParseUser` เราสามารถเพิ่ม column หรือ key อะไรก็ได้เช่น name, sex, age ได้หมดครับ  ตัวอย่างนี้ก็เป็นตัวอย่างแบบคร่าวๆ ในการใช้งาน Parse เบื้องต้นนะครับ ก็หวังว่าผู้อ่านจะนำไปประยุกต์และลองใช้งานกันดูนะครับ ในบทความนี้ไม่ได้ตั้งค่าเรื่อง Security ของ User นะครับ แนะนำให้อ่านเรื่อง [User ACL](https://www.parse.com/docs/android_guide#users-acls) และ [Anonymous User](https://www.parse.com/docs/android_guide#users-anonymous) ประกอบครับ

สำหรับ source code ดูได้จาก [Android Login Example Source](https://github.com/Devahoy/android-login-example/tree/part3) หรือใคร clone โปรเจ็คมาแล้ว ก็ดูที่ branch part3 ได้เลยครับ
