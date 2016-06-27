see that http://linuxcommando.blogspot.fr/2014/09/how-to-optimize-jpeg-images.html

		~/tmp/photos $ time jpegtran -copy none -progressive -optimize < IMGP0622.JPG > imgp0622.min.jpg
		real    0m1.054s
		user    0m1.024s
		sys     0m0.028s

does not yield huge compression 200k over 3.5M
