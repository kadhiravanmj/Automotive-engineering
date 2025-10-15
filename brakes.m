clear all ;clc
vmax = 55:-1:0;
phi=0.8
m = 18000;
lr = 1.75;
l=3.5;
lf = 2;
for i = 1:length(vmax)
    amax(i)=((phi+0.005+(10^-5)*(vmax(i))^2))*9.81;
    xbf(i) = (phi+0.005+(10^-5)*(vmax(i))^2)*m*(9.81*lr+1.3*amax(i))/l;
    xbr(i) = (phi+0.005+(10^-5)*(vmax(i))^2)*m*(9.81*lf-1.3*amax(i))/l;
end
for q = 1:length(vmax)
    amax1(q)=(phi)*9.81;
    xbf1(q) = (phi)*m*(9.81*lr+1.3*amax1(q))/l;
    xbr1(q) = (phi)*m*(9.81*lf-1.3*amax1(q))/l;
end
plot(vmax,amax)
hold on 
plot(vmax,amax1)
xlabel('velocity (m/s)')
ylabel('deceleration (m/s^2)')