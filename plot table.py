# -*- coding: utf-8 -*-
"""
Created on Thu May 07 16:37:40 2015

@author: correabe
"""
import matplotlib.pyplot as plt
import pylab as pl
import psycopg2
import numpy as np
from sklearn.decomposition import PCA

con = None
try:
    con = psycopg2.connect(database='clustering', user='william', password="william8510")
    cur = con.cursor()
    #cur.execute('SELECT "%voix/exp2","%voix/exp3", "%voix/exp4","%voix/exp8","%voix/exp9","%voix/exp10" from departmentst1_2012_lessvotes')
    #cur.execute('SELECT "%voix/exp2","%voix/exp3", "%voix/exp4","%voix/exp8","%voix/exp9","%voix/exp10" from departmentst1_2012_less_vector')
    #cur.execute('SELECT "%voix/exp2","%voix/exp3" from departmentst1_2012_less_vector')

    cur.execute('SELECT a1,a2 from syntec_vectors')
    #cur.execute('SELECT x,y from syntec_points')    
    ver = cur.fetchall()
    a = np.asarray(ver)
except psycopg2.DatabaseError, e:
    print 'Error %s' % e    
    sys.exit(1)
finally:
        
    if con:
        con.close()

z,w = a.shape
print z,w
pca = PCA(n_components=2)

if w>2:
    pca = PCA(n_components=2)
    a = pca.fit(a).transform(a)
    pl.scatter(a[:,0],a[:,1])
else:
#print a[:,0]       
    pl.scatter(a[:,0],a[:,1])


