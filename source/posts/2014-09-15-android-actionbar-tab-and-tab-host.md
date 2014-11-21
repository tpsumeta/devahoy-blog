---
title: การสร้าง Tab บน Android ด้วยการใช้ TabHost และ ActionBar Tab
category: Android
cover: /images/cover/android.png
tags:
 - Android
 - สอน Android
 - Android Tab
 - สร้าง Tab Android
 - สร้าง TabHost
 - ทำ Android Tab
 - Android ActionBar Tab
 - Actionbar
---

บทความ Android วันนี้ ขอนำเสนอเรื่อง การสร้าง Tab ให้กับแอพ Android ตัวอย่าง Tab ใน Android จะมีหน้าตาแบบนี้

![Tab](/images/2014/09/tabs_overview.png)

![Tab Standard](/images/2014/09/tabs_standard.png)

การสร้าง Tab บน Android ทำได้ 2 วิธีคือ 

- [สร้าง Tab โดยใช้ TabHost](#tabhost)
- [สร้าง Tab โดยใช้ ActionBar](#actionbar-tab)


## สร้างโปรเจ็ค

เริ่มต้นมา ก็ให้ทำการสร้างโปรเจ็คขึ้นมาครับ

![Create Project](/images/2014/09/create-project1.png)

![Create Project2](/images/2014/09/create-project21.png)

![Create Project3](/images/2014/09/create-project31.png)

![Create Project4](/images/2014/09/create-project41.png)

<a name="tabhost"></a>

## สร้าง Tab โดยใช้ TabHost

สำหรับวิธีแรก เป็นการสร้าง Tab โดยใช้ TabHost ซึ่งมันทำได้ทั้งการ extends `TabActivity` ซึ่งปัจจุบันมัน `deprecated` ไปแล้ว นั่นหมายถึงในอนาคตมันถูกยกเลิกไปแล้ว แต่ว่าปัจจุบันยังใช้ได้อยู่ แค่ไม่นิยม และไม่แนะนำ ให้ใช้ และการทำ TabHost โดยไม่ใช้ `TabActivity` 

**TabHost** เป็นเลเอาท์ชนิดหนึ่ง ที่ภายในจะมี TabWidget ไว้แสดงชื่อของแท็ป และอีกส่วนคือ FrameLayout เอาไว้เป็นส่วนแสดงข้อมูล 

ตัวอย่างโครงสร้างของ TabHost เมื่ออยู่ในรูป xml โดยแก้ไขไฟล์ `activity_my.xml` เป็นดังนี้ ( ตัว TabHost จะประกาศ id เป็นชื่อเราเอง ส่วน TabWidget และ FrameLayout จะใช้ id ของทาง Android นั่นก็คือ `@android:id/tabs` และ `@android:id/tabcontent` )

```xml
<TabHost
    android:id="@+id/tabhost"
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <LinearLayout
        android:id="@+id/linear"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical">

        <TabWidget
            android:id="@android:id/tabs"
            android:layout_width="match_parent"
            android:layout_height="wrap_content">
        </TabWidget>

        <FrameLayout
            android:id="@android:id/tabcontent"
            android:layout_width="match_parent"
            android:layout_height="match_parent">
        </FrameLayout>

    </LinearLayout>

</TabHost>
```

![TabHost](/images/2014/09/tabhost1.png)

จากนั้นเปิดไฟล์ `MyActivity` ขึ้นมา ในส่วนของ `onCreate()` จะเป็นดังนี้

```
 @Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_my);

    TabHost tabHost = (TabHost) findViewById(R.id.tabhost);

    TabHost.TabSpec tabSpec = tabHost.newTabSpec("tab1")
            .setIndicator("KitKat")
            .setContent(new Intent(this, Tab1.class));
            
    TabHost.TabSpec tabSpec2 = tabHost.newTabSpec("tab2")
            .setIndicator("Jelly Bean")
            .setContent(new Intent(this, Tab2.class));
            
    TabHost.TabSpec tabSpec3 = tabHost.newTabSpec("tab3")
            .setIndicator("Gingerbread")
            .setContent(new Intent(this, Tab3.class));

    tabHost.addTab(tabSpec);
    tabHost.addTab(tabSpec2);
    tabHost.addTab(tabSpec3);
}
```

ด้านบนเป็นการ เชื่อม TabHost ที่ประกาศไว้ใน Layout xml จากนั้นก็สร้าง TabHost โดยหลักการ และขั้นตอนการสร้าง TabHost มีดังนี้

1. สร้างออปเจ็ค `TabHost` ขึ้นมา โดยใช้ TabHost ที่ประกาศไว้ใน xml และทำการเรียก `.setup()`
2. สร้าง `TabSpec` ขึ้นมา ภายใน `TabSpec` ประกอบไปด้วย
    2.1 `newTabSpec()` : เป็นเหมือนการกำหนดชื่อ tag
    2.2 `setIndicator()` : ใส่ชื่อ Title ที่เราต้องการให้มันโชว์ในส่วนแท็ป
    2.3 `setContent()` : เลือก Content เป็น Activity ที่เราต้องการ
3. เพิ่ม `TabSpec` เข้าไปใน `TabHost` ด้วยคำสั่ง `addTab()`

่ต่อมาเรายังไม่มี Activity ที่ชื่อ `Tab1`, `Tab2` และ `Tab3` ก็ทำการสร้างขึ้นมาครับ โดยทั้งสามตัวใช้ไฟล์ layout ร่วมกัน ต้องการให้แค่เปลี่ยนสี background เท่านั้น

ไฟล์ `tab.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
              android:orientation="vertical"
              android:id="@+id/linear"
              android:layout_width="match_parent"
              android:layout_height="match_parent">

</LinearLayout>
```

ไฟล์ `Tab1.java`

```java
package com.devahoy.android.simpletab;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.LinearLayout;

public class Tab1 extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tab);

        LinearLayout linearLayout = (LinearLayout) findViewById(R.id.linear);
        linearLayout.setBackgroundColor(Color.parseColor("#f62355"));
    }
}
```

ไฟล์ `Tab2.java`

```java
package com.devahoy.android.simpletab;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.LinearLayout;

public class Tab2 extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tab);

        LinearLayout linearLayout = (LinearLayout) findViewById(R.id.linear);
        linearLayout.setBackgroundColor(Color.parseColor("#00b06b"));
    }
}
```

ไฟล์ `Tab3.java`

```java
package com.devahoy.android.simpletab;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.widget.LinearLayout;

public class Tab3 extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.tab);

        LinearLayout linearLayout = (LinearLayout) findViewById(R.id.linear);
        linearLayout.setBackgroundColor(Color.parseColor("#3982d7"));
    }
}
```

ทำการแก้ไขไฟล์ `AndroidManifest.xml` ด้วย เนื่องจากเราทำการเพิ่ม Activity เข้าไป

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.devahoy.android.simpletab" >

    <application
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme" >
        <activity
            android:name=".MyActivity"
            android:label="@string/app_name" >
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

        <activity android:name=".Tab1" />
        <activity android:name=".Tab2" />
        <activity android:name=".Tab3" />
    </application>

</manifest>
```

ทดสอบรันโปรแกรมดู ซักหน่อย....

ปรากฎว่ามี error

```
Caused by: java.lang.IllegalStateException: Did you forget to call 'public void setup(LocalActivityManager activityGroup)'?
```

เนื่องจากว่าตัว TabHost มันจำเป็นต้องใช้ `ActivityGroup` ด้วย ซึ่งจริงๆถ้าเราใช้ `TabActivity` มันจะไม่มีปัญหาอะไร เพราะว่า `TabActivity` มันก็ extends มาจาก `ActivityGroup` อีกทีนึง

แต่เมื่อไม่มี `ActivityGroup` เราก็แก้ปัญหาด้วยการใช้ `LocalActivityManager` เข้ามาช่วยครับ โดยการประกาศตัวแปรเป็น global จากนั้นก็ส่งตัวแปรใช้ `tabHost.setUp()` ดังนี้

```java
public class MyActivity extends Activity {

    LocalActivityManager mLocalActivityManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);
        
        mLocalActivityManager = new LocalActivityManager(this, false);
        mLocalActivityManager.dispatchCreate(savedInstanceState);

        TabHost tabHost = (TabHost) findViewById(R.id.tabhost);
        tabHost.setup(mLocalActivityManager);
        
        ...
    }
}
```

จากนั้นเพิ่มเมธอด `onResume()` และ `onPause()` สุดท้ายไฟล์จะได้ดังนี้

```java
package com.devahoy.android.simpletab;

