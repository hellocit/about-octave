A = [0 1 ; -5 -6 ];
t = 0: 0.1: 4
i = 0
for n = t
i = i + 1;
x(i) = (expm(A*n))(1)
endfor
x
