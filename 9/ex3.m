clear();
pkg load control

A = [0 1; -5 -6];
B = [0; 1];
C = [0 1];% 状態方程式を定義

Mo = [C; C*A];
obs = det(Mo)#可観測性を判定

Aa = A'
Ba = C'
Ca = B'
D = 0%状態観測器の設計をするために行列を転置

sys = ss(Aa, Ba, Ca, D)%状態空間モデルを生成
P = [-3, -4]
L = place(sys, P)'%極配置を行っている

u = 1;
x = [1; 1];
xh = [0;0];
yh = 0;
dt = 0.1;
t = 0:dt:10;
x = [0;0];
i = 0;

for n = t
	i = i + 1;
	u = mod(n,2) >= 1;

	dx = A * x + B * u;
	x = x + dx * dt;
	y = C * x;
	x1(i) = x(1);
	x2(i) = x(2);

	dxh = A * xh + B * u - L * (yh - y);
	xh = xh + dxh * dt;
	yh = C * xh;
	xh1(i) = xh(1);
	xh2(i) = xh(2);
endfor

plot(t, x1, t, x2, t, xh1, 'o', t, xh2, 'o');