import android.app.Activity;
import android.app.LocalActivityManager;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TabHost;


public class MyActivity extends Activity {

    LocalActivityManager mLocalActivityManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);
        mLocalActivityManager = new LocalActivityManager(this, false);
        mLocalActivityManager.dispatchCreate(savedInstanceState);

        TabHost tabHost = (TabHost) findViewById(R.id.tabhost);
        tabHost.setup(mLocalActivityManager);

        TabHost.TabSpec tabSpec = tabHost.newTabSpec("tab1")
                .setIndicator("KitKat")
                .setContent(new Intent(this, Tab1.class));
        TabHost.TabSpec tabSpec2 = tabHost.newTabSpec("tab2")
                .setIndicator("Jelly Bean")
                .setContent(new Intent(this, Tab2.class));
        TabHost.TabSpec tabSpec3 = tabHost.newTabSpec("tab3")
                .setIndicator("Gingerbread")
                .setContent(new Intent(this, Tab3.class));

        tabHost.addTab(tabSpec);
        tabHost.addTab(tabSpec2);
        tabHost.addTab(tabSpec3);
    }

    @Override
    protected void onPause() {
        super.onPause();
        mLocalActivityManager.dispatchPause(!isFinishing());

    }

    @Override
    protected void onResume() {
        super.onResume();
        mLocalActivityManager.dispatchResume();
    }
}
```

ทดสอบรันโปรแกรมอีกครั้ง

![TabHost](/images/2014/09/tab.png)

ทีนี้ถ้าอยากแก้ไขข้อมูลแต่ละ Tab ก็ไปจัดการหน้า Tab1, Tab2, Tab3 เหมือนเป็นหน้า Activity อีกหน้าได้เลย

<a name="actionbar-tab"></a>

## สร้าง Tab โดยใช้ ActionBar

การสร้าง Tab โดยใช้ ActionBar นั้นเป็นวิธีดีกว่า TabHost เนื่องจากว่ามันทันสมัยกว่า เป็นปัจจุบันกว่า รวมถึงง่ายกว่าด้วย 

ขั้นตอนการสร้าง Tab จาก ActionBar นั้น มีขั้นตอนดังนี้

1. สร้าง `ActionBar` ขึ้นมา จากนั้นก็สั่งให้เป็นโหมด Tab
2. สร้าง `ActionBar.Tab` ขึ้นมา โดยใช้ `ActionBar.newTab()` และต้องทำการกำหนด `TabListener` ให้กับ Tab ทุกอันด้วย
3. เพิ่ม Tab เข้าไปใน `ActionBar` ด้วย `ActionBar.addTab()`

เมื่อมีขั้นตอนการสร้างแล้ว ฉะนั้นก็มาเริ่มต้นเลย เริ่มจาก สร้างคลาสใหม่ ขึ้นมาคลาสนึงชื่อว่า `ActionBarTabActivity.java` มีโค๊ดดังนี้

```java
package com.devahoy.android.simpletab;

