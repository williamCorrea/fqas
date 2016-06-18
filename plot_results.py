# -*- coding: utf-8 -*-
"""
Created on Mon Aug 10 15:51:28 2015

@author: correabe
"""

import matplotlib.pyplot as plt
import numpy as np
from matplotlib import rcParams

N=5
ind = np.arange(N)
width = 0.35

print (ind)

plt.axis([0,4,0,400])
plt.xticks(ind+width/2., ('0.9','0.8','0.7','0.5','0.2'))

naive = (16.4,18.5,24.1,29.2,51.2)
cib = (13.2,14.6,22,33.5,45)
clt = (211,241,260,269,284)


y=(0,1,2,3,4)
workshops=(126,145,143,144,150,155,157,161,182,185,211,194,209,208,224)

line_work,=plt.plot(y,naive,label='naive',color="red")

dashes_w=(10,1)

#line_work.set_dashes(dashes_w)

artists=(337,330,330,332,337,344,366,388,393,407,420,460,471,470,470)

participants =[707,848,837,755,848,985,1109,1262,1495,1612,1593,1698,1913,2115,2200]

#plt.plot(y,participants)

parti = [207,348,337,255,348,485,609,762,995,1112,1093,1198,1413,1615,1700]

l1,=plt.plot(y,cib,label='Index-based Strategy',color="green")

#l1.set_label(participants,'participants')


a = 'K\xfcnstler'
d = a.encode('latin_1')
print d
x = u"Künstler"

l2,=plt.plot(y,clt,label='Cluster based Strategy',color="blue",linestyle='-')

"""
plt.text(0,660,707,color="green")
plt.text(1,868,848,color="green")
plt.text(2,847,837,color="green")
plt.text(3,705,755,color="green")
plt.text(4,808,848,color="green")
plt.text(5,935,985,color="green")
plt.text(6,1059,1109,color="green")
plt.text(7,1215,1262,color="green")
plt.text(8,1545,1495,color="green")
plt.text(9,1622,1612,color="green")
plt.text(10,1543,1593,color="green")
plt.text(11,1648,1698,color="green")
plt.text(12,2023,1913,color="green")
plt.text(13,2155,2115,color="green")
plt.text(14,2210,2200,color="green")


plt.text(0,136,31,color="blue")
plt.text(1,152,45,color="blue")
plt.text(2,153,40,color="blue")
plt.text(3,154,41,color="blue")
plt.text(4,160,47,color="blue")
plt.text(5,165,52,color="blue")
plt.text(6,167,61,color="blue")
plt.text(7,171,65,color="blue")
plt.text(8,195,79,color="blue")
plt.text(9.1,195,90,color="blue")
plt.text(10,222,110,color="blue")
plt.text(11,204,98,color="blue")
plt.text(12,219,107,color="blue")
plt.text(13,218,112,color="blue")
plt.text(14,234,124,color="blue")

plt.text(0,347,33,color="red")
plt.text(1,340,37,color="red")
plt.text(2,340,36,color="red")
plt.text(3,342,37,color="red")
plt.text(4,347,41,color="red")
plt.text(5,354,47,color="red")
plt.text(6,380,63,color="red")
plt.text(7,398,85,color="red")
plt.text(8,403,90,color="red")
plt.text(9,420,103,color="red")
plt.text(10,438,122,color="red")
plt.text(11,473,157,color="red")
plt.text(12,481,170,color="red")
plt.text(13,480,168,color="red")
plt.text(14,480,170,color="red")

"""


plt.grid(True)

x=np.arange(100)

#plt.legend(workshops,'workshop')

plt.legend(loc=1)
#plt.ylabel('some numbers')
plt.show()