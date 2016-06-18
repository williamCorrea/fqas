# -*- coding: utf-8 -*-
"""
Created on Sat Oct 24 16:42:30 2015

@author: correabe
"""

import numpy as np
import pylab as P

#
# The hist() function now has a lot more options
#

#
# first create a single histogram
#
mu, sigma = 200, 25
x = mu + sigma*P.randn(10000)

# the histogram of the data with histtype='step'
n, bins, patches = P.hist(x, 50, normed=1, histtype='stepfilled')
P.setp(patches, 'facecolor', 'g', 'alpha', 0.75)

# add a line showing the expected distribution
y = P.normpdf( bins, mu, sigma)
l = P.plot(bins, y, 'k--', linewidth=1.5)

P.figure()

n,bins,patches=P.hist(x,60,normed=1,histtype='step',cumulative=True)
