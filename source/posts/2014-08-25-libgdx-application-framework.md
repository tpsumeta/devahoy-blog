---
title: มาทำความเข้าใจกับ LibGDX ภาคทฤษฎีกันดีกว่า
category: Game Development
tags:
 - Android
 - LibGDX
 - สอน LibGDX
 - LibGDX คือ
 - สอนเขียนเกมส์ Android
 - Android LibGDX
 - สอนเขียนเกม LibGDX
 - แอนดรอยส์
 - สอนแอนดรอยส์
---

## LibGDX Application Framework


## Life Cycle

Life Cycle ของ libGDX จะมีการทำงานที่คล้ายๆกับ Activity Life Cycle ของ Android เช่น ในส่วน `Create`, `Pause`, `Resume`, `Render` และ `dispose` เป็นต้น ตัวอย่าง Diagram ก็เหมือนดังรูปด้านล่าง

![Life Cycle](images/2014/08/life-cycle.png)

## ApplicationListener

`ApplicationListener` เป็น Interface ที่สำคัญใน libGDX เลยเพราะมันรวม Life Cycle ที่พูดไปก่อนหน้านี้ไว้ทั้งหมด วิธีการใช้งาน ก็คือ สร้างคลาสหลัก ขึ้นมา 1 คลาส ทำการ implements `ApplicationListener` ดังนี้

```
public class MyGame implements ApplicationListener {
   public void create () {
   }

   public void render () {        
   }

   public void resize (int width, int height) { 
   }

   public void pause () { 
   }

   public void resume () {
   }

   public void dispose () { 
   }
}
```

จะเห็นว่า เมธอด แต่ละเมธอด มันก็จะมีหน้าที่ของมันใน Life Cycle ซึ่งแต่ละเมธอดมันทำอะไรบ้าง ไปดูครับ

- `create()` : เมธอดนี้จะถูกเรียกครั้งแรกครั้งเดียว คือตอนที่ Application ถูกสร้าง
- `resize(int w, int h)` : เมธอดนี้จะถูกเรียกทุกครั้งเมื่อมีการเปลี่ยนขนาดหน้าจอ เช่น ปรับหน้าจอวินโดว์ หรือบนมือถือ เช่นเปลี่ยนจากแนวตั้งเป็นแนวนอน และเมธอดนี้จะถูกเรียกครั้งแรก หลังจาก create() เช่นกัน parameter width, height คือขนาดกว้าง ยาว ของหน้าจออันใหม่ที่มีการเปลี่ยนแปลง
- `render()` : เมธอดนี้คือหัวใจของ Application เลยก็ว่าได้ เพราะมันคือ Game Loop ครับ เมธอดนี้จะถูกรันตลอดเวลา นึกถึงเวลา render เกมครับ เคยเห็นเกมที่มี FPS (Frame Per Second) มั้ยครับ บางเกมมี FPS 50-60 เช่น เมธอดนี้จะถูกเรียก 50-60 ครั้งต่อวินาที เมธอดนี้จึงเอาไว้สำหรับ render ภาพ หรือว่า Logic ของเกม เช่นการอัพเดทตำแหน่งตัวละคร การรับ Input ของผู้เล่น
- `pause()` : บน Android เมธอดนี้จะถูกเรียกเมื่อมีสายเข้า หรือว่าเวลายูเซอร์กดปุ่ม Home แต่ถ้าใน Desktop จะถูกเรียกก่อน เมธอด dispose() เมื่อออกจากโปรแกรม เมธอดนี้จึงเหมาะสำหรับเก็บค่า state ต่างๆ เช่น เซฟตำแหน่งปัจจุบันผู้เล่น บันทึกแต้มต่างๆ
- `resume()` : เมธอดนี้จะถูกเรียกเฉพาะบน Android เมื่อแอพพลิเคชันถูกเรียกกลับจาก pause state.
- `dispose()` : เมธอดนี้จะถูกเรียกเมื่อกำลังจะปิดแอพพลิเคชัน สิ้นสุดโปรแกรม เป็นเมธอดที่ถูกเรียกหลังสุด

## Modules

ตัว LibGDX นั้นมี Modules หรือว่า Interface ให้เราเลือกใช้หลาย Modules เลยครับ ไม่ต้องมานั่งเขียนเอง สะดวกสบายมาก

### Input

**Input** เป็นโมดูลที่ช่วยให้เราสามารถที่จะ Handler Input ได้ทุก Platform รองรับทั้ง Keyboard, Touch Screen, Accelerometer และ Mouse โมดูลทั้งหมด จะเก็บอยู่ที่่ package 

```
Gdx.input.*
```

ตัวอย่างการนำ Input ไปใช้

- เช็คว่ามีการกด ตัวอักษร D บนแป้น Keyboard หรือไม่ ก็จะใช้โค๊ดนี้

```
boolean isKeyPressed = Gdx.input.isKeyPressed(Keys.D);
```

- เช็คว่ามีการคลิกเมาท์หรือไม่ ?

```
boolean isMouseClicked = Gdx.input.isMouseTouch();
```

- เช็คว่ามีการแตะที่หน้าจอหรือไม่ พร้อมกับระบุตำแหน่ง

```
boolean isTouched = Gdx.input.isTouched();
Gdx.input.getX();
Gdx.input.getY();
```

