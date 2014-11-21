## Devahoy Blog  [ ![Codeship Status for Devahoy/devahoy-blog](https://codeship.com/projects/3c9279a0-5307-0132-2f7a-426e83f94b6a/status)](https://codeship.com/projects/48839)

**[Devahoy](http://devahoy.com/)** , a personal website and blog about Android, Web and Games Development. Built with [Middleman](http://middlemanapp.com/), a static site generator.

---

Devahoy เป็นเว็บบล็อคเกี่ยวกับบทความสอน Android, Web และ Games โดยตอนนี้ได้ย้ายมาใช้ Middleman เพื่อ generate static website ซอร์สโค๊ดและบทความทั้งหมด นำไปศึกษาได้ครับ ดูรายละเอียด License ข้างล่างเลย


## Run it locally

clone this repo

	git@github.com:Devahoy/devahoy-blog.git

install all gems

	bundle install

Run middleman and open [http://localhost:4567/](http://localhost:4567/)

	bundle exec middleman server

Generate static folder 

	bundle exec middleman build

## Stack & Tools

- Ruby, Markdown
- [Middleman](http://middlemanapp.com/)
	- [Middleman s3 sync](https://github.com/fredjean/middleman-s3_sync)
    - [Middleman Cloudfront](https://github.com/andrusha/middleman-cloudfront)
	- [Middleman ImageOptim](https://github.com/plasticine/middleman-imageoptim)
	- [Middleman-Blog](https://github.com/middleman/middleman-blog)
- [Bourbon.io](http://bourbon.io/)
- [FluidBox](https://github.com/terrymun/Fluidbox)
- [Trianglify](http://qrohlf.com/trianglify/)
- [Codeship](https://codeship.com/)
- Sublime Text 3 & Brackets

## License

- Feel free to use any of files, link back would be appreciated, but is not required.

- All Articles in folder `source/posts/` are licensed under a [Creative Commons Attribution-Share Alike 3.0 License](https://creativecommons.org/licenses/by-nc-sa/3.0/th/).