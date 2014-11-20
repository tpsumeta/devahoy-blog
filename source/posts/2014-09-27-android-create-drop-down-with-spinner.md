---
title: มาทำ RESTFul API ด้วย Node.js กับ Express กันดีกว่า
published: false
---

บทความ Android วันนี้ ขอนำเสนอเรื่อง การทำ Drop-Down Menu ด้วยการใช้ Spinner หลักจากที่พบว่าหลายๆคนมีปัญหาเกี่ยวกับการใช้งาน Spinner กันพอสมควร มีบางคนสอบถามมาว่าสร้างยังไง วันนี้ก็จะมานำเสนอ วิธีทำและตัวอย่างประกอบครับ

ตัวอย่าง Spinner

![Spinner](http://devahoy.com/wp-content/uploads/2014/09/spinner.png)

## Create Project

เริ่มต้นสร้างโปรเจ็คขึ้นมา 

![Create Project](http://devahoy.com/wp-content/uploads/2014/09/create-project5-500x361.png)

![Create Project2](http://devahoy.com/wp-content/uploads/2014/09/create-project22-500x361.png)

![Create Project3](http://devahoy.com/wp-content/uploads/2014/09/create-project32-500x360.png)

![Create Project4](http://devahoy.com/wp-content/uploads/2014/09/create-project42-500x361.png)

หากขึ้นข้อความแบบข้างล่างนี้ เนื่องจาก Android Studio เวอร์ชันล่าสุด เปลี่ยนไปใช้ Gradle Plugin เวอร์ชั่น 0.13 ซึ่งมัน required Gradle เวอร์ชัน 2.1 หากเครื่องเราไม่มี มันก็จะทำการเตือน กด OK เพื่ออัพเดท Gradle ครับ

![Gradle SYnc](http://devahoy.com/wp-content/uploads/2014/09/gradle-sync.png)

สังเกตที่ไฟล์ `build.gradle` ในส่วน Root Project ต้องเป็นดังนี้

`build.gradle`

```
// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    ...
    dependencies {
        classpath 'com.android.tools.build:gradle:0.13.0'
    }
}
...
```

อีกไฟล์นึงคือ `gradle/gradle-wrapper.properties` ดูว่า เวอร์ชัน 2.1 ถูกต้องหรือไม่

```
...
distributionUrl=http\://services.gradle.org/distributions/gradle-2.1-all.zip
``` 

หากมีปัญหา ในการสร้างโปรเจ็ค ก็ให้ใช้เวอร์ชันลอง Gradle Plugin และ Gradle ตามด้านบนเลยครับ

## Spinner คืออะไร ?

Spinner เป็น View หรือ Widget ตัวหนึ่งของ Android ที่เอาไว้แสดงเมนูรายชื่อ แบบ Drop-Down 

![]()

ขั้นตอนการสร้าง Spinner มีดังนี้

1. สร้าง Spinner ในไฟล์ xml และทำการเชื่อมกับส่วนของโค๊ด

2. กำหนดลิสต์ข้อมูลที่ต้องการขึ้นมา

3. สร้าง `Adapter` โดยใช้ข้อมูลจากข้อ 2 และเลเอาท์ที่ต้องการ อย่างในตัวย่าง จะใช้ `ArrayAdapter` และเลเอาท์ที่แสดง ก็เป็น default ของ android นั่นก็คือ `android.R.layout.simple_dropdown_item_1line`

4. `setAdapter` ให้กับ Spinner จากข้อ 1 โดยใช้ Adapter จากข้อ 3

## เริ่มต้นสร้าง Spinner

การสร้าง Spinner คล้ายๆกับการทำ ListView ซึ่งจำเป็นต้องมี ข้อมูล ตัวข้อมูลที่เราต้องการให้มาแสดงใน Spinner สามารถสร้างได้โดยการกำหนดเป็น Array ในโปรแกรม หรือว่ากำหนดเป็น string-array ในไฟล์ `strings.xml` ก็ได้ อีกคลาสที่ใช้ในการทำ Spinner ก็คือตัว Adapter อาจจะเป็น `ArrayAdapter` หรือว่าเป็น `CursorAdapter` ที่ไว้สำหรับดึงข้อมูลมาจากฐานข้อมูล

เริ่มต้นเปิดไฟล์ `activity_my.xml` ขึ้นมาครับ ทำการสร้าง Spinner ขึ้นมาสองตัว ดังนี้

```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent" 
    android:padding="32dp"
    android:orientation="vertical">

    <Spinner android:layout_width="wrap_content"
             android:layout_height="wrap_content"
        android:id="@+id/english_club">
        
    </Spinner>

    <Spinner android:layout_width="wrap_content"
             android:layout_height="wrap_content"
             android:layout_marginTop="16dp"
             android:id="@+id/thai_club">

    </Spinner>

</LinearLayout>
```

ตัวอย่าง จะทำการสร้าง Spinner ขึ้นมาสองตัว ตัวแรก เป็นรายชื่อสโมสรฟุตบอลของไทย จะสร้างแบบ ArrayList ในโปรแกรม และตัวที่สอง เป็นรายชื่อสโมสรฟุตบอลของอังกฤษ จะสร้างด้วย string-array ในไฟล์ `strings.xml`

เปิดไฟล์ `MyActivity.java` ขึ้นมา ทำการเชื่อม Spinner ในโค๊ดกับ Layout และกำหนด ArrayList ดังนี้

```java
package com.devahoy.android.spinnerdemo;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Spinner;

import java.util.ArrayList;


public class MyActivity extends Activity {

    private Spinner mEnglishSpinner;
    private Spinner mThaiSpinner;

    private ArrayList<String> mThaiClub = new ArrayList<String>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my);

        mEnglishSpinner = (Spinner) findViewById(R.id.english_club);
        mThaiSpinner = (Spinner) findViewById(R.id.thai_club);
        
        createThaiClubData();
    }

    private void createThaiClubData() {

        mThaiClub.add("Air Force Central");
        mThaiClub.add("Army United");
        mThaiClub.add("Bangkok Glass");
        mThaiClub.add("Bangkok United");
        mThaiClub.add("BEC Tero");
        mThaiClub.add("Buriram United");
        mThaiClub.add("Chainat Hornbill");
        mThaiClub.add("Chiangrai United");
        mThaiClub.add("Chonburi");
        mThaiClub.add("Muangthong United");
        mThaiClub.add("Osotspa Saraburi");
        mThaiClub.add("Police United");
        mThaiClub.add("PTT Rayong");
        mThaiClub.add("Ratchaburi");
        mThaiClub.add("Samut Songkhram");
        mThaiClub.add("Singhtarua");
        mThaiClub.add("Sisaket");
        mThaiClub.add("Songkhla United");
        mThaiClub.add("Supanburi");
        mThaiClub.add("TOT Bangkok");

    }
}
```

- `mThaiSpinner` : คือ Spinner ที่จะแสดงรายชื่อสโมสรไทย
- `mEnglishSpinner` : คือ Spinner ที่จะแสดงรายชื่อสโมสรอังกฤษ
- `mThaiClub` : คือ ArrayList ข้อมูลสโมสรไทย

### สร้างข้อมูลด้วย string-array

ต่อมาทำการสร้างข้อมูลให้กับ Spinner ของสโมสรอังกฤษบ้าง โดยการเพิ่ม string-array ในไฟล์ `res/values/strings.xml` ดังนี้

```xml
<string-array name="club">
    <item>Arsenal</item>
    <item>Aston Villa</item>
    <item>Burnley</item>
    <item>Chelsea</item>
    <item>Crystal Palace</item>
    <item>Everton</item>
    <item>Hull City</item>
    <item>Leicester City</item>
    <item>Liverpool</item>
    <item>Manchester City</item>
    <item>Manchester United</item>
    <item>Newcastle United</item>
    <item>Queens Park Rangers</item>
    <item>Southampton</item>
    <item>Stoke City</item>
    <item>Sunderland</item>
    <item>Swansea City</item>
    <item>Tottenham Hotspur</item>
    <item>West Bromwich Albion</item>
    <item>West Ham United</item>
</string-array>
```

ขั้นตอนต่อไป สร้าง ArrayAdapter ขึ้นมาสองตัว ตัวแรก ใช้ข้อมูล `mThaiClub` ตัวที่สอง ใช้ข้อมูลจาก `strings.xml` ดังนี้

```
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_my);

    mEnglishSpinner = (Spinner) findViewById(R.id.english_club);
    mThaiSpinner = (Spinner) findViewById(R.id.thai_club);

    createThaiClubData();

    // Adapter ตัวแรก
    ArrayAdapter<String> adapterThai = new ArrayAdapter<String>(this,
            android.R.layout.simple_dropdown_item_1line, mThaiClub);
    mThaiSpinner.setAdapter(adapterThai);


    // Adapter ตัวที่สอง
    String[] englishClub = getResources().getStringArray(R.array.club);
    ArrayAdapter<String> adapterEnglish = new ArrayAdapter<String>(this,
            android.R.layout.simple_dropdown_item_1line, englishClub);
    mEnglishSpinner.setAdapter(adapterEnglish);
}
```

ตัว `simple_dropdown_item_1line` เป็นเลเอาท์ default ของทาง Android นะครับ เมื่อทดสอบรันโปรแกรม จะได้หน้าตาดังนี้

![Spinner Demo](http://devahoy.com/wp-content/uploads/2014/09/spinner-demo-300x500.png)

ส่วน layout ของ Spinner เราก็สามารถเปลี่ยนได้นะ ลองใช้ `simple_spinner_item` แทน จะได้ item list ที่ช่องไฟเล็กลง ดังนี้

![Spinner Item](http://devahoy.com/wp-content/uploads/2014/09/spinner-demo2-300x500.png)

สุดท้าย เมื่อได้ Spinner แล้ว ต่อไปก็ใส่ Listener ให้มัน ตัว Spinner จะใช้ `setOnItemSelectedListener()` เพื่อส่ง Listener เมื่อเราทำการเลือกไอเท็มใน Spinner โดยตัว `setOnItemSelectedListerner()` จะรับ interface `AdapterView.OnItemSelectedListener()` ดังนี้

```
// setOnItemSelectedListener
mThaiSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        Toast.makeText(MyActivity.this,
                "Select : " + mThaiClub.get(position),
                Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }
});
mEnglishSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        Toast.makeText(MyActivity.this,
                "Select : " + englishClub[position],
                Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }
});
```

![Spinner Listener](http://devahoy.com/wp-content/uploads/2014/09/spinner-demo3-300x500.png)

## Custom Spinner with Custom Adapter

ตัวอย่างนี้จะทำการสร้าง Custom Spinner โดยใช้ Custom Adapter (คล้ายกับการทำ Custom ListView) เพื่อทำให้ Drop Down ของเรา โชว์รูปภาพ และข้อความด้วย

วิธีการก็คือ เริ่มต้นสร้าง Custom Adapter ขึ้นมาก่อน หากใครไม่รู้จัก Custom Adapter อ่านบทความนี้ประกอบครับ [วิธีการทำ Custom ListView](http://devahoy.com/2014/05/android-custom-listview-with-gson-tutorial/#step4-custom-listview)

สร้างไฟล์ `list_item_adapter.xml` ดังนี้ ใน หนึ่งแถวมี ImageView และ TextView

```xml
<?xml version="1.0" encoding="utf-8"?>

<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
              android:orientation="horizontal"
              android:layout_width="match_parent"
              android:padding="16dp"
              android:layout_height="match_parent">

    <ImageView android:layout_width="32dp"
               android:layout_height="32dp"
               android:src="@drawable/ic_launcher"
               android:layout_gravity="center"
               android:id="@+id/logo"/>

    <TextView android:layout_width="match_parent"
              android:layout_height="wrap_content"
              android:text="Title"
              android:layout_marginLeft="16dp"
              android:layout_gravity="center"
              android:id="@+id/name"/>

</LinearLayout>
```

สร้างไฟล์ `CustomAdapter.java` ขึ้นมาดังนี้

```
package com.devahoy.android.spinnerdemo;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

public class CustomAdapter extends BaseAdapter {

    private Context mContext;
    private ArrayList<String> mData;
    private LayoutInflater mInflater;

    public CustomAdapter(Context context, ArrayList<String> data) {
        mInflater = LayoutInflater.from(context);
        mContext = context;
        mData = data;
    }
    @Override
    public int getCount() {
        return mData.size();
    }

    @Override
    public Object getItem(int position) {
        return mData.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;

        if (convertView == null) {
            holder = new ViewHolder();
            convertView = mInflater.inflate(R.layout.list_item_adapter, parent, false);
            holder.name = (TextView) convertView.findViewById(R.id.name);
            holder.logo = (ImageView) convertView.findViewById(R.id.logo);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        int imgResourceId;
        switch (position) {
            case 0:
                imgResourceId = android.R.drawable.ic_menu_share;
                break;
            case 1:
                imgResourceId = android.R.drawable.ic_menu_call;
                break;
            case 2:
                imgResourceId = android.R.drawable.ic_menu_camera;
                break;
            case 3:
                imgResourceId = android.R.drawable.ic_menu_search;
                break;
            default:
                imgResourceId = android.R.drawable.ic_menu_zoom;
                break;
        }

        holder.name.setText(mData.get(position));
        holder.logo.setImageResource(imgResourceId);

        convertView.setTag(holder);

        return convertView;
    }

    public class ViewHolder {
        TextView name;
        ImageView logo;
    }
}
```

โค๊ดด้านบน สร้าง CustomAdapter ขึ้นมา โดยที่ให้โหลดรูป จาก `android.R.drawable` โดยการใช้ switch case เพื่อแสดงโลโก้ และแสดงชื่อเมนู จาก `ArrayList<String>`

กลับมาที่ไฟล์ `activity_my.xml` ทำการเพิ่ม Spinner เข้ามาอีกตัว

```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="32dp"
    android:orientation="vertical">

    <Spinner android:layout_width="match_parent"
             android:layout_height="wrap_content"
        android:id="@+id/english_club">

    </Spinner>

    <Spinner android:layout_width="match_parent"
             android:layout_height="wrap_content"
             android:layout_marginTop="16dp"
             android:id="@+id/thai_club">

    </Spinner>

    <Spinner android:layout_width="match_parent"
             android:layout_height="wrap_content"
             android:layout_marginTop="16dp"
             android:id="@+id/spinner_menu">

    </Spinner>

</LinearLayout>
```

คลาส `MyActivity.java` ทำการสร้าง Spinner ขึ้นมา โดยใช้ `CustomAdapter` ที่ได้สร้างไว้ พร้อมกับ `ArrayList<String>` ดังนี้

```java
// Spinner with CustomAdapter
Spinner spinnerMenu = (Spinner) findViewById(R.id.spinner_menu);
ArrayList<String> data = new ArrayList<String>();
for (int i = 1; i <= 5; i++) {
    data.add("Menu#" + i);
}

CustomAdapter customAdapter = new CustomAdapter(this, data);
spinnerMenu.setAdapter(customAdapter);
```

ทดสอบรันโปรแกรม ผลลัพธ์เป็นดังนี้

![Custom Spinner ](http://devahoy.com/wp-content/uploads/2014/09/spinner-demo4-300x500.png)


สุดท้าย ก็ลองไปประยุกต์ใช้งานกันดูนะครับ  มีพวกการโหลดข้อมูลมาใส่ Spinner โดยดึงข้อมูลมาจาก SQLite หรือว่าจะเป็นการรับข้อมูลมาจาก Web Service ต่างๆ เป็นต้น สำหรับบทความนี้ก็ยกตัวอย่างมาพอสมควรแล้ว ทีเหลือก็ขึ้นอยู่กับผู้อ่าน นำไปประยุกต์ใช้งานแล้วละครับ ขอให้โชคดี Happy Coding

Source Code : [Github](https://github.com/Devahoy/spinner-demo)

:D