### Graphics

**Graphics** เป็นโมดูลที่เอาไว้แสดงผลในส่วน Graphic ทำงานร่วมกับ GPU รวมถึง OpenGL อีกทั้งยังมีพวก Utility ต่างๆ เช่น ตรวจสอบรายละเอียดของหน้าจอ Screen ( resolution, density, orientation) และ Frame Rate ด้วย

เช่น 

```
Gdx.graphics.getGL20();
```

หรือ การเช็ค Delta Time

```
Gdx.graphics.getDeltaTime();
```

ตัวโมดูล Graphics นั้นค่อนข้างใหญ่มากๆ มันยังรวม Collection ของพวก 2D และ 3D ต่างๆ เช่น 

- การ render `Sprite`
- การใช้งาน Bitmap Font และมี Bitmap Library
- การ render TMX map
- ทำฉาก 2D ด้วยการใช้ Tween Framework
- รองรับมุมมองแบบ Orthographic และ Perspective
- สามารถโหลด 3D Model ได้
- การทำ Shaders
- Texture และ Texture Atlas
- ใช้ TexturePacker เพื่อทำการรวมรูป png, jpg

### Files

**Files** เป็นโมดูลที่เอาไว้จัดการเกี่ยวกับไฟล์ หรือการโหลด การอ่าน การเขียนไฟล์ภายในเกมของเราทำได้สะดวก และง่าย เช่นการโหลดไฟล์ Assets ต่างๆ (textures, sound, files) 

ตัวอย่างการใช้งานโมดูล Files ก็เช่น 

- ทำการโหลดรูปภาพ `devahoy.png` จากโฟลเดอร์ `assets/logo`

```
Texture texture = new Texture(Gdx.files.internal("logo/devahoy.png"));
```

- ทำการเช็คว่ามีไฟล์นี้อยู่หรือไม่ หรือว่าเช็คว่าเป็นไฟล์หรือโฟลเดอร์ก็ได้ เช่น

```
boolean isExists = Gdx.files.external("hello.txt").exists();
boolean isDirectory = Gdx.files.external("hello/").isDirectory();
```

- อ่านข้อมูล String จากไฟล์

```
FileHandle file = Gdx.files.internal("hello.txt");
String text = file.readString();
```

### Audio

**Audio** เป็นโมดูลที่เอาไว้จัดการเรื่องเสียงในโปรเจ็คเกมของเรา เช่น `Music` สำหรับเล่นเพลงเป็นแบล็คกราวน์ให้เราในขณะเล่นเกม `Sound` เอาไว้แสดงเสียงเอฟเฟคต่างๆ ภายในเกม  ทั้ง `Music` และ `Sound` รองรับฟอแมต WAV, mp3 และ OGG

ตัวอย่างการใช้งาน เช่น

- โหลด `Music` และ `Sound` จากไฟล์

```
Music backgroundMusic =  Gdx.audio.newMusic(Gdx.files.getFileHandle("music.mp3", Files.FileType.Internal));
Sound effect = Gdx.audio.newSound(Gdx.files.getFileHandle("sound.mp3", Files.FileType.Internal));
```

- ทำการโหลด Music มาจาก `assets/data/my_music.mp3` จากนั้นก็ตั้งความดังให้มันครึ่งนึง และสั่งเล่นไปเรื่อยๆ ไม่มีวันหยุด

```
Music music = Gdx.audio.newMusic(Gdx.files.getFileHandle("data/my_music.mp3", FileType.Internal));
music.setVolume(0.5f);
music.play();
music.setLooping(true);
```

### Networking

**Networking** เป็นโมดูลที่เอาไว้จัดการเกี่ยวกับ Network (HTTP GET/POST), TCP Server/Client, Socket เช่น

- การรับส่ง Http Request/Response
- รองรับ TCP Client/Server (GWT)
- Cross-Platform Browser (ลิงค์ไปยังเว็บไซต์ผ่านตัวเกมของเรา)

ตัวอย่างเช่น 

- ทำการเปิด Browser เพื่อเข้าเว็บไซต์

```
Gdx.net.openURI("http://devahoy.com/");
```
- ส่ง GET Method ผ่าน HttpRequest

```
Net.HttpRequest request = new Net.HttpRequest(Net.HttpMethods.GET);
request.setUrl("http://devahoy.com/");
Gdx.net.sendHttpRequest(request, new Net.HttpResponseListener() {
    @Override
    public void handleHttpResponse(Net.HttpResponse httpResponse) {

    }

    @Override
    public void failed(Throwable t) {

    }

    @Override
    public void cancelled() {

    }
});
```

- การสร้าง TCP Client

```
SocketHints hints = new SocketHints();
Gdx.net.newClientSocket(Net.Protocol.TCP, "localhost", 7777, hints);
```

- การสร้าง TCP Server

```
ServerSocketHints hints = new ServerSocketHints();
Gdx.net.newServerSocket(Net.Protocol.TCP, 7777, hints);
```

> GWT ไม่สามารถใช้งาน TCP Client/Server ได้นะครับ

## Reference 

- [LibGDX Wiki on Github](https://github.com/libgdx/libgdx/wiki/)
- [Modules Overview](https://github.com/libgdx/libgdx/wiki/Modules-overview)
