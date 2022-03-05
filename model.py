#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 24 13:30:28 2022

@author: skhalilbekov
"""

from sklearn.datasets import load_iris
from sklearn.linear_model import LogisticRegression

from utils.utils import save_pickle

if __name__ == '__main__':
    
    X, y = load_iris(return_X_y = True)
    clf = LogisticRegression(random_state = 43).fit(X, y)
    save_pickle(clf, '../models/logit.sav')
    
    

