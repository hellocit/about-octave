clear();
pkg load control

m = 0.2;
l = 0.3;
M = 0.3;
g = 9.8;
J = 1/12*m*l^2;

a = (M+m)*(m*l^2+J)-m^2*l^2;
A = [0, 0, 1, 0; 0, 0, 0, 1; 0, -m^2*l^2*g/a, 0 ,0; 0, (m+M)*m*l*g/a, 0, 0];
B = [0, 0, (m*l^2+J)/a, -m*l/a];
C = [1, 0, 0, 1];

Mo = [C; C*A];

Aa =
Ba = 
Ca =
D = 

sys = ss(Aa, Ba, Ca, D);
P = ;
L = place(sys, P);

u = 1;
x = [1; 1];
xh = [0;0];
yh = 0;
t = 0:dt:10;
x = [0;0];
dt = 0.1;
i = 0;

for n = t
	i = i + 1;
	dx = 
	x = 
	y =
	x1(i) = x(1);
	x2(i) = x(2);

	dxh =
	xh = 
	yh = 
	xh1(i) = xh(1);
	xh2(i) = xh(2);
endfor

plot(t, x1, t, x2, t, xh1, 'o', t, xh2, 'o');
