% Boost Converter TF
clc 

L = 2.7648e-3;
C = 1.666667e-6;
R = 144;
E = 48;
D = 0.6;

Dp = 1-D;
V = E/Dp; % Voltage output desired

Gd3 = 2*V;
Gd2 = (Dp^2)*R;

Gd1 = Gd3/Gd2;
Gd0 = V/Dp;

wy = 2/(R*C);
wz = -((Dp^2)*R)/L;
wo = Dp/(sqrt(L*C));
Q = Dp*R*sqrt(C/L);

zeta = 1/(2*Q);

Td = (2*pi)/(wo*sqrt(1-zeta^2));
delta = exp(-(pi*zeta)/(sqrt(1-zeta^2)));

numI = [Gd1*((wo^2)/wy) Gd1*(wo^2)];
numV = [((wo^2)/wz) (wo^2)];
den = [1 wo/Q wo^2];

Gid = tf(numI,den); % minimum fase
Gvd = tf(numV,den); % non-minimum fase

step(Gvd)
