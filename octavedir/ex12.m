A = [0 1; -5 -6];
B = [0; 1];
Q = [1 0; 0 1];
R = 1;
x0 = [1; 0];

[K, P, ~] = lqr(A, B, Q, R); % 最適レギュレータのゲイン行列Kを計算

feedback_vector = K';
disp("フィードバック係数ベクトル:");
disp(feedback_vector);
