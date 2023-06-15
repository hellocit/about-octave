A = [0 1; -5 -6];
B = [0; 1];
Q = [1 0; 0 1];
x0 = [1; 0];

% Rの値の範囲とステップサイズの設定
R_values = -1000:10:1000;

for i = 1:length(R_values)
    R = R_values(i); % Rの値を設定

    [K, P, ~] = lqr(A, B, Q, R); % 最適レギュレータのゲイン行列Kを計算

    t = 0:0.1:10; % 時間範囲
    sys = ss(A-B*K, B, eye(2), zeros(2,1)); % システムモデルを作成
    [~, ~, x] = initial(sys, x0, t); % 初期値からの時間応答を計算

    % グラフのプロット
    figure;
    subplot(2, 1, 1);
    plot(t, x(:, 1), 'b', 'LineWidth', 1.5);
    ylabel('x1');
    title(['Time Response (R = ' num2str(R_values(i)) ')']);
    grid on;

    subplot(2, 1, 2);
    plot(t, x(:, 2), 'r', 'LineWidth', 1.5);
    ylabel('x2');
    xlabel('Time');
    grid on;
end
