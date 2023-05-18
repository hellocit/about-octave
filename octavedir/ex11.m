A = [0 1; -5 -6];
B = [0; 1];
Q = [1 0; 0 1];
R = 1;
x0 = [1; 0];

[K, P, ~] = lqr(A, B, Q, R); % 最適レギュレータのゲイン行列Kを計算

t = 0:0.1:10; % 時間範囲
sys = ss(A-B*K, B, eye(2), zeros(2,1)); % システムモデルを作成
[y, ~, x] = initial(sys, x0, t); % 初期値からの時間応答を計算

% グラフのプロット
figure;
subplot(2, 1, 1);
plot(t, x(:, 1), 'b', 'LineWidth', 1.5);
ylabel('x1');
title('Time Response');
grid on;

subplot(2, 1, 2);
plot(t, x(:, 2), 'r', 'LineWidth', 1.5);
ylabel('x2');
xlabel('Time');
grid on;

