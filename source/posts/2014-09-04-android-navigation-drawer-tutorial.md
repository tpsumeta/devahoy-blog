---
title: ตัวอย่างการทำ Navigation Drawer บน Android
category: Android
cover: /images/2014/09/navigation-drawer-demo.png
tags:
 - Android
 - สอน Android
 - Android Navigation Drawer
 - Navigation Drawer
 - วิธีทำ Navigation Drawer
 - สอน Navigation Drawer
---

บทความสอน Android วันนี้ขอนำเสนอเรื่อง Navigation Drawer เชื่อว่าหลายๆคนเคยได้ยิน บางคนเคยใช้งานหรือแม้แต่เคยใช้งาน แต่ไม่รู้ว่ามันเรียกว่า Navigation Drawer วันนี้เราจะไปทำความรู้จัก และลองใช้ดูครับ

## Navigaiton Drawer คืออะไร ?

**Navigation Drawer** คือ หน้าที่มันเลื่อนมาจากทางซ้ายของหน้าจอมือถือเรา สำหรับโชว์ข้อมูล หรือว่าโชว์เมนูต่างๆของแอพพลิเคชันเพื่อให้เราเลือกใช้งาน โดยผู้ใช้งานสามาราถเรียก Navigation Drawer มาแสดงได้โดยการ swipe ที่ขอบจอทางด้านซ้ายมือ ดังรูป

![Drawer 1](/images/2014/09/navigation_drawer_open_from_lower.png)

หรือ โดยการแตะที่รูปไอคอนของแอพพลิเคชันบน Action Bar อย่างเช่น ตัวอย่างดังรูป 

![Drawer 2](/images/2014/09/navigation_drawer_overview.png)

*รูปภาพจาก developer.android.com*

## เมื่อไหร่ที่ควรใช้ Navigation Drawer ?

- เมื่อแอพของเรา มีขนาดชั้น (Level) มากกว่า 3 (เลือก Navigation Drawer แล้วกดไปยังหน้าที่ต้องการ ย่อมดีกว่า กด back กลับ 3 ครั้ง เพื่อไปเลือกหน้าที่ต้องการ จริงมั้ยครับ?)

- เมื่อเราต้องการให้ แต่ละหน้า สามารถเข้าถึงได้อย่างรวดเร็ว ผ่านการกดเพียงครั้งเดียว ไอเดียคล้ายๆการมี Dashboard, หน้า Home แบบก่อนๆ

- เป็นหน้าสำหรับรวมลิงค์ต่างๆ เช่น แอพที่มีหมวดหมู่ หรือหน้าจำนวนเยอะมากๆ 


## วิธีการใช้งาน Navigation Drawer

ขั้นแรกเลย สิ่งสำคัญที่เราจะทำ Navigation Drawer เลย เราจำเป็นต้องมีสิ่งต่อไปนี้ครับ

