https://jakearchibald.com/2017/es-modules-in-browsers/

found that

ff74
====
```html
<script src="../node_modules/@material/switch/dist/mdc.switch.js" type="module"></script>
```

did produce CORS error
where as


```html
<script src="./mdc.switch.js" type="module"></script>
```

did not.

chromium 70.0.3538.110
======================
does not work:)
