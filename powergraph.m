clear all;clc
m = 18000; %kg
zf = 94176;
zr = 83404;
frontal_A = 12.81;
drag_C = 0.6;
air_d = 1.2;
n = 0.9;
Pe_max = 434

V = 0:1:100; % Define the range of speeds
    totalpower = zeros(size(V)); % Initialize totalResistance array
    Rrpower = zeros(size(V)); % Initialize rollingResistance array
    Adpower = zeros(size(V));
    for i = 1:length(V)
        % Equations 
        % Rr = f * (m * g)
        % Calculate the weight in Newtons from mass in kg
        coefficient = 0.01 + (1*10^-5)*V(i).^2; %V^2
        weight = m * 9.81; % Convert weight from kg to Newtons
        % Calculate the rolling resistance based on the coefficient and weight
        Rrpower(i) = coefficient * weight*V(i);
        % Calculate the aerodynamic drag using the drag coefficient, frontal area, air density, and velocity
        Adpower(i) = (drag_C * frontal_A * air_d * V(i).^3) / 2;
        % Sum the rolling resistance and aerodynamic drag to get total resistance
        totalpower(i) = Rrpower(i) + Adpower(i);
        Pt(i) =Pe_max*10^3*n;
        % Xtf(i) = phi*zf;
        % Xtr(i) = phi*zr; 
    end
    plot(V,Rrpower,'-')
    hold on 
    plot(V,Adpower,'-')
    hold on 
    plot(V,totalpower,'-')
    hold on 
    plot(V,Pt)

 title('Total resistance power');
    ylabel('power (W)');
    xlabel('Speed (m/s)');
    legend('Rolling resistance power', 'Aerodynamic Drag power', 'Total power');