- `DrawerLayout` : คลาสนี้ เป็น RootView คล้ายๆกับทุกๆ layout ที่ต้องมี `LinearLayout`, `RelativeLayout` ได้มาจาก [Support Library](https://developer.android.com/tools/support-library/index.html) ( ตัว Support Library โหลดผ่าน Android SDK Manager)

- `FrameLayout` : เป็นเหมือนกับบล็อคพื้นที่ที่เราต้องการจะให้เนื้อหามาแสดง 

- `Fragment` : เป็นในส่วนของเนื้อหาของแอพพลิเคชัน แต่ละหน้า 

- `ListView` : เป็น List ที่จะแสดงในส่วนของ Navigation Drawer

หากยังไม่เห็นภาพ ให้ลองดูภาพนี้ประกอบครับ

![Sample](/images/2014/09/drawer.png)

รูปด้านบน แสดง Layout โดยดูที่สีม่วงก่อน ตัว `DrawerLayout` จะเป็น RootView เอาไว้ใส่ `FrameLayout` อีกที  ส่วนตำแหน่งตรง `FrameLayout` จะเป็นส่วนของเนื้อหา ซึ่่งเนื้อหาก้จะโหลดมาจาก `Fragment` แต่ละหน้า สมมติมีเนื้อหาอยู่ 3 หน้า  ส่วนสีเขียว ListView มันคือตัว Navigation Drawer ซึ่งปกติ มันจะอยู่เลยหน้าจอออกไป ทำให้เรามองไม่เห็นมัน นอกจากจะกดหรือ swipe มันก็จะถูกเลื่อนออกมาให้เห็นบนหน้าจอ นั่นเอง


## เริ่มต้นสร้างโปรเจ็ค

ทำการสร้างโปรเจ็คขึ้นมาก่อนเลยครับ ผมใช้ Android Studio นะ

![Create Project](/images/2014/09/create-new-project.png)

![Create Project](/images/2014/09/create-new-project2.png)

![Create Project](/images/2014/09/create-new-project3.png)

![Create Project](/images/2014/09/create-new-project4.png)

เปิดไฟล์ `build.gradle` ขึ้นมา ทำการเพิ่ม dependencies ของ Support Library ลงไป

```
dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])
    compile "com.android.support:support-v4:20.0.+"
}
```

ผมใช้ Theme แบบ Light เพราะฉะนั้นในโฟลเดอร์ `res/values/styls.xml` ผมเป็นแบบนี้

```xml
<resources>
    <style name="AppTheme" parent="android:Theme.Holo.Light">

    </style>
</resources>
```

ถ้าจะใช้ Theme Dark ก็เปลี่ยนเป็น `parent="android:Theme.Holo.Light.DarkActionBar"`


จากนั้นทำเปิดไฟล์ `activity_my.xml` แล้วเพิ่มโค๊ดนี้ลงไป

```xml
<android.support.v4.widget.DrawerLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/drawer_layout"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Content -->
    <FrameLayout
        android:id="@+id/container"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />
    
    <!-- Navigation drawer -->
    <ListView android:id="@+id/drawer"
              android:layout_width="240dp"
              android:layout_height="match_parent"
              android:layout_gravity="start"
              android:choiceMode="singleChoice"
              android:dividerHeight="1dp"
              android:background="#ff31415a"/>
</android.support.v4.widget.DrawerLayout>
```

จากโค๊ดด้านบน เราทำการสร้าง Layout โดยใช้ `DrawerLayout` เป็น RootView ใช้ `FrameLayout` เพื่อเอาไว้แสดง/เปลี่ยน `Fragment` และใช้ `ListView` เอาไว้สำหรับ NavigationDrawer

**สิ่งสำคัญเลยสำหรับการทำหน้า Layout**

- **FrameLayout ต้องเป็น View ตัวแรกใน FrameLayout เสมอ เนื่องจาก xml เรียงแบบ z-order ฉะนั้นวาง FrameLayout ไว้ก่อน เพื่อให้ Drawer จะได้อยู่บนเนื้อหาได้**
- **ตัว Drawer หรือ ListView ต้องเซตค่า `layout_gravity` ในแนวนอนให้ด้วย โดยใส่เป็น `left` เพื่อให้อยู่ทางซ้ายของจอ แต่ว่าในโค๊ดใส่ `start` เพื่อลองรับแบบ RTL (บางภาษาอ่านจากขวาไปซ้าย ใช้ start เพื่อให้ Drawer อยู่ฝั่งขวา)**
- **ความกว้างของ Drawer (ListView) ควรอยู่ระหว่าง 240dp ถึง 320dp และความสูงควรจะ `match_parent`**


ต่อมา ก็เปิดไฟล์ `MyActivity.java` ขึ้นมา เพิ่มโค๊ดนี้ลงไป

```java
package com.devahoy.navigationdrawerdemo;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.widget.DrawerLayout;
import android.widget.ArrayAdapter;
import android.widget.ListView;


public class MyActivity extends Activity {

    public static final String KEY_DRAWABLE_ID = "drawableId";

    private String[] mDrawerTitle = {"Cover", "Guitar", "Bass", "Drum"};
    private DrawerLayout mDrawerLayout;
    private ListView mListView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);

        mDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        mListView = (ListView) findViewById(R.id.drawer);

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, mDrawerTitle);

        mListView.setAdapter(adapter);
    }

}
```

ด้านบนเป็นการ เชื่อม View จากไฟล์ Layout และก็ทำการสร้าง ListView เพื่อทำเป็นตัว Drawer จาก ArrayAdapter ส่วน layout ของ ListView ก็ใช้ `android.R.layout.simple_list_item_1` ธรรมดา เมื่อลองรันดูจะได้แบบนี้ (ต้องทำการ swipe จากมุมซ้ายของจอนะ)

![Sample1](/images/2014/09/drawer-example.png)

แต่เป้าหมายเรา ไม่ใช่แค่โชว์ตัว Drawer อย่างเดียว เป้าหมายคือ เราสามารถเปลี่ยนเนื้อหา หรือว่าไปยังหน้าเนื้อหาอื่นๆได้ จากตัว Drawer ฉะนั้นต่อมา เราก็จะมาสร้าง Fragment เพื่อแสดงเนื้อหาใน `DrawerLayout` 


## สร้าง Fragment

ทำการสร้างหน้าเลเอาท์ของ Fragment โดยชื่อว่า `fragment_my.xml` ภายในมีแค่ ImageView อย่างเดียว

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
              android:orientation="vertical"
              android:layout_width="match_parent"
              android:layout_height="match_parent">

    <ImageView android:id="@+id/image"
               android:layout_width="match_parent"
               android:layout_height="match_parent"
               android:scaleType="fitXY"
               android:gravity="center" />

</LinearLayout>
```

ต่อมาสร้างคลาส `MyFragment` ขึ้นมา

```java
package com.devahoy.navigationdrawerdemo;

import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

public class MyFragment extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater,
                             @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {

        int resourceId = getArguments().getInt(MyActivity.KEY_DRAWABLE_ID);
        View view = inflater.inflate(R.layout.fragment_my, container, false);

        ImageView imageView = (ImageView) view.findViewById(R.id.image);
        imageView.setImageResource(resourceId);

        return view;
    }
}
```

ด้านบนเป็นการสร้าง Fragment โดยมี argument ถูกส่งมาตอนสร้าง Fragment ด้วย argument จะเป็น resourceId ของรูปภาพที่ต้องการแสดงใน ImageView เพราะฉะนั้นแต่ละ Fragment ก็จะมีรูปภาพที่แตกต่างกัน 

ต่อมาเปิดไฟล์ `MyActivity` ขึ้นมา ตอนนี้เรามี Drawer แล้ว แต่ว่าเมื่อกดแล้วไม่มีอะไรเกิดขึ้น เพราะว่าเรายังไม่ได้ใช้ Listener เลย ฉะนั้นก็เพิ่ม `OnItemClickListener()` เข้าไป

```java
package com.devahoy.navigationdrawerdemo;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.support.v4.widget.DrawerLayout;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class MyActivity extends Activity {

    private int[] imageResourceIds = {
        R.drawable.cover,
        R.drawable.guitar,
        R.drawable.bass,
        R.drawable.drum
    };
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        ...

        mListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                selectFragment(position);
            }
        });
        selectFragment(0);
    }

    private void selectFragment(int position) {
        Fragment fragment = new MyFragment();
        Bundle args = new Bundle();
        args.putInt(KEY_DRAWABLE_ID, imageResourceIds[position]);
        fragment.setArguments(args);

        FragmentTransaction transaction = getFragmentManager().beginTransaction();
        transaction.replace(R.id.container, fragment);
        transaction.commit();
    }
}
```

ด้านบน เมื่อเราเลือก item ก็จะไปเรียกเมธอด `selectFragment()` แล้วก็ส่ง position ไปเพื่อให้รู้ว่าเราเลือก item ในตำแหน่งไหน ส่วนในเมธอด `selectFragment()` ก็ทำการสร้าง Fragment ขึ้นมาใหม่ จาก `MyFragment` และก็ส่งค่า resourceId ไปเป็น argument  จากนั้นใช้ `FragmentTransaction` เพื่อให้ Fragment ที่เราสร้าง ไปแทนที่ `R.id.container` ซึ่งเป็น `FrameLayout` 

เมื่อทดสอบรันโปรแกรม ก็จะได้ผลดังนี้

![Guitar](/images/2014/09/drawer2.png)

## ActionBarDrawerToggle

ต่อมาจะใช้ `ActionBarDrawerToggle` เพื่อเอาไว้เวลาเราเปิด/ปิด ตัว Drawer ทำการดาวน์โหลดตัว `ic_drawer.png` ที่จะใช้ แล้วเซฟไว้ในโฟลเดอร์ `drawable-xxx` ครับ

![ic_drawer.png](/images/2014/09/ic_drawer.png)

ที่ไฟล์ `MyActivity.java` ทำการเพิ่ม `ActionBarDrawerToggle` ไปดังนี้

```java
public class MyActivity extends Activity {
    private ActionBarDrawerToggle mDrawerToggle;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);

        getActionBar().setDisplayHomeAsUpEnabled(true);
        getActionBar().setHomeButtonEnabled(true);
        
        mDrawerToggle = new ActionBarDrawerToggle(
                this,   // Context
                mDrawerLayout,  // DrawerLayout
                R.drawable.ic_drawer,  // รูปภาพที่จะใช้
                R.string.drawer_open, // ค่า String ในไฟล์ strings.xml
                R.string.drawer_close // ค่า String ในไฟล์ strings.xml 
                ) { 

            public void onDrawerClosed(View view) {
                super.onDrawerClosed(view);
                invalidateOptionsMenu();
            }

            public void onDrawerOpened(View drawerView) {
                super.onDrawerOpened(drawerView);
                invalidateOptionsMenu();
            }
        };

        mDrawerLayout.setDrawerListener(mDrawerToggle);
}
```

ด้านบนเป็นการใช้ `ActionBarDrawerToggle` เพื่อเอาไว้คอยจับสถานะว่า Drawer มันเปิด หรือว่าปิดอยู่  จากนั้นก็ใช้ตัวนี้ ทำการ `setDrawerListener()` ให้กับ DrawerLayout 

ก่อนที่จะใช้งาน `ActionBarDrawerToggle` ต้องสั่งให้ ActionBar โชว์ Home และปุ่ม Button ด้วยคำสั่งนี้ด้วย เพิ่มไปใน `onCreate()` ก่อนการสร้าง `ActionBarDrawerToggle`

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_my);
    
    getActionBar().setDisplayHomeAsUpEnabled(true);
    getActionBar().setHomeButtonEnabled(true);

    mDrawerToggle = new ActionBarDrawerToggle(
    ...
}
```

