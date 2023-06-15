A = [0 1; -5 -6];
B = [0; 1];
x0 = [1; 1];
t = 0:dt:10;
x = [0;0];
dt = 0.01;
i = 0;
for n = t
	i = i + 1;
	u = mod(n,2) >= 1;
	dx = A * x + B * u;
	x = x + dx * dt;
	x1(i) = x(1);
	x2(i) = x(2);
endfor

plot(t, x1, t, x2)
