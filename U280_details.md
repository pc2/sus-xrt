## Lessons Learned - U280
- **On the U280, grouping multiple HBM banks together (a la `sp=burst_reader512_hbm_2x.m_axi:HBM[16:17]`) does not actually improve bandwidth, yet does introduce lots of cruft around the HBM interfaces**

## AxCACHE has no effect
![img/arcache_reader.png](img/arcache_reader.png)
![img/awcache_writer.png](img/awcache_writer.png)
