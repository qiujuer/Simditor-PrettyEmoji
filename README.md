# Simditor Prettyemoji

A pretty emoji plugin for [Simditor](http://simditor.tower.im/).
Insert emoji img to Simditor content.

![Demo](/art/demo1.png)
![Demo](/art/demo2.png)


### Download

Click [github](https://github.com/qiujuer/Simditor-PrettyEmoji/releases) to download the zip file. You can also install Simditor by bower and npm :

$ npm install simditor-prettyemoji
$ bower install simditor-prettyemoji


### Usage

Reference button and dependency script on your page with Simditor:

```html
<link rel="stylesheet" type="text/css" href="/assets/stylesheets/simditor-prettyemoji.css" />
<script src="/assets/javascripts/simditor-prettyemoji.js"></script>
```

Add prettyemoji button config when you initialize Simditor:

```javascript
new Simditor({
	textarea:  $('#txt-editor'),
	toolbar: [..., 'emoji'],
	emoji: {
        autoClose: true,
		imagePath: 'images/emoji/',
        categories: ["face","fashion","animal","food","travel","time","work","font","tool","other"]
	}
})
```

### Parameters

**autoClose** (Type: Bool)

Automatically close the pop-up box after selecting the emoji.

Default: `true`


**imagePath** (Type: String)

Prettyemoji's emojies img path, you can use relative paths or absolute paths.

Default: `'images/emoji/'`


**categories** (Type: Array)

Prettyemoji's categories.

Default: `[
    "face",
    "fashion",
    "animal",
    "food",
    "travel",
    "time",
    "work",
    "font",
    "tool",
    "other"
  ]`



### Demo

Show demo, you need run in command:

```
bower install
npm install
grunt
```

Then, open `demo.html`.