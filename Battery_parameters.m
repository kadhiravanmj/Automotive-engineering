% Battery model parameters
clear all 
clc
OCV = 8; 
Ro = 0.07; 
v1 = 0.5; %voltage drop across the RC circuit
I = 2; %input demand from battery
Ts = 0.1;
R1 = 0.09;
C1 = 2000; 
SOC_init = 100 ; % SOC initial percentage
Ct = 4800 ; %mAh