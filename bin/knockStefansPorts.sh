H=xf00.eu
P1=734
P2=349
P3=952
P4=482
curl -4 --connect-timeout 0.1 http://$H:$P1
curl -4 --connect-timeout 0.1 http://$H:$P2
curl -4 --connect-timeout 0.1 http://$H:$P3
curl -4 --connect-timeout 0.1 http://$H:$P4
curl -6 --connect-timeout 0.1 http://$H:$P1
curl -6 --connect-timeout 0.1 http://$H:$P2
curl -6 --connect-timeout 0.1 http://$H:$P3
curl -6 --connect-timeout 0.1 http://$H:$P4
