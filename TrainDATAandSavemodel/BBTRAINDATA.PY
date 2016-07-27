# USAGE
# python BBTRAINDATA.py

# import the necessary packages
from __future__ import print_function
from sklearn.externals import joblib
from sklearn.svm import LinearSVC
from sklearn.cross_validation import train_test_split
from sklearn.metrics import classification_report
from numpy import genfromtxt, savetxt
import numpy as np
import argparse
import glob
import csv


#READ FILE
dataset = np.genfromtxt('BBCLEAN 2.csv', delimiter=',', dtype='f8')[1:]
print(dataset)
data = [x[1:] for x in dataset]
output = [x[0] for x in dataset]
print(output)
z = np.ravel(output)
#TRAIN DATA
(trainData, testData, trainTarget, testTarget) = train_test_split(data,z,test_size = 0.3)
model = LinearSVC(random_state = 42)
model.fit(trainData, trainTarget)
# SAVE MODEL
joblib.dump(model,"model/svm")


