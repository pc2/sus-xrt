Bursting Memory Reader - fp32_add - Bursting Memory Writer

`memory_doubler256_2` and `memory_doubler512_2` are connected to HBM. The others to DDR

Raw Log:
```
Large Buffer Benchmark
Kernel memory_doubler32:{memory_doubler32_1}
Write initial data for buffer 20000000 elements.
Start Write 10000000 from 0
Finished Kernel
    Time taken: 0.027949s, BW: 1.43118GB/s = 3.95681 bytes per cycle @361.7MHz
Checked 20000000 elements.
Kernel memory_doubler32:{memory_doubler32_1}
Write initial data for buffer 20000000 elements.
Start Write 20000000 from 0
Finished Kernel
    Time taken: 0.05569s, BW: 1.43652GB/s = 3.97159 bytes per cycle @361.7MHz
Checked 20000000 elements.
Large Buffer Benchmark
Kernel memory_doubler64:{memory_doubler64_1}
Write initial data for buffer 20000000 elements.
Start Write 10000000 from 0
Finished Kernel
    Time taken: 0.0140023s, BW: 2.85668GB/s = 7.89793 bytes per cycle @361.7MHz
Checked 20000000 elements.
Kernel memory_doubler64:{memory_doubler64_1}
Write initial data for buffer 20000000 elements.
Start Write 20000000 from 0
Finished Kernel
    Time taken: 0.0279002s, BW: 2.86736GB/s = 7.92746 bytes per cycle @361.7MHz
Checked 20000000 elements.
Large Buffer Benchmark
Kernel memory_doubler128:{memory_doubler128_1}
Write initial data for buffer 20000000 elements.
Start Write 10000000 from 0
Finished Kernel
    Time taken: 0.00706039s, BW: 5.66541GB/s = 15.6633 bytes per cycle @361.7MHz
Checked 20000000 elements.
Kernel memory_doubler128:{memory_doubler128_1}
Write initial data for buffer 20000000 elements.
Start Write 20000000 from 0
Finished Kernel
    Time taken: 0.0140098s, BW: 5.71027GB/s = 15.7873 bytes per cycle @361.7MHz
Checked 20000000 elements.
Large Buffer Benchmark
Kernel memory_doubler256:{memory_doubler256_1}
Write initial data for buffer 20000000 elements.
Start Write 10000000 from 0
Finished Kernel
    Time taken: 0.00462763s, BW: 8.64374GB/s = 23.8975 bytes per cycle @361.7MHz
Checked 20000000 elements.
Kernel memory_doubler256:{memory_doubler256_1}
Write initial data for buffer 20000000 elements.
Start Write 20000000 from 0
Finished Kernel
    Time taken: 0.00909977s, BW: 8.79143GB/s = 24.3059 bytes per cycle @361.7MHz
Checked 20000000 elements.
Large Buffer Benchmark
Kernel memory_doubler512:{memory_doubler512_1}
Write initial data for buffer 20000000 elements.
Start Write 10000000 from 0
Finished Kernel
    Time taken: 0.00459242s, BW: 8.71001GB/s = 24.0807 bytes per cycle @361.7MHz
Checked 20000000 elements.
Kernel memory_doubler512:{memory_doubler512_1}
Write initial data for buffer 20000000 elements.
Start Write 20000000 from 0
Finished Kernel
    Time taken: 0.00908017s, BW: 8.81041GB/s = 24.3583 bytes per cycle @361.7MHz
Checked 20000000 elements.
Large Buffer Benchmark
Kernel memory_doubler256:{memory_doubler256_2}
Write initial data for buffer 20000000 elements.
Start Write 10000000 from 0
Finished Kernel
    Time taken: 0.00625869s, BW: 6.39111GB/s = 17.6697 bytes per cycle @361.7MHz
Checked 20000000 elements.
Kernel memory_doubler256:{memory_doubler256_2}
Write initial data for buffer 20000000 elements.
Start Write 20000000 from 0
Finished Kernel
    Time taken: 0.0124156s, BW: 6.44348GB/s = 17.8144 bytes per cycle @361.7MHz
Checked 20000000 elements.
Large Buffer Benchmark
Kernel memory_doubler512:{memory_doubler512_2}
Write initial data for buffer 20000000 elements.
Start Write 10000000 from 0
Finished Kernel
    Time taken: 0.00625051s, BW: 6.39948GB/s = 17.6928 bytes per cycle @361.7MHz
Checked 20000000 elements.
Kernel memory_doubler512:{memory_doubler512_2}
Write initial data for buffer 20000000 elements.
Start Write 20000000 from 0
Finished Kernel
    Time taken: 0.0124159s, BW: 6.44333GB/s = 17.814 bytes per cycle @361.7MHz
Checked 20000000 elements.
```
