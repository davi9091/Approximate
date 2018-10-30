//
//  main.swift
//  Approximate
//
//  Created by Arkady Rubtsov on 31/10/2018.
//  Copyright © 2018 davi9091. All rights reserved.
//

import Foundation

func laGrangePolynomial(n: Int, x: Float, xi: Array <Float>, yi: Array <Float>) -> Float {
    var ti: Float = 0;
    var tj: Float = 1;

    var i, j: Int;

    for i in 0...n {
        for j in 0...n {
            if (i != j) {
                tj = tj*((x - xi[j])/(xi[i] - xi[j]));

            }
        }

        ti = ti + tj * yi[i];
        tj = 1;

    }

    return ti;
}

var xStart, xEnd, x: Float;
var n: Int;

xStart = (readLine() as! NSString).floatValue;
xEnd = (readLine() as! NSString).floatValue;
x = (readLine() as! NSString).floatValue;