import android.app.ActionBar;
import android.app.Activity;
import android.app.FragmentTransaction;
import android.os.Bundle;

public class ActionBarTabActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ActionBar actionBar = getActionBar();
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
    }
}
```

ด้านบนเป็นการกำหนดให้ ActionBar อยู่ในโหมด Tab ภาพด้านล่างเปรียบเทียบว่า Tab กับไม่มี Tab แตกต่างกันอย่างไร

![Diff Tab](/images/2014/09/diff-tab.png)

ต่อมาก็ทำการสร้าง ActionBar โดยทำตามขั้นตอนที่กล่าวไว้ด้านบน จะได้โค๊ดดังนี้

```java
package com.devahoy.android.simpletab;

import android.app.ActionBar;
import android.app.Activity;
import android.app.FragmentTransaction;
import android.os.Bundle;

public class ActionBarTabActivity extends Activity implements ActionBar.TabListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ActionBar actionBar = getActionBar();
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);

        for (int i = 1; i <= 3; i++) {
            ActionBar.Tab tab = actionBar.newTab()
                    .setText("Tab#" + i)
                    .setTabListener(this);
            actionBar.addTab(tab);
        }
    }

    @Override
    public void onTabSelected(ActionBar.Tab tab, FragmentTransaction ft) {

    }

    @Override
    public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction ft) {

    }

    @Override
    public void onTabReselected(ActionBar.Tab tab, FragmentTransaction ft) {

    }
}
```

ทดสอบรันโปรแกรม

![Tab ActionBar](/images/2014/09/simple-tab.png)

เราก็จะได้ตัว Tab ขึ้นมาแล้ว ต่อไป ก็จะเป็นการใส่ content ให้กับ Tab แต่ละหน้า การใส่คอนเท้น เราจะใช้ Fragment เพื่อเอาไว้แสดงข้อมูล และใช้การ implement `ActionBar.TabListener` 

สร้างคลาส `MyFragment` ขึ้นมา เป็น inner class ไปเลยครับ ดังนี้

```java
package com.devahoy.android.simpletab;

import android.app.ActionBar;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

