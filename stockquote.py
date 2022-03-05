#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar  5 17:43:40 2022

@author: nhinguyen
"""

import json
import requests
import sys 


url = "https://yfapi.net/v6/finance/quote"


stock = input("Please input a stock ticker: ")
stockclean = stock.lower().strip()


querystring = {"symbols": stockclean}

headers = {
    'x-api-key': "pvWdWhmrMOaDNl93V1y6y3KsbcjPALuW3QMrOsCV"
    }

response = requests.request("GET", url, headers=headers, params=querystring)

stock_json = response.json()

companyName = stock_json['quoteResponse']['result'][0]['displayName']

currentPrice = stock_json['quoteResponse']['result'][0]['regularMarketPrice']

print(str(companyName),":",str(currentPrice))
