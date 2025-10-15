clear all; clc
%% input data 
Pe_max = 434; %% in Kw
Te_max = 3050; %%in N-m
N = 2300; %% engine RPM @ max power
m_truck = 18000; %% in Kgs
axle_configuration = 4; %%no of axles 
rim_diameter = 22.5; %%in inches 
aspect_ratio_tire = 65; %% in mm
section_width = 385; %% width of tire
io = 2.89; %%final drive ratio
n = 0.9; %%transmission effciency 
 %%coefficient of rolliing resistance 
phi = 0.8; %% adhesion coefficient 
z = 12; %total gears in the gearbox
theta = 0.312;
l=3750;
lr = 1750;
lf =2000;
%% calculations 
% Calculate tire radius
rim_radius_inches = rim_diameter / 2; % radius in inches
rim_radius_m = rim_radius_inches * 0.0254; % convert to meters
sidewall_height = ((section_width)/1000)*(aspect_ratio_tire/100);
rd = rim_radius_m + sidewall_height;   % total tire radius in meters

% Axle weights 
% Calculate the weight per axle
Axle_weights = (m_truck*9.81) / axle_configuration; % in Kgs  

%  Engine torque calculation 
Te = (302*10^3*60)/2*pi*N ; 

%RPM to rad/sec

omega_e = N*(2*pi/60)

% Calculate the maximum tractive force% F_trac = Te / tire_radius_meters; % in N

%for 4x2
% zf = (m_truck*9.81*lr)/(l)
% zr = (m_truck*9.81*lf)/(l)
% Xt1 = zf*phi;
% Xt2 = zr*phi;
% Xtmax = Xt1+Xt2

% Based on adhesion for 6x6
% P_tmax = Xtmax*Vmax 
X1 = Axle_weights*phi;
Xtmax = X1*(axle_configuration)/2;

Vmax = 37 ;


Vmax_kmh = Vmax*(18/5)
f = 0.005+(10^-5)*(Vmax^2);
%gear ratio determination 

i = (omega_e*rd)/ Vmax  % highest gear in cruise 

% first gear ratio determination from torque force approach max gradient
Xtmax1 = f*m_truck*9.81*cos(theta)+ m_truck*9.81*sin(theta)
Ttmax = Xtmax1*rd; %Ttmax = max torque at wheels 
%Ttmax = Te_max*i1*i0*n
i1 = Ttmax/(Te_max*io*n)
q = (i1/i)^(1/(z-1))

%calculating individual gear ratios 
I(1)=i1;
for a = 2:z 
    % Calculate the gear ratio for each gear
    I(a) = I(a-1)/q;
    I(a)
end

%gradability calculation 
% syms x
% eqn = 16000 == m_truck*9.81*sin(x)+m_truck*9.81*f*cos(x);
% S=vpasolve(eqn,x); %vpasolve return float values
% S
% y=acosd(-S)
% "gradability =",y

