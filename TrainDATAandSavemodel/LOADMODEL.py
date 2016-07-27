# USAGE
# python LOADMODEL.py --model model/svm

# import the necessary packages
from flask import Flask, request ,jsonify
from sklearn.externals import joblib
from sklearn.svm import LinearSVC
from sklearn.cross_validation import train_test_split
from sklearn.metrics import classification_report
from numpy import genfromtxt, savetxt
import numpy as np
import argparse
import glob
import csv


# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-m", "--model", required = True,
	help = "path to where the model will be stored")
args = vars(ap.parse_args())


# load the model
model = joblib.load(args["model"])
# TRY WITH AN EXAMPLE
testData2 = [([ 0.,  0.,  1.,  0.,  0.,  1.,  4.,  0.,  1.,  0.,  0.,  0.,  1.,  1.])]
print(model.predict(testData2))