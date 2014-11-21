---
title: Command Line พื้นฐานบน Ubuntu
tags:
- Ubuntu
- Command Line พื้นฐาน
- Command Line Ubuntu
---

**สวัสดีทุกท่าน วันนี้ผมได้รวบรวมคำสั่ง command line พื้นฐาน ที่ใช้งานบ่อยๆ สำหรับ Ubuntu มือใหม่ มาฝาก และส่วนตัวก็ให้เป็นแหล่งอ้างอิงด้วย เพราะเริ่มแรก ตอนที่ได้จับ Ubuntu ใหม่ๆ แทบต้องนั่งเปิด SheetCheat แทบทุกครั้ง ตอนหลังก็เริ่มจะจำคำสั่งได้บ้างแล้ว ก็เลยทำมาเป็นบทความซะเลย**


****


## แสดงข้อมูลของระบบและ Kernel

```
uname -i
```

ใช้สำหรับแสดงรายละเอียดทั้งหมดของระบบ


```
df
```

ใช้สำหรับแสดงจำนวนพื้นที่ฮาดดิสท์


```
df -h
```

ใช้สำหรับแสดงจำนวนพื้นที่ฮาดดิสท์ โดยใช้หน่วย megabytes และ gigabytes

free

แสดงข้อมูล จำนวน memory ที่ใช้

top

โชว์รายละเอียดทั้งหมด โปรเซสที่กำลังทำงาน cpu ram อื่นๆ (กด q เพื่อออก)

lsb_release -a

แสดงรายละเอียด linux ที่ใช้ เวอร์ชั่น และ โค๊ดเนม

****


##การจัดการ Process


ps aux

แสดง process ที่กำลังทำงานอยู่

ps aux | grep firefox

แสดงรายละเอียดโปรเซสของ firefox grep คือ regular expression โดยค้นหาโปรเซสชื่อ firefox

kill -9 pid

ปิดโปรเซส ตามไอดีที่ระบุ (ไอดีดูได้จาก ps aux)

killall name

ปิดโปรเซสของโปรแกรม name

****


[adsense-link]


##การจัดการโฟลเดอร์


cd

คำสั่งเปลี่ยน directory

cd /

เปลี่ยน directory ไปที่ root

pwd

ใช้สำหรับแสดง directory ปัจจุบัน

cp

ใช้สำหรับก็อปปี้ ไฟล์/โฟลเดอร์

mkdir

ใช้สำหรับสร้างโฟลเดอร์

rmdir folder1

ลบโฟลเดอร์ folder1 (เฉพาะfolder ที่ไม่มีไฟล์ข้างใน)

rm -R folder1

ลบโฟลเดอร์ folder1 และไฟล์ข้างในทั้งหมด

****


##การจัดการไฟล์


touch file1.txt

สร้างไฟล์ file1.txt

file file1

แสดงนามสกุลของ file1

cat file1.txt

แสดงรายละเอียดข้างใน file1.txt

less file1.txt

เหมือนคำสั่ง cat แต่ต่างกันที่ สามารถเลื่อน scroll bar ได้

cp file1 file2

ก็อปปี้ file1 และสร้าง file2

rm file1

ลบ file1

****


##ls Option


ใช้สำหรับ แสดงรายชื่อไฟล์และโฟลเดอร์

ls

โชว์ไฟล์และโฟลเดอร์

ls -a

โชว์ไฟล์และโฟลเดอร์รวม hidden files ด้วย

ls -l

โชว์ลิสท์แบบยาว มีรายละเอียด permission รวมอยู่ด้วย

ls -s

โชว์ลิสท์โดยเรียง จากขนาดของไฟล์และโฟลเดอร์

ls -t

เรียงตามวันที่แก้ไขล่าสุด

ls -1

โชว์ลิสท์รายชื่อ โดยเรียงบรรทัดละ 1 ชื่อ

ls --color

แสดงรายชื่อ แบบมีไฮไลท์สี

****


[adsense-link]


##การจัดการ Package


sudo apt-get update

ทำการ update รายชื่อpackage ใน lists (เหมือนกับการ check update)

sudo apt-get upgrade

ทำการ upgrade โปรแกรม ที่มีเวอร์ชั่นใหม่ ให้อัพเดท

sudo apt-get install packagename

ติดตั้งโปรแกรม

sudo apt-get -f install

สำหรับแก้ไข package ที่มีปัญหา กรณีเกิด "unmet dependences"

sudo apt-get remove name

ลบ package ชื่อname

sudo apt-get purge name

เหมือนกับ remove แต่จะลบ ไฟล์คอนฟิคด้วย

sudo add-apt-repository ppa:name

เพิ่ม repository (ต้องลง python-software-properties ก่อน)

****


##การจัดการ File Permission


chmod 775 file1

เปลี่ยนโหมดไฟล์เป็น 775

chmod 777 folder1

เปลี่ยน folder1 เป็น 777

chown user:group file1

เปลี่ยนสิทธิ์การเข้าถึงของ file1

****


##อื่นๆ


ifconfig

แสดงรายละเอียด network

nautilus 
sudo nautilus

ใช้สำหรับเปิด file manager (sudo เพื่อเปิดในฐานะ root)

wget url_file

ดาวน์โหลดไฟล์ ตามที่ระบุใน url_file

curl url_file

ดาวน์โหลดไฟล์ ตามที่ระบุใน url_file (แตกต่างจาก wget เล็กน้อย)

    


>รายละเอียด ความแตกต่างระหว่าง wget กับ curl อ่านได้ที่นี่
[wget vs curl](http://daniel.haxx.se/docs/curl-vs-wget.html)




สำหรับใครที่ติดปัญหา หรือมีข้อเสนอแนะเพิ่มเติม สามารถแสดงความคิดเห็น หรือใครอยากฝากความคิดเห็นไปหา 
[กัปตันจอห์น](http://devahoy.com/author/devahoy/) ก็ได้ แล้วผมจะนำจดหมายไปส่งให้ครับ


****


**References :**

[**UsingTheTerminal**](https://help.ubuntu.com/community/UsingTheTerminal)


[**Using a command line**](https://help.ubuntu.com/10.04/basic-commands/C/)
