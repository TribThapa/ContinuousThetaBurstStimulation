clc; clear all; close all;

%%%%%%%%%%% COMPUTE F THRESHOLD %%%%%%%%%%%%%%%
%p is your desired p values (e.g,. .05)

%df1 = degrees of freedom 1 = [no. groups -1]

%df2 = degrees of freedom 2 = [no. subjects no. groups]
%DOF is your sample size - 1. As you have two samples, you will have DOF i.e., one for the numerator (higher value), and one for the denominator (lower value).
%See here (https://www.statisticshowto.com/probability-and-statistics/hypothesis-testing/f-test/) for more on F-test.
%Calc F-test: https://www.danielsoper.com/statcalc/calculator.aspx?id=7
%Calc T-test: https://www.danielsoper.com/statcalc/calculator.aspx?id=8

%F_threshold = finv((1-p), df1, df2);
F_threshold = finv(0.05, 17, 17);

%%%%%%%%%%% COMPUTE T THRESHOLD %%%%%%%%%%%%%%%

%Snv((1-p), df); %df = no. subjects - 1
T_threshold = Sinv(0.95, 17);
