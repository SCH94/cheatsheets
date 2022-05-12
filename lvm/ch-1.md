Install oracle linux server using LVM
-------------------------------

    +--------+     +--------+    +-------+    +-------+
    |        | --> | volume |--> |       |--> |       |
    |physical|     |        |    |logical|    | file  |
    | volume |     |  group |    |volume |    | system|
    |        |     |        |    |       |    |       |
    +---+----+     +--------+    +-------+    +-------+
                       :       
                       |         +-------+    +-------+
                       +-------> |       |--> |       |
		                 |logical|    | file  |
				 |volume |    | system|
				 |       |    |       |
				 +-------+    +-------+

* select partition disk > then select manual > select harddisk partition
  select yes for new partition table.

* select configure the logic volume > select yes > create volume group > set logical volume name.
