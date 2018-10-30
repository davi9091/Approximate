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

    for i in 0...n-1 {
        for j in 0...n-1 {
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
n = (readLine() as! NSString).integerValue;

var yi: [Float] = [];
var xi: [Float] = [];
var notation: Float = (xEnd - xStart) / (Float(n) - 1);

xi.append(xStart);
yi.append(sin(xStart));

for i in 1...n-1 {
    xi.append(xi[i - 1] + notation);
    yi.append(sin(xi[i]));
}

var yl: Float;

yl = laGrangePolynomial(n: n, x: x, xi: xi, yi: yi);

print("Lagrange: ", yl);
print("Actual: ", sin(x));