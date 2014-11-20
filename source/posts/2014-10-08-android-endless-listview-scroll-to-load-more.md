---
title: ListView &#58; มาทำ Load More ตอน scroll เพื่อโหลดข้อมูลกันเถอะ
category: Android
cover: /images/2014/10/scrolling-cover.png
tags:
 - Android
 - Android Layout
 - Relative Layout
 - Android Relative
 - แอนดรอยส์ layout
---
---

บทความ Android วันนี้ ขอนำเสนอเรื่อง การทำ Load More ให้กับ ListView ไม่ใช่การทำ Load More ที่มี Button นะ แต่เป็นการใช้การ Scroll เพื่อทำการโหลดข้อมูลใหม่มาแสดงใน ListView

ก่อนที่จะไปเริ่มทำ Load More ListView ด้วยการ Scrolling หากใครยังไม่รู้จัก ListView ก็อ่านหัวข้อด้านล่างเพิ่มเติมครับ

- [การใช้งาน ListView บน Android แบบง่ายๆ](http://devahoy.com/2014/03/android-basic-listview-example/)
- [การทำ Custom ListView](http://devahoy.com/2014/05/android-custom-listview-with-gson-tutorial/#step4-custom-listview)

## Create Project

เริ่มแรก ก็ทำการสร้างโปรเจ็คขึ้นมาเลย 

![Create Project](images/2014/10/create-project1.png)

![Create Project2](images/2014/10/create-project2.png)

![Create Project3](images/2014/10/create-project3.png)

![Create Project4](images/2014/10/create-project4.png)

โปรเจ็คนี้ ไมไ่ด้ใช้ 3rd party หรือ Library อะไรเพิ่มเติมเลย ฉะนั้นก็ไม่ต้องทำอะไรเพิ่ม เปิดไฟล์ `MyActivity.java` ขึ้นมา ทำการแก้ไข โดยเปลี่ยนจากการ extends คลาส `Activity` เป็น `ListActivity` แทน เพื่อความสะดวก และรวดเร็วครับ 

> ListActivity คือ Activity ที่่มี ListView อยู่ภายในอยู่แล้ว เราไม่ต้องสร้าง Layout หรือทำการเชื่อม ListView กลับโปรแกรมอีก เพียงแค่เรียก `getListView()` ก็พอ

`MyActivity.java`

```java
package com.devahoy.android.scrolltoloadlistview;

import android.app.ListActivity;
import android.os.Bundle;

public class MyActivity extends ListActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }
}
```


## สร้าง ListView

ต่อมาทำการสร้าง ListView แบบง่ายๆขึ้นมา โดยผมทำการวนลูป เพื่อสร้างข้อมูล จำนวน 300 ค่า ใส่ตัวแปร `mTotalData` และ ListView แสดงข้อมูลที่ละ 20 แถว เก็บค่าใส่ตัวแปร `mCurrentData` ดังนี้

```java
package com.devahoy.android.scrolltoloadlistview;

import android.app.ListActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MyActivity extends ListActivity {

    private List<String> mTotalData = new ArrayList<String>();
    private List<String> mCurrentData = new ArrayList<String>();

    private int mCurrentPage = 1;
    private int mItemPerRow = 20;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        for (int i = 1; i <= 300; i++) {
            mTotalData.add("Item #" + i);
        }
        
        // init first 20 items
        getData();

        final ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, mCurrentData);
        setListAdapter(adapter);
    }

    private void getData() {

        if (mItemPerRow * mCurrentPage >= mTotalData.size()) {
            Toast.makeText(this, "No Data", Toast.LENGTH_SHORT).show();
            return;
        }

        for (int i = 0; i < mItemPerRow; i++) {
            mCurrentData.add(mTotalData.get(i + (( mCurrentPage - 1) * mItemPerRow)) );
        }
        mCurrentPage += 1;
    }
}
```

จากโค๊ดด้านบน ตรงส่วน `getData()` ก็คือทำการดึงข้อมูลมา 20 ค่า จากทั้งหมด 300 ค่า แล้วมาแสดงใน ListView 

ฟังค์ชันนี้จะใช้ `mCurrentPage` และ `mItemPerRow` เพื่อเอาไว้ดึงข้อมูลจาก `mTotalData` นะครับ ในส่วน `mCurrentPage` จะเอาไว้ระบุว่า เมื่อมีการ Load More ค่านี้ก็จะเพิ่มขึ้น 1 ก็จะทำการดึงข้อมูลในอีก 20 ชุดถัดไป (ตอนนี้ยังไม่มี Load More)

ได้ผลดังนี้

![Step 1](images/2014/10/first-step1.png)

## เพิ่ม Scrolling Load More

ต่อมา เราจะทำการเพิ่มข้อมูล เมื่อเราทำการ Scroll จนถึง item สุดท้ายแล้ว เมธอดที่ใช้คือ `ListView.setOnScrollListener()` คลาสนี้ทำการ extends `ListActivity` ฉะนั้น เราสามารถเรียก `getListView()` ได้เลย แบบนี้

```java
public class MyAct extends ListActivity {

    ...
    
    private boolean isLoadMore = false;
    private Handler mHandler = new Handler();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ...
        
        setListAdapter(adapter);

        getListView().setOnScrollListener(new AbsListView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(AbsListView view, int scrollState) {

            }

            @Override
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                int lastInScreen = firstVisibleItem + visibleItemCount;

                if ((lastInScreen == totalItemCount) && !isLoadMore) {
                    isLoadMore = true;

                    mHandler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            getData();
                            adapter.notifyDataSetChanged();
                            isLoadMore = false;
                        }
                    }, 1500);

                }
            }
        });
    }

    private void getData() {
        ...
    }
}
```

จากโค๊ดด้านบน มีตัวแปรเพิ่มเข้ามาคือ `isLoadMore` เอาไว้เช็คสถานะเพื่อไม่ให้ Load More ซ้ำกันเวลาเราทำการ scroll ตัวต่อไปคือ `mHandler` เป็น runnable object เอาไว้จำลอง ให้การดึงข้อมูล มีการดีเลย์ซักเล็กน้อย เสมือน ดึงข้อมูลมาจาก Web Service :D

ต่อมา `onScrollListener()` เมื่อเราทำการ scroll มันจะไปเรียกเมธอด `onScroll()` โดย parameter ของ `onScroll()` ที่เราต้องสนใจ จะมีดังนี้

- `firstVisibleItem` : คือ ตำแหน่ง ของไอเท็มที่เราเห็นบน ListView ตำแหน่งแรกสุดบนหน้าจอ
- `visibleItemCount` : คือ จำนวน ไอเท็ม/แถว ที่เราสามารถมองเห็นได้ในขณะนั้นๆ (ยิ่งจอใหญ่ยิ่งเห็นเยอะ)
- `totalItemCount`   : คือ จำนวน ไอเท็ม/แถว ทั้งหมดของ ListView

ภายในเมธอด ที่เอาไว้เช็คว่า เมื่อไหร่ ควรจะ Load More ก็คือ 

```
int lastInScreen = firstVisibleItem + visibleItemCount;
```

การนำตำแหน่งของไอเท็มบนสุดของหน้าจอ มาบวกกับ จำนวนไอเท็มทั้งหมดที่หน้าจอจะเห็นได้ ก็จะสามารถรู้ตำแหน่ง ไอเท้มสุดท้ายได้  เมื่อ Scroll จนถึงไอเท้มสุดท้าย ก็ไปทำการ `getData()` ชุดใหม่ มาใส่ ListView อีกครั้ง 

ใช้ `adapter.notifyDataSetChanged();` เพื่อสั่งให้ ListView ทำการ render ข้อมูลใหม่  ทดสอบ โปรแกรมดูอีกครั้ง คราวนี้ เมื่อเลื่อนไปสุด ก็จะโหลดข้อมูลมาใหม่ ต่อท้าย `mCurrentData` เดิมไปเรื่อยๆ

![Step 2](images/2014/10/step2.png)

## เพิ่ม ProgressDialog

เมื่อเราทำการ Load More ดึงข้อมูลชุดใหม่มา ขณะที่กำลังทำการดึงข้อมูล เราควรจะมีการตอบสนองต่อผู้ใช้ หรือว่าอะไรก็แล้วแต่ให้รู้ว่าโปรแกรมยังทำงานอยู่ ในตัวอย่างนี้ ก็จะใช้ `ProgressDialog` เข้ามาช่วย เมื่อทำการ `getData()` ระหว่างนั้นก็จะโชว์ Loading เพื่อรอให้โหลดข้อมูลจนเสร็จ ถึงสั่ง `dismiss()` ดังนี้

```java
package com.devahoy.android.scrolltoloadlistview;

import android.app.ListActivity;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.os.Handler;
import android.widget.AbsListView;
import android.widget.ArrayAdapter;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public class MyAct extends ListActivity {

    ...
    private ProgressDialog mLoading;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        ...
        
        mLoading = new ProgressDialog(this);
        mLoading.setProgressStyle(ProgressDialog.STYLE_SPINNER);
        mLoading.setMessage("Loading....");

        ...
        
            if ((lastInScreen == totalItemCount) && !isLoadMore) {
                isLoadMore = true;
                mLoading.show();

                mHandler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        getData();
                        adapter.notifyDataSetChanged();
                        isLoadMore = false;
                        mLoading.dismiss();
                    }
                }, 1500);

            }

    }

    private void getData() {
        ...
    }
}

```

ด้านบน ใช้ `ProgressDialog` แบบ SPINNER และใส่ข้อความว่า `Loading...` สั่ง `mLoading.show();` เมื่อเริ่มดึงข้อมูล และสั่ง `mLoading.dismiss();` เมื่อทำการดึงข้อมูลเสร็จแล้ว  

ทดลองรันโปรแกรมอีกรอบ

![Step 3](images/2014/10/loading1.png)

## สรุป

ตัวอย่างนี้ก็เป็นการทำ ListView และการดึงข้อมูลใหม่มาแสดง โดยการใช้การ Scroll ข้อมูลที่ได้ก็จะต่อจากข้อมูลเดิม  แต่หากว่า เราไม่อยากให้ข้อมูลมันต่อกันละ แต่อยากให้มันแสดงใหม่เลย เหมือนกับการ refresh ก็ทำได้ โดยการสั่ง clear ข้อมูลใน ListView ซะก่อน และเลื่อนให้ ListView ไปอยู่แถวบนสุด เช่น

```
mCurrentData.clear();
getListView().smoothScrollToPosition(0);
```

ก็ลองๆนำไปประยุกต์ใช้กันดูนะครับ หวังว่าจะเป็นประโยชน์สำหรับผู้ที่กำลังมองหาวิธีทำอยู่นะ

## โค๊ดทั้งหมด (มีไฟล์เดียว)

```java
package com.devahoy.android.scrolltoloadlistview;
 
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.widget.AbsListView;
import android.widget.ArrayAdapter;
import android.widget.Toast;
 
import java.util.ArrayList;
import java.util.List;
 
 
public class MyActivity extends ListActivity {
 
    private List<String> mTotalData = new ArrayList<String>();
    private List<String> mCurrentData = new ArrayList<String>();
 
    private int mCurrentPage = 1;
    private int mItemPerRow = 20;
 
    private boolean isLoadMore = false;
    private Handler mHandler = new Handler();
    private ProgressDialog mLoading;
 
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
 
        mLoading = new ProgressDialog(this);
        mLoading.setProgressStyle(ProgressDialog.STYLE_SPINNER);
        mLoading.setMessage("Loading....");
 
        for (int i = 1; i <= 300; i++) {
            mTotalData.add("Item #" + i);
        }
 
        // init first 20 items
        getData();
 
        final ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, mCurrentData);
 
        setListAdapter(adapter);
 
        getListView().setOnScrollListener(new AbsListView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(AbsListView view, int scrollState) {
 
            }
 
            @Override
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
                int lastInScreen = firstVisibleItem + visibleItemCount;
 
                Log.d("TEST", "first : " + firstVisibleItem);
                Log.d("TEST", "visible : " + visibleItemCount);
                Log.d("TEST", "total : " + totalItemCount);
 
 
                if ((lastInScreen == totalItemCount) && !isLoadMore && (firstVisibleItem != 0)) {
                    isLoadMore = true;
                    mLoading.show();
 
                    mHandler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            getData();
                            adapter.notifyDataSetChanged();
                            isLoadMore = false;
                            mLoading.dismiss();
                        }
                    }, 1500);
 
                }
            }
        });
 
    }
 
    private void getData() {
 
        if (mItemPerRow * mCurrentPage >= mTotalData.size()) {
            Toast.makeText(this, "No Data", Toast.LENGTH_SHORT).show();
            return;
        }
 
        for (int i = 0; i < mItemPerRow; i++) {
            mCurrentData.add(mTotalData.get(i + (( mCurrentPage - 1) * mItemPerRow)) );
        }
 
        mCurrentPage += 1;
    }
}
```