ส่วนค่า String ก็ทำการเพิ่มในไฟล์ `res/values/strings.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="drawer_open">Open Navigation drawer</string>
    <string name="drawer_close">Close Navigation drawer</string>
</resources>
```

ทดสอบรันโปรแกรมอีกครั้ง 

![Drawer](/images/2014/09/drawer-xx.png)

คราวนี้เรามีตัว `ic_drawer` ขึ้นโชว์ที่ ActionBar แล้ว แต่ว่าต้องการให้กดแล้วโชว์ Drawer ด้วย ตอนนี้ทำได้แค่ swipe ก็เลยต้องเพิ่ม เมธอดนี้ลงไปครับ

```
@Override
public boolean onOptionsItemSelected(MenuItem item) {
    if (mDrawerToggle.onOptionsItemSelected(item)) {
        return true;
    }
    return super.onOptionsItemSelected(item);
}
```

ใช้เมธอด `onOptionsItemSelected` เพื่อเวลากด เมนูบน ActionBar ก็จะใช้ `ActionBarDrawerToggle` จัดการ เปิด/ปิด Drawer ให้เอง เป็นอันเรียบร้อย

![Finish](/images/2014/09/navigation-drawer-demo.png)

หากใครมีปัญหา ลองดู [source code เปรียบเทียบเอานะครับ](https://github.com/Devahoy/navigation-drawer-demo)

> รูปภาพที่ใช้ [Credit : Thaweepong Grunge](https://www.facebook.com/profile.php?id=100000041706306) ผมไม่ได้อัพโหลดรวมไปใน source code นะครับ หากก็อป code ไป ก็ไปเปลี่ยนรูปภาพเอาเอง 