does not remember much of Andrew Ng course (2012, uncomplete).


here are a few resources for self paced learning

* http://www.kdnuggets.com/2015/11/seven-steps-machine-learning-python.html
* http://conductrics.com/data-science-resources/

introductions

* https://www.analyticsvidhya.com/blog/2015/06/machine-learning-basics/


and notes of Ng course

* http://www.holehouse.org/mlclass


courses online

taking http://videolectures.net/deeplearning2016_precup_machine_learning/

supervised learning
===================

typical problems

* regression      (price of house)
* classification  (orange or apple, recurrence of tumor, ... )


overfitting detection
---------------------
use another dataset (validation), so that we can measure error

bias (error), variance = trade off

>  having more points helps :)

regularization (aka shrinkage)
------------------------------
intuition : complicated hypotheses lead to overfitting

option : change error function (sum of square) to penalize complexity

      e = ebayes + penality(w)

with

      ebayes = sum of square
      penality = lambda . e(w)

> bayes = statistical

unsupervised
============
find clusters in data
eg: aggregate news from different sources
