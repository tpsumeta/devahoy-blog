---
title: Android Design &#58; Relative Layout คืออะไร ? + อธิบายพร้อมภาพปลากรอบ
category: Android
cover: /images/2014/11/relative-layout-cover.png
tags:
 - Android
 - Android Layout
 - Relative Layout
 - Android Relative
 - แอนดรอยส์ layout
---

หลักจากที่พูดเรื่อง [LinearLayout กันไปแล้ว](http://devahoy.com/2014/08/android-layout-linear-layout/) มาวันนี้จะมาพูดถึงหน้า Layout อีกแบบนึงที่นิยมใช้ใน Android นั่นก็คือ RelativeLayout ตัว RelativeLayout เป็น Layout อีกชนิดหนึ่ง ที่หากว่าลองศึกษา และใช้งานได้คล่องแล้ว เราสามารถที่จะจัดหน้า Layout ของแอพเรา ได้ตามต้องการเลยหละครับ

## RelativeLayout คืออะไร ?

[![RelativeLayout](/images/2014/11/relativelayout.png)](/images/2014/11/relativelayout.png)

**RelativeLayout** คือ View Group ตัวหนึ่งที่เอาไว้สำหรับแสดง Child View โดยที่การจัดเรียงกันจะมีความสัมพันธ์หรือเกี่ยวข้องกัน เช่น 

- TextView 1 ตัว จะต้องเกี่ยวข้องกับ Parent View ของมัน เช่น อยู่ขวามือของ Parent View หรือ อยู่กึ่งกลาง Parent View
- TextView ตัวแรก อาจจะสัมพันธ์กับ TextView ตัวที่สองคือ ตั้งค่าให้ TextView ตัวแรก อยู่บน ตัวสอง ฉะนั้น หากเราขยับ TextView ตัวสองไปไหน ตัวแรกมันก็จะขยับตามไปอยู่ด้านบนตลอด 

จะเห็นว่า RelativeLayout ต่างจาก LinearLayout โดยสิ้นเชิง เนื่องจากว่า LinearLayout จะเรียงกันแบบเป็นลำดับ ไม่เป็นแนวตั้ง ก็แนวนอนเท่านั้น

## Properties มีอะไรบ้าง ?

ด้านล่างนี้คือรายชื่อ Properties ที่สามารถใช้ได้ ผมทำการแยกออกเป็น 2 ส่วนคือ Properties ที่มีผลกับ Parent View และ Properties ที่มีผลกับ View ด้วยกันเอง เช่น ระหว่าง TextView กับ TextView/EditText

รายละเอียดข้างล่าง หากงงหรือไม่เห็นภาพ แนะนำ ให้ข้ามไปดูตัวอย่างก่อน แล้วกลับขึ้นมาอ่านรายละเอียด แล้วก็กลับไปดูตัวอย่างอีกรอบ จะเข้าใจครับ :D

### Parent

- **`android:layout_alignParentLeft`** : กำหนดเป็น `true` เพื่อกำหนดให้มุมด้านซ้ายของ View นั้นตรงกันกับ มุมด้านซ้ายของ Parent หรือก็คือกำหนดให้ View นี้ไปอยู่ด้านซ้ายของ Parent 

- **`android:layout_alignParentRight`** : กำหนดเป็น `true` เพื่อให้มุมด้านขวาของ View นั้นตรงกันกับมุมด้านขวามือของ Parent หรือก็คือกำหนดให้ View นี้ไปอยู่ด้านขวาของ Parent

- **`android:layout_alignParentTop`** : กำหนดเป็น `true` เพื่อบอกให้ View ไปอยู่ตำแหน่งด้านบนของ Parent

- **`android:layout_alignParentBottom`** : หากตั้งค่าเป็น `true` ก็คือเป็นการกำหนดให้ View นั้นๆ อยู่ในส่วนด้านล่างของ Parent

- **`android:layout_alignParentStart`** : (API 17+) เป็นการกำหนดให้ View ไปอยู่ในตำแหน่งเริ่มต้นของ Parent (อันนี้จะเอาไว้สำหรับรองรับหลายภาษา เช่น ภาษาที่อ่านจากด้านขวามาซ้าย start ก็คือด้านขวา แต่ถ้าภาษาที่อ่านจากซ้ายไปขวา start ก็คือด้านซ้าย นั่นเอง)

- **`android:layout_alignParentEnd`** : (API 17+) ตรงกันข้ามกับ `layout_alignParentStart` เลย คือหมายถึงตำแหน่งสิ้นสุดของ Parent 

- **`android:layout_centerInParent`** : กำหนดเป็น `true` เพื่อให้ตัว View ไปอยู่ตำแหน่งกึ่งกลางของ Parent

- **`android:layout_centerHorizontal`** : กำหนดเป็น `true` เพื่อให้ View ไปอยู่ตำแหน่งกึ่งกลางของ Parent แบบแนวนอน

- **`android:layout_centerVertical`** : กำหนดเป็น `true` เพื่อให้ View ไปอยู่ตำแหน่งกึ่งกลางของ Parent ในแบบแนวตั้ง


### View

- **`android:layout_alignBaseline`** : คือเป็นการกำหนดตำแหน่ง Baseline โดยอ้างอิงจาก View อีกตัวหนึ่ง (ฺBaseline คืออะไร ? [อ่านต่อที่นี่](http://en.wikipedia.org/wiki/Baseline_%28typography%29)) ส่วนมากจะเอาไว้กำหนด เช่นมี TextView 2 ตัว ตัวอักษรขนาดต่างกัน หากเราไม่กำหนด Baseline โดยอ้างอิงกับอีกตัว ตัวบรรทัดมันก็จะไม่เท่ากัน แต่หากกำหนด Baseline ไว้ ถึงแม้ว่าตัวอักษรจะใหญ่กว่า แต่บรรทัดก็จะเท่ากัน

- **`android:layout_alignBottom`** : เป็นการกำหนดให้ส่วนขอบด้านล่างของ View นั้น ตรงกันกับ View อีกตัวที่อ้างถึง (โดยมากเราจะอ้างถึง id ของ View)

- **`android:layout_alignTop`** : เป็นการกำหนดให้ส่วนขอบด้านบนของ View ตรงกันกับด้านบนของ View อีกตัวที่เราอ้างถึง 

- **`android:layout_alignLeft`** : เป็นการกำหนดให้ส่วนขอบด้านซ้ายของ View ตรงกันกับด้านซ้ายของ View อีกตัวที่เราอ้างถึง

- **`android:layout_alignRight`** : กำหนดให้ส่วนขอบด้านขวาของ View ตรงกันกับด้านขวาของ View อีกตัวที่เราอ้างอิงถึง

- **`android:layout_alignStart`** : (API 17) อันนี้เป็นการกำหนดเพื่อใช้ในกรณีที่ภาษาที่อ่านจากด้านขวามาซ้าย หรือ จากซ้ายมาขวา จะมีความแตกต่างกัน ตัวนี้คือจัดให้ตำแหน่ง Start ของ View ตรงกันกับ View อีกตัวหนึ่ง

- **`android:layout_alignEnd`** : (API 17) ตรงกันข้ามกับ `alignStart` คือใช้จัดตำแหน่ง End ของ View ให้ตรงกันกับ View อีกตัว


- **`android:layout_above`** : เป็นการกำหนดให้ View ไปอยู่ด้านบน ของ View อีกตัวที่เราอ้างอิงถึง

- **`android:layout_below`** : เป็นการกำหนดให้ View ไปอยู่ที่ตำแหน่งด้านล่างของ View อีกตัวที่อ้างอิงถึง

- **`android:layout_toLeftOf`** : เป็นการกำหนดให้ View ไปอยู่ตำแหน่งด้านซ้ายมือของ View อีกตัวที่อ้างถึง
 
- **`android:layout_toRightOf`** : เป็นการกำหนดให้ View ไปอยู่ตำแหน่งด้านขวามือของ View อีกตัวที่เราอ้างอิงถึง

- **`android:layout_alignWithParentIfMissing`** : อันนี้จะพิเศษหน่อย มันคือการอ้างอิงทั้ง View ด้วยกันเอง และ Parent ตัวนี้คือออปชั่นเสริม ในกรณีที่เราทำการอ้างอิงกับ View ด้วยกันเอง เช่น ให้ View1 อยู่ด้านบนของ View2 แต่เผอิญว่าเราลบ View2 ทิ้ง ตัว id ที่เราอ้างอิงถึงก็จะไม่เจอ มันก็จะไปจัดตำแหน่งเทียบกับ Parent แทน

- **[Reference : RelativeLayout.LayoutParams](http://developer.android.com/reference/android/widget/RelativeLayout.LayoutParams.html)**

---

## ตัวอย่างการใช้งาน RelativeLayout

### Parent

ในส่วนนี้จะเป็นการแสดง การจัดตำแหน่งของ Relative โดยอ้างอิงกับตัว Parent ในตัวอย่าง ผมจะใช้ `Button` เป็นสี่เหลี่ยมจัตุรัส ขนาด 64 x 64 และมีสีแตกต่างกัน พร้อมกับมีตัวเลขบอก จำนวน 9 รูป แสดงตำแหน่ง ในตำแหน่งที่ต่างๆกัน ดังรูป

![Relative Layout Parent](/images/2014/11/relative-demo-parent.png)

จะเห็นว่า ในรูปด้านบน การจัดตำแหน่งให้อ้างอิงกับ Parent นั้น อ้างอิงเพียงแค่ 1 หรือ 2 บรรทัด เท่านั้น ก็สามารถที่จะจัดตำแหน่งไปยังตำแหน่งที่เราต้องการได้แล้ว  มาดูคำอธิบายคร่าวๆกัน ยกมาทุกตัวคงไม่ไหว

- **หมายเลข 2** : ตัวอย่างนี้ แค่ใส่ `android:layout_centerHorizontal="true"` ก็อยู่กึ่งกลางของ Parent ในแกนแนวนอนแล้ว ส่วน Top ไม่ต้องใส่เนื่องจากตัว View เริ่มนับจากมุมบนซ้าย (ตำแหน่ง 0, 0) ทำให้มันอยู่ด้านบนอยู่แล้ว

- **หมายเลข 6** : ตัวอย่างนี้ ต้องใส่ `android:layout_centerVertical="true"` และ `android:layout_alignParentRight="true"` เพื่อปรับให้อยู่กึ่งกลาง Parent ในแนวแกนตั้ง และขยับตัว View ไปให้ชิดติดกับ Parent ในด้านขวามือของ View

ตัวไฟล์ `relative_with_parent.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
 
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:padding="16dp"
                android:layout_width="match_parent"
                android:layout_height="match_parent">
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:background="#e51c23"
        android:text="1"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:layout_alignParentTop="true"/>
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:background="#3f51b5"
        android:text="2"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:layout_centerHorizontal="true"/>
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:text="3"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:background="#009688"
        android:layout_alignParentRight="true"/>
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:background="#259b24"
        android:text="4"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:layout_centerVertical="true"/>
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:background="#ff5722"
        android:text="5"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:layout_centerInParent="true"/>
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:background="#5677fc"
        android:text="6"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:layout_centerVertical="true"
        android:layout_alignParentRight="true"/>
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:background="#e91e63"
        android:text="7"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:layout_alignParentBottom="true"/>
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:background="#9c27b0"
        android:text="8"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:layout_centerHorizontal="true"
        android:layout_alignParentBottom="true"/>
 
    <Button
        android:layout_width="64dp"
        android:layout_height="64dp"
        android:background="#607d8b"
        android:text="9"
        android:textSize="20sp"
        android:textColor="#ffffff"
        android:layout_alignParentBottom="true"
        android:layout_alignParentRight="true"/>
 
</RelativeLayout>
```

เมื่อดูเฉพาะส่วนที่เอาไว้จัดการกับ Layout จะเห็นว่าแต่ละ View นั้นกำหนดเพียงแค่ 1-2 attribute เท่านั้นเอง 

[![Relative Parent](/images/2014/11/relative-vector.png)](/images/2014/11/relative-vector.png)

### View

ในส่วนนี้จะเป็นการจัดหน้า Layout โดยการจัดตำแหน่งให้มีความสัมพันธ์กันกับ View อื่นๆ คือ เมื่อ View อื่นๆที่เราทำการอ้างอิงมีการเปลี่ยนตำแหน่ง มันก็จะเปลี่ยนตำแหน่งตามไปด้วย

มาดูตัวอย่างกันดีกว่าครับ เริ่มจาก ผมทำการสร้างหน้า Layout ขึ้นมา มี Button ทั้งหมด 4 อัน แบ่งตามสี และมีชื่อประกอบด้วย B1, B2, B3 และ B4 ดังภาพด้านล่างเลย

![Relative Layout View ](/images/2014/11/relative-demo-view.png)

ตัวโค๊ดก็ได้ดังนี้

```xml
<?xml version="1.0" encoding="utf-8"?>
 
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:padding="32dp"
                android:layout_width="match_parent"
                android:layout_height="match_parent">
 
    <Button android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:background="#00897b"
            android:padding="32dp"
            android:id="@+id/b1"
            android:textSize="20sp"
            android:textColor="#ffffff"
            android:gravity="center"
            android:text="B1"/>
 
    <Button android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:background="#5677fc"
            android:padding="32dp"
            android:id="@+id/b2"
            android:layout_below="@id/b1"
            android:textSize="20sp"
            android:textColor="#ffffff"
            android:gravity="center"
            android:text="B2"/>
 
    <Button android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:background="#e91e63"
            android:padding="32dp"
            android:id="@+id/b3"
            android:layout_below="@id/b2"
            android:textSize="20sp"
            android:textColor="#ffffff"
            android:gravity="center"
            android:text="B3"/>
 
    <Button android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:background="#ff6f00"
            android:padding="32dp"
            android:textSize="20sp"
            android:textColor="#ffffff"
            android:gravity="center"
            android:id="@+id/b4"
            android:text="B4"
            android:layout_alignParentBottom="true"/>
 
</RelativeLayout>
```

##### ทีนี้มาดูว่าแต่ละอันมันสัมพันธ์กันอย่างไร ?

- **B1** : สีเขียว อยู่ที่ตำแหน่งบนสุดของ Parent เลย ไม่ได้ตั้งค่าอะไรทั้งสิ้น เนื่องจาก Default ของมัน จะเริ่มจากจุดบนซ้าย ของ Parent เสมอ
- **B2** : สีฟ้า อยู่ตำแหน่งด้านล่างของ **B1** เพราะว่าเราตั้งค่าบอกว่า ให้ B2 อยู่ด้านล่างของ B1 เสมอ โดยอ้างอิง id ของ B1 ดังนี้ `android:layout_below="@id/b1"` 
- **B3** : สีชมพู อยู่ตำแหน่งด้านล่างของ **B2** และการตั้งค่าก็คล้ายๆกับ **B2** อ้างถึง **B1** เลย คืออ้างอิง id ของ **B2** เพื่อระบุว่าให้อยู่ด้านล่างของ **B2** ดังนี้ `android:layout_below="@id/b2"`
- **B4** : สีส้ม อยู่ตำแหน่งล่างสุดของจอ โดยการระบุว่าให้อยู่ติดกับด้านล่างของ Parent นะ ไม่ต้องไปสนใจใคร `android:layout_below="@id/b2"` 

เมื่อดูแล้ว จะเห็นว่า B1, B2 และ B3 มีความสัมพันธ์กันอยู่ และ B4 ไม่ได้เกี่ยวข้องอะไรกับใครเลย ยึดติดกับ Parent อย่างเดียว (ลูกติดแม่) :D

ต่อมา จะเกิดอะไรขึ้น 

#### Step 1
ถ้าเราเปลี่ยนแปลงตำแหน่งของ **B2** ซักหน่อย โดยเพิ่ม `marginTop` ไปซัก 64dp ดังนี้ `android:layout_marginTop="64dp"` ตอนนี้เลเอาท์เราจะได้ดังรูป

![Relative Layout View 1](/images/2014/11/relative-view2.png)

จะเห็นว่า **B2** เราบอกให้มันจัด margin ด้านบน 64dp ถูกต้องแล้ว แต่ว่า **B3** เราไม่ได้ทำอะไรให้มันเลย แต่ว่ามันขยับตำแหน่งเนื่่องจาก มันเกาะติด **B2** อยู่ เพราะว่าเราไป ตั้งค่าว่าให้ **B3** อยู่ด้านล่างของ **B2** เสมอ ไม่ว่า **B2** มันจะไปอยู่ตรงไหนก็ตาม 

#### Step 2
ทีนี้เปลี่ยนอีกครั้ง โดยการเพิ่ม `marginTop` ให้กับ **B1** บ้าง ดังนี้ `android:layout_marginTop="64dp"` ตอนนี้เลเอาท์ก็จะได้ดังรูป

![Relative Layout View 2](/images/2014/11/relative-demo-view2.png)

เหมือนกันกับ กรณีของ **B2** และ **B3** เลย เมื่อเราปรับ margin ให้กับ **B1** แต่ว่า **B2** ถูกสั่งว่าให้อยู่ด้านล่าง **B1** มันก็จะอยู่ด้านล่าง **B1** เสมอ เช่นกัน **B3** มันถูกสั่งให้อยู่ด้านล่าง **B2** ก็เลยต้องได้ผลลัพธ์ตามไปด้วย จะเห็นว่าเราแก้แค่ B1 เอง แต่ว่ามีผลทั้ง 3 ตัวเลย

#### Step 3
ทีนี้ เราแก้ไข **B3** บ้าง โดยบอกให้มันอยู่ด้านบนของ **B4** ด้วยนะ คือตอนนี้อยู่ด้านล่างของ **B2** แล้ว ยังต้องอยู่ด้านบนของ **B4** ด้วย `android:layout_above="@id/b4"` ตอนนี้เลเอาท์จะได้ดังนี้

![Relative Layout View 3](/images/2014/11/relative-demo-view3.png)

จะเห็นว่า ตัว **B3** ถูกยืดมาให้อยู่ด้านบนของ **B4** ทำให้มันมีขนาดที่สูงขึ้น

#### Step 4

ต่อมา เปลี่ยน **B4** โดยตั้งค่าให้ **B4** อยู่ด้านล่างของ **B2** ดังนี้ `android:layout_below="@id/b2"` ก็จะได้เลเอาท์แบบนี้

![Relative Layout View 4](/images/2014/11/relative-demo-view4.png)

สังเกตว่า ตัว **B4** ถูกยืดไปให้ติด **B2** เลย เหมือนอย่างกรณีที่ **B3** ถูกยืดไปให้ติด **B4** ใน Step4 แต่ว่าในตอนนี้ **B4** ถูกยืดติดกับ **B2** แล้ว **B3** ที่ตั้งค่าไว้ให้มันอยู่ด้านล่าง **B2** และด้านบน **B4** ละไปไหน ? คำตอบคือ มันหายไปแล้วครับ เนื่องจากว่า ตั้งค่าซ้ำซ้อน กัน จนทำให้ **B3** ไม่มีที่ยืน ความสูงเลยเป็น 0 เลย

#### Step 4.2

อันนี้คือ Step4 แต่เปลี่ยนเป็นอีกเงื่อนไขนึงครับ แทนที่เราจะให้ **B4** อยู่ด้านล่างของ **B2** เราก็ให้มันอยู่ด้านล่าง **B1** แทน ดังนี้ `` ก็จะได้เลเอาท์ออกมาแบบนี้

![Relative Layout View 5](/images/2014/11/relative-demo-view5.png)

จะเห็นว่า **B4** มันถูกยืดไปถึง **B1** เลยเนื้องจากว่ามันถูกตั้งค่าว่า ให้ติดกับ bottom ของ Parent ห้ามไปไหนนะ ทำให้ความสูงมันถูกยืดตาม **B1** แล้ว **B2** กับ **B3** ก็หายไป แล้วมันแตกต่างอย่างไร กับ Step4 คำตอบคือ ต่างกันที่ **B2** ไม่หายครับ แต่ว่าถูกทับอยู่ เนื่องจากว่าเราตั้งค่าให้ **B2** มีผลแค่ **B1** และ **B3** เท่านั้น ทำให้มันไม่มีผลอะไรกับ **B4** เพียงแค่มันถูกบังอยู่เท่านั้น ในขณะที่ **B3** นั้นหายไปเลย ไม่ได้ถูกบังแต่อย่างใด 

หากไม่เชื่อ ลองเอา `android:layout_alignParentBottom="true"` ออกจาก **B4** ดูครับ จะได้ผลลัพธ์ว่า **B2** ยังอยู่นะ ดังรูป

![Relative Layout View 6 ](/images/2014/11/relative-demo-view6.png)


> อาจจะงงๆตรง B1, B2, B3 และ B4 กันนะครับ ชื่ออาจจะทำให้สับสน และคล้ายกันไปซักนิด แต่ถ้าอ่านดูดีๆ จะเข้าใจ มั้งครับ

สุดท้าย ตัวอย่างการทำ Overlay Image โดยใช้ Relative Layout ไม่ขออธิบาย ลองดูโค๊ดประกอบเลยละกันครับ 

```xml
<?xml version="1.0" encoding="utf-8"?>
 
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:layout_width="match_parent"
                android:layout_height="match_parent">
 
    <ImageView
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:scaleType="fitXY"
        android:src="@drawable/bg"
        android:layout_alignParentRight="true"
        android:layout_alignParentLeft="true"
        android:id="@+id/image"/>
 
    <LinearLayout android:layout_width="match_parent"
                  android:layout_height="wrap_content"
                  android:layout_alignParentBottom="true"
                  android:background="#66222222"
                  android:padding="24dp" >
        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="Country roads, take me home. To the place I belong, West Virginia...."
            android:textColor="@android:color/white"
            android:textSize="18sp"
            android:textStyle="bold"
            android:id="@+id/title"
            />
    </LinearLayout>
 
</RelativeLayout>
```

จะได้รูปแบบนี้ (รูปตัวอย่างจาก [Gratisography](http://www.gratisography.com/) ไม่ได้รวมอยู่ด้วยนะครับ ไปหาโหลดหรือเปลี่ยนเอาเอง

[![Relative Overlay Images](/images/2014/11/relative-overlay.png)](/images/2014/11/relative-overlay.png)

### สรุป

สรุปแล้ว Relative มี 2 แบบ คือ Relative แบบอ้างอิงกับ Parent และ Relative ที่อ้างอิงกับ View ด้วยกันเอง หากเปรียบง่ายๆ Relative แบบอ้างอิง Parent ก็เปรียบเสมือนหนุ่มที่รักครอบครัวครับ ภรรยาบอกอะไร ก็ทำตาม ไม่ออกนอกลู่นอกทาง  ส่วน Relative แบบอ้างอิง View ด้วยกันเอง นี่เเปรียบเสมือนหนุ่มที่เจ้าชู้ครับ ตามจีบสาวไปทั่ว สาวไปไหน ผมตามไปด้วย :-) ฮ่าๆ ด้านบน เปรียบเทียบขำๆนะครับ 

- Relative Layout จะต้องระบุ id ให้เป็น unique เพื่อที่จะสามารถอ้างอิงจาก View อื่นๆ ได้
- ใช้ Relative Layout แทนที่ Linear Layout แบบหลายๆชั้น ช่วยเพิ่ม Perfomance ให้กับแอพได้
- การอ้างอิงตำแหน่งของ Relative จะอ้างอิงที่ตำแหน่งของขอบ (edge) ของ View, กึ่งกลางแนวตั้ง และ กึ่งกลางแนวนอน ของ Parent
- Relative Layout ไม่สามารถจัดการเรื่อง `layout_weight` ได้เหมือนกับ Linear Layout
- Relative Layout มีข้อเสียคือ หากเราทำการอ้างอิง View ต่อกันเป็นทอดๆ หากเราไปแก้ไขตำแหน่ง View เพียงอันเดียว อาจจะกระทบกับ Layout ทั้งหมดได้ และหากจัดการซ้อนกันไปซ้อนกันมา อาจทำให้บาง View หายเหมือนอย่าง B3 ก็ได้นะ

ที่นึกออกก็มีประมาณนี้ ไม่รู้ถูกหรือเปล่านะครับ ลองนำ Relative Layout ไปใช้ และปรับแต่งดูครับ เชื่อว่ามีประโยชน์แน่นอน และการใช้ Relative บางทีก็ดีกว่าการใช้ LinearLayout แบบซ้อนกัน หลายๆชั้นด้วย ซึ่งการสร้าง Layout แบบซ้อนกัน ยิ่งน้อย ยิ่งทำให้แอพมี Performance ที่สูงและมีประสิทธิภาพกว่าแอพที่ทำ Layout ซ้อนกันแบบเยอะๆ สุดท้ายการออกแบบเลเอาท์ที่ดี คือการลงมือทำ และทำเยอะๆครับ ไม่มีเทคนิคหรือสูตรลัดอะไร มีเพียงการ ลงมือทำ และฝึกทำ เท่านั้นครับ 

Happy Coding :D