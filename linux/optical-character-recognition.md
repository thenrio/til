convert pdf to image

    convert -density 600 devis-clio-retrouve-reparation.pdf devis-clio-retrouve-reparation.tif

> this MAY take a long time, tif is data loss

```
~/docs/cars [master*]$ ll devis-clio-retrouve-reparation.*
-rw-r--r-- 1 thenrio    176793 Aug 20 16:57 devis-clio-retrouve-reparation.pdf
-rw-r--r-- 1 thenrio 835115906 Aug 21 13:11 devis-clio-retrouve-reparation.tif
```

convert image to text (OCR)

		tesseract devis-clio-retrouve-reparation.tif stdout
