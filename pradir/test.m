A = [-1 -2;1 0];
B = [2;0];
C = [0 1];
D = 0;
sys = ss(A,B,C,D);

Pol = pole(sys);

figure(1)
step(sys)
hold on;

p = [-1,-2];

K = place(A,B,p);
Acl = A-B*K;
syscl = ss(Acl,B,C,D);
Pcl = pole(syscl)

figure(1)
step(syscl)

p = [-2, -3];
K2 = place(A,B,p);
syscl2 = ss(A-B*K2,B,C,D);
figure(1);
step(syscl2);