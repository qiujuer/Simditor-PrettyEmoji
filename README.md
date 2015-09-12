# Simditor PrettyEmoji

[Simditor](http://simditor.tower.im/) 的表情扩展，为工具栏提供按钮，在内容中插入 Emoji 图片。

###如何使用

在 Simditor 的基础上额外引用 simditor-prettyemoji 的脚本和样式

```html
<link rel="stylesheet" type="text/css" href="/assets/stylesheets/simditor-prettyemoji.css" />
<script src="/assets/javascripts/simditor-prettyemoji.js"></script>
```

配置

```javascript
new Simditor({
	textarea: textareaElement,
	...,
	toolbar: [..., 'emoji'],
	emoji: {
    autoClose: true,
		imagePath: 'images/emoji/',
    categories: ["face","fashion","animal","food","travel","time","work","font","tool","other"]
	}
})
```

###参数

**autoClose** (Type: Bool)

emoji 选中后是否自动关闭弹出框

默认值: `true`


**imagePath** (Type: String)

emoji 图片的路径，相对或者绝对路径都可以

默认值: `'images/emoji/'`


**categories** (Type: Array)

按钮菜单中提供哪些 emoji 类别供用户选择

默认值: `[
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
