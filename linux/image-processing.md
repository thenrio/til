TL;DR use gm

see that http://linuxcommando.blogspot.fr/2014/09/how-to-optimize-jpeg-images.html

		~/tmp/photos $ time jpegtran -copy none -progressive -optimize < IMGP0622.JPG > imgp0622.min.jpg
		real    0m1.054s
		user    0m1.024s
		sys     0m0.028s

does not yield huge compression 200k over 3.5M

jpegoptim can lossly compress to target size:

```sh
~/tmp $ jpegoptim --size=900Mo gaspard-id*.jpg -d min/
gaspard-id-back.jpg 3264x1836 24bit N Exif  [OK] 1737401 --> 946070 bytes (45.55%), optimized.
gaspard-id-front.jpg 3264x1836 24bit N Exif  [OK] 1731899 --> 938699 bytes (45.80%), optimized.
```

append?

```sh
gm convert gaspard-id-front.jpg gaspard-id-back.jpg -append gaspard-id.jpg
```

And size is? 986164!!

gm default command achieves useful compression AND not lossy (from my eyes).
This is a good thing.
