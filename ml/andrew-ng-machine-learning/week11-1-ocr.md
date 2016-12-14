OCR is Optical Character Recognition

processing pipeline MAY look like

* detect text
* character segmentation
* character classification (recognition)

detect text : sliding window
============================
our current problem is text detection.
let's look at another one : pedestrian detection on a photo.

pedestrian detection
--------------------
this one has an interesting property : the aspect ratio (x/y) is more _stable_.

on text : we can have large font, or small one.
when we take a photo with people on it, the aspect ratio is _almost_ the same.

> there be giants ...

eg : we could take slices of images 82x36 and run a neural (or whatever) on a training set.

when we have a new image, then we slide the window,

pick a window size (82x36)
slide it so that we can fit it to a person, rather than cut them in two.
start top left, go x by dx step
y=dy
repeat

then pick la larger size (same ratio)
rince

text detection
--------------
let's start with a fixed size window

that outputs windows where there SHOULD be text.
and we need another step called __expansion__ : group related matches together.
Then we can have words, sentences rather than isolated characters.
This is like _connected_ components.

character segmentation
----------------------
again we can use a sliding window to find _gaps_ in character patch.

    gap = 1
    letter, blank = 0

and it is a __1D__ sliding window.

> that is it has a linear cost.

getting lots of data, artificial data
=====================================
synthetic data : data generated from scratch, or generated from existing data.

* change font
* apply arbitrary background
* blur

synthetizing data by applying distortion.

eg: speech recognition and distortion
add noise : bad cellphone connection, crowd, machinery.

distortion should be representation of phenomena in test set.
-------------------------------------------------------------
(usually, add random noise does not help algorithm).

steps for introducing artificial data
-------------------------------------

1- make sure low bias classifier
  plot learning curve
  keep add features, hidden units in neural when neural, ... until low bias

2- how much work to have 10x current data ?
  artificial data synthesis
  collect and label it yourself
  crowd (mechanical turk???! oh come on!)

what part of the pipeline to work on next ? ceiling analysis
============================================================
recall the pipeline in ocr

    detect text | character segmentation | character classification

> that is the pipe of the list at beginning of document.

and suppose overall accuracy is 72%

then go to the first function and manually provide the correct output.
and continue on the pipeline and measure overall accuracy.
this will give the accuracy of the first function.

    detection perfect -> 89%

repeat to segmentation

    segmentation perfect -> 90%

and the last.


so gains are the following : input -> detect is 17%, detect -> segmentation is 1%, and segmentation -> recognition is 10%.

another example : image recognition
and suppose pipeline is the following

    remove background | detect face (sliding window) | segmentation | (eyes, nose, mouth) | classify

> rest skipped...
