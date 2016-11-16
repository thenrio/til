problem is

    frgbmrfid1061l1
    Wed Nov 16 09:46:33 CET 2016
    read end-of-seasons/BNB-PE16.csv.gz with brand BNB
      > 1169 items written to /tmp/items.BNB.csv
      > http 201 1.057 39872
    read end-of-seasons/CCH-PE16.csv.gz with brand CCH
      > 1852 items written to /tmp/items.CCH.csv
      > http 201 1.512 63094
    shop: stopped
    read end-of-seasons/BNB-PE16.csv.gz with brand BNB
      > 5392 products deleted
    read end-of-seasons/CCH-PE16.csv.gz with brand CCH
      > 23803 products deleted
    2684 inventories deleted
    shop: started

    real	0m29.966s
    user	0m7.560s
    sys	0m2.592s

    frgbmrfid1259l1
    Wed Nov 16 09:46:35 CET 2016
    read end-of-seasons/BNB-PE16.csv.gz with brand BNB
      > 1794 items written to /tmp/items.BNB.csv
      > http 201 1.990 61122
    read end-of-seasons/BRE-PE16.csv.gz with brand BRE
      > 2257 items written to /tmp/items.BRE.csv
      > http 201 3.099 76864
    read end-of-seasons/CCH-PE16.csv.gz with brand CCH
    Error: near line 1: database is locked

    real	0m6.935s
    user	0m1.484s
    sys	0m0.128s

    frbrerfid816l1
    Wed Nov 16 09:46:36 CET 2016
    read end-of-seasons/BRE-PE16.csv.gz with brand BRE
      > 1506 items written to /tmp/items.BRE.csv
      > http 201 1.615 51330
    shop: stopped
    read end-of-seasons/BRE-PE16.csv.gz with brand BRE
      > 7846 products deleted
    1256 inventories deleted
    shop: started

    real	0m17.356s
    user	0m1.700s
    sys	0m0.548s

want to extract only hostnames that have errors

here is a working ruby implementation

	irb(main):026:0> re = %r{^(fr.*?\n).*?locked$}m
	=> /^(fr.*?\n).*?locked$/m
	irb(main):027:0> s.scan re
	=> [["frgbmrfid1061l1\n"]]


