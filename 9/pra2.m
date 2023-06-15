clear();
pkg load control

A = [0 1; -5 -6];
B = [0; 1];
C = [0 1];

Mo = [C; C*A];

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
