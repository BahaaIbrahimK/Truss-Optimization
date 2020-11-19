function [c, ceq] = TrussConstraints(x)
P = 2000; 
l = 1;
E = 2e+11;
delta_max = 2e-03; 
S_all= 5e+08; 
theta= 45;
alpha= 33.69;
A1= x(1);
A2=x(2);
A3=x(3);
A4=x(4);
sigma = [
    (P)/(2*A1*sind(theta)) - S_all;...
    (P)/(2*A2*tand(theta)) - S_all;...
    (P)/(2*A3*sind(alpha)) - S_all;...
    (((P)*(cotd(theta)+cot(alpha)))/(2*A4)) - S_all;...
    (P)/(2*A1*sind(theta)) - S_all;];

buckling = [(P)/(2*sind(theta))- ((pi*E*A1^2))/1.281;...
    (P)*(cotd(theta)+cot(alpha))/2- ((pi*E*A4^2))/5.76
    ];

delta = (P*((0.566/A1)+(0.5/A2)+(2.236/A3)+(2.7/A4))/E) - delta_max;

c = [sigma; buckling ;delta];
ceq = [];