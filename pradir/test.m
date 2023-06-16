A = [-1 -2;1 0];
B = [2;0];
C = [0 1];
D = 0;
sys = ss(A,B,C,D);

Pol = pole(sys);

