
```
hdparm -t /dev/sda5

/dev/sda5:
 Timing buffered disk reads: 1272 MB in  3.00 seconds = 423.58 MB/sec
```

and

```
root@pokayoke:/home/thenrio/craft/debian# smartctl --attributes /dev/sda5
smartctl 6.4 2014-10-07 r4002 [x86_64-linux-4.1.0-2-amd64] (local build)
Copyright (C) 2002-14, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF READ SMART DATA SECTION ===
SMART Attributes Data Structure revision number: 40
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000f   100   100   000    Pre-fail  Always       -       0
  5 Reallocated_Sector_Ct   0x000f   100   100   000    Pre-fail  Always       -       0
  9 Power_On_Hours          0x0032   100   100   000    Old_age   Always       -       493
 12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       891
169 Unknown_Attribute       0x0022   100   100   010    Old_age   Always       -       1091095758560
173 Wear_Leveling_Count     0x0022   198   198   100    Old_age   Always       -       4300013582
174 Host_Reads_MiB          0x0030   100   100   000    Old_age   Offline      -       1933229
175 Host_Writes_MiB         0x0030   100   100   000    Old_age   Offline      -       973823
192 Power-Off_Retract_Count 0x0032   100   100   000    Old_age   Always       -       47
194 Temperature_Celsius     0x0022   049   049   000    Old_age   Always       -       51 (Min/Max 18/86)
197 Current_Pending_Sector  0x0032   000   000   000    Old_age   Always       -       0
199 UDMA_CRC_Error_Count    0x003e   100   100   000    Old_age   Always       -       0
244 Unknown_Attribute       0x0002   000   000   000    Old_age   Always       -       0
```
