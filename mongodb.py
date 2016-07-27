from __future__ import print_function

from flask import Flask

from flask.ext.pymongo import PyMongo

import json

from bson import json_util





app = Flask(__name__)



app.config['MONGO_DBNAME'] = 'beautybeatdata'

app.config['MONGO_URI'] =  'mongodb://admin:admin@ds017185.mlab.com:17185/beautybeatdata'



mongo = PyMongo(app)



@app.route('/add')

def maxExampleAdd():
    
    product = mongo.db.products
    
    product.insert({'No':'1','productName': 'Anthony Green  Cream Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/1.png'})
    product.insert({'No':'2','productName': 'Anthony Green Hi-Def Liquid Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/2.png'})
    product.insert({'No':'3','productName': 'Anthony Green Dual Powder Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/3.png'})
    product.insert({'No':'4','productName': 'Black UP Cosmetics Matifying Fluid Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/4.png'})
    product.insert({'No':'5','productName': 'Black UP Cosmetics Two Way Cake','imageURL': 'http://imagebbdev4.s3.amazonaws.com/5.png'})
    product.insert({'No':'6','productName': 'Black Up Cosmetics Cream to Powder Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/6.png'})
    product.insert({'No':'7','productName': 'Black Up Cosmetics Full Coverage Cream','imageURL': 'http://imagebbdev4.s3.amazonaws.com/7.png'})
    product.insert({'No':'8','productName': 'Sacha Cosmetics Second Skin Liquid Foundation ','imageURL': 'http://imagebbdev4.s3.amazonaws.com/8.png'})
    product.insert({'No':'9','productName': 'Sacha Cosmetics Cream to Powder Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/9.png'})
    product.insert({'No':'10','productName': 'Sacha Cosmetics Cream Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/10.png'})
    product.insert({'No':'11','productName': 'Jay-Jill Cream Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/11.png'})
    product.insert({'No':'12','productName': 'Jay-Jill Dual Powder Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/12.png'})
    product.insert({'No':'13','productName': 'Jay-Jill Flawless Finish Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/13.png'})
    product.insert({'No':'14','productName': 'Jay-Jill Mousse Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/14.png'})
    product.insert({'No':'15','productName': 'Pink Stiletto Cosmetics LiquiDream Organic Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/15.jpeg'})
    product.insert({'No':'16','productName': 'Komplexx Blends Cosmetics Perfect Finsih Liquid Foundation','imageURL': 'http://imagebbdev4.s3.amazonaws.com/16.jpg'})
    

    
                   
    return 'Add user!'

@app.route('/get')

def getProductInfo():
    
    products = mongo.db.products
    
    myProduct = products.find({"No": "1"})
    
    docs_list  = list(myProduct)
    
    return json.dumps(docs_list,default=json_util.default)



if __name__ == "__main__":
    app.run(debug=True)