public class ActionBarTabActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ActionBar actionBar = getActionBar();
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);

        for (int i = 1; i <= 3; i++) {
            ActionBar.Tab tab = actionBar.newTab()
                    .setText("Tab#" + i)
                    .setTabListener(this);
            actionBar.addTab(tab);
        }
    }

    public static class MyFragment extends Fragment {

        private String color;
        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            Bundle args = getArguments();
            color = args.getString("color");
        }

        @Override
        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

            View view = inflater.inflate(R.layout.tab, container, false);

            LinearLayout linearLayout = (LinearLayout) view.findViewById(R.id.linear);
            linearLayout.setBackgroundColor(Color.parseColor(color));

            return view;
        }
    }
}
```

ด้านบนเป็นการสร้าง `Fragment` ขึ้นมา เพื่อจะเอาไว้แสดงเนื้อหา ซึ่งตัวเนื้อหา เป็นเพียงแค่ การเปลี่ยนสีพื้นหลังเฉยๆ โดยรับ argument เป็นโค๊ดสี ที่เมธอด `onCreate` และ `onCreateView()` ก็นำค่าที่ได้ มาแสดงเป็นพื้นหลัง

ต่อมาก็ทำการ implements `ActionBar.TabListener` โดยมี 3 เมธอด ดังนี้

```java
package com.devahoy.android.simpletab;

import android.app.ActionBar;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

public class ActionBarTabActivity extends Activity implements ActionBar.TabListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        ...
    }

    @Override
    public void onTabSelected(ActionBar.Tab tab, FragmentTransaction ft) {

    }

    @Override
    public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction ft) {

    }

    @Override
    public void onTabReselected(ActionBar.Tab tab, FragmentTransaction ft) {

    }
}
```

ส่วนที่เราต้องการคือ เมื่อไหร่ที่ทำการกด Tab ก็จะให้แสดงเนื้อหาขึ้นมา ฉะนั้น เราก็จะทำในเมธอด `onTabSelected()` แล้วก็ทำการสร้าง Fragment ขึ้นภายใน Listener นี้ดังนี้

```java
@Override
public void onTabSelected(ActionBar.Tab tab, FragmentTransaction ft) {

    Fragment fragment = new MyFragment();
    Bundle args = new Bundle();

    switch (tab.getPosition()) {
        case 0:
            args.putString("color", "#2574a9");
            fragment.setArguments(args);
            break;
        case 1:
            args.putString("color", "#36d5b5");
            fragment.setArguments(args);
            break;
        case 2:
            args.putString("color", "#f9640f");
            fragment.setArguments(args);
            break;
    }

    ft.replace(android.R.id.content, fragment);
}
```

ด้านบนก็เป็นการสร้าง Fragment โดยการส่ง argument เป็นค่าสีไปด้วย คำสั่ง `setArguments()` ค่านี้ จะสามารถเข้าถึงด้วย `getArguments().getString()` ในคลาส Fragment สุดท้ายลองรันโปรแกรม จะได้ผลลัพธ์ดังนี้

![ActionBar Tab](/images/2014/09/actionbar-tab2.png)

> อีกบทความนึง ที่พูดถึงการทำ ActionBar Tab ร่วมกับ ViewPager ครับ อ่านได้ที่นี่ [สอนการใช้งาน ViewPager](http://devahoy.com/2014/07/day-13-getting-started-with-view-pager-android/)

## สรุป

ถึงแม้ว่าการสร้าง Tab บน Android จะสามารถสร้างได้หลายวิธี แต่วิธีปัจจุบันที่ดีที่สุด ควรจะใช้ `ActionBar.Tab` มากกว่า เนื่องจากมันถูกออกแบบมาให้ใช้ร่วมกับ `Fragment` และ `FragmentManager` ส่วนการทำ TabHost หรือใช้ TabActivity มันก็สร้างได้เหมือนกัน แต่ว่ามันถูก deprecated ตั้งแต่ API 13 แล้ว ฉะนั้นเลี่ยงได้ก็เลียง ไม่ต้องใช้ครับ เพราะมันการันตีแน่นอน ว่าอนาคต มันจะถูกยกเลิกถาวร จะได้ไม่ต้องมานั่งแก้ไขบ่อยๆ เพื่อให้มองเห็นภาพรวมสั้นๆง่ายๆคือ

- **ActionBar.Tab** : เป็นรูปแบบใหม่ ใช้ Fragment
- **TabHost** : เป็นรูปแบบเก่า ใช้ Activity

[**สุดท้าย Source Code อยู่ที่ Github**](https://github.com/Devahoy/android-simple-tab)