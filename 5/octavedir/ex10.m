A = [0 1; -5 -6];
B = [0; 1];
C = [0 1];

[T, V] = eig(A); % Aの固有値と固有ベクトルを計算

Ab = inv(T) * A * T; % 行列Aを変換
Bb = inv(T) * B; % ベクトルBを変換
Cb = C * T; % 行列Cを変換

disp("Transformed Ab:");
disp(Ab);
disp("Transformed Bb:");
disp(Bb);
disp("Transformed Cb:");
disp(Cb);

