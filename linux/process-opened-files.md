given

pid=$(pgrep -f shop)

then

use /proc
---------

ls /proc/$pid/fd | wc -l
243

use lsof
--------

lsof -p $pid | wc -l
392

why diff?
---------
diff is as in https://access.redhat.com/solutions/1210583

lsof -p $pid -a -d ^mem -d ^cwd -d ^rtd -d ^txt -d ^DEL | wc -l
244

or

lsof -p $pid -a -d ^mem,^cwd,^rtd,^txt,^del | wc -l
244

change limit for process
------------------------

$ prlimit --nofile --pid $pid
RESOURCE DESCRIPTION                 SOFT    HARD UNITS
NOFILE   max number of open files 1048576 1048576 files

$ prlimit --nofile=150:150 --pid $pid

$ prlimit --nofile --pid $pid
RESOURCE DESCRIPTION              SOFT HARD UNITS
NOFILE   max number of open files  150  150 files
