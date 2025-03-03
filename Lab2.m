% 2/21/25
% ENGR006
% Lab 2 Matlab Code
% Steps:
% Inputting Variables (X,Y,Z) and Weight

% clean workspace, figures and command window
clear all
close all
clc

% Variables (meters) 
pulley2 = [-2.47015 1.62052 2.962];
pulley4 = [2.39776 1.62052 2.965];
knotWeight = 1.372 * 9.8; % Newtons

% We display these coordinates from our experiment for simplicity's sake
% Feel free to use your own dataset! :D
disp("Copy and paste a line [x,y,z] and put into prompted location")
disp("Trial 1 Knot Coord [-0.64008,1.62052,1.25476]")
disp("Trial 2 Knot Coord [-0.58928,1.61544,1.07696]")
disp("Trial 3 Knot Coord [-0.38354,1.61544,0.92456]")

% input
prompt = "Give a point for the knot: ";
prompt2 = "Give the counterweights: ";
knot = input(prompt);
disp(" ")
disp("Trial 1 counterweights in Newtons [10.784133 8.488593]")
disp("Trial 2 counterweights in Newtons [10.502586 8.488593]")
disp("Trial 3 counterweights in Newtons [9.568674 8.488593]")
WeightArry = input(prompt2);
disp(" ")

% pulley coordinates with knot as origin
pulley2 = pulley2 - knot;
pulley4 = pulley4 - knot;

% Distance from knot to the pulley on the x and z axis
a1 = sqrt(((pulley2(1)^2) + (pulley2(3)^2)));
a2 = sqrt(((pulley4(1)^2) + (pulley4(3)^2)));

%Preparing to find moment for each pulley (only 1 is needed)
P2x = (pulley2(1)) / a1;
P2z = (pulley2(3)) / a1;
P4x = (pulley2(1)) / a2;
P4z = (pulley2(3)) / a2;


Lambda2 = pulley2 ./ norm(pulley2);
Lambda4 = pulley4 ./ norm(pulley4);

%Matrix = [Lambda2(1), -1*Lambda4(1), 0; Lambda2(2), -1*Lambda4(2), 0; Lambda2(3), Lambda4(3), -1*knotWeight];
%Sum = [0; 0; 0];
Matrix = [Lambda2(1), Lambda4(1); Lambda2(3), Lambda4(3)];
Sum =[0; knotWeight];


Result = Matrix\Sum;