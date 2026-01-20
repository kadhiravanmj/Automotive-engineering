clear all 
clc 
A = 2.3750 ; 
Cd = 0.24 ; 
Cr = 0.01 ; 
g = 9.81 ; 
gear_r = 9.6; 
m = 2000;
rho = 1.225;
Rw = 0.35; 
Ts = 0.1;
theta = 0; 
grad = cos(theta);
V = 10; 
Ns = 100; 
Np= 100; 
Voc = 3;
Ro = 0.03; 
soc_i = 100;
Ct = 3; %ah
P_max = 70;
T_max = 400;
K_nominal = 1 ;
load cycles_nedc.mat