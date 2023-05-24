A = [0 1; -5 -6];
B = [0; 1];
Q = [1 0; 0 1];
x0 = [1; 0];

R_values = -100000:1000:100000;
R_values = [R_values 11000 21000 31000 41000 51000 61000 71000 81000 91000]; % 追加のRの値

for i = 1:length(R_values)
    R = R_values(i);

    [K, P, ~] = lqr(A, B, Q, abs(R));

    t = 0:0.1:10;
    sys = ss(A-B*K, B, eye(2), zeros(2,1));
    [~, ~, x] = initial(sys, x0, t);

    if mod(i, 10) == 0 || ismember(R, [11000 21000 31000 41000 51000 61000 71000 81000 91000]) % 10の倍数または指定したRの値の場合にグラフを表示
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
end
