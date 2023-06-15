% System matrices
A = [0 1; -5 -6];
B = [0; 1];

% Weighting matrices
Q = [1 0; 0 1];
R = 1;

% Initial state
x0 = [1; 0];

% Compute the LQR gain matrix K
[K, ~, ~] = lqr(A, B, Q, R);

% Simulation time
t = 0:0.01:5; % Adjust the time range as needed

% Preallocate state and input arrays
numStates = size(A, 1);
x = zeros(numStates, length(t));
u = zeros(size(B, 2), length(t));

% Set the initial state
x(:, 1) = x0;

% Simulate the system
for i = 1:length(t)-1
    u(:, i) = -K * x(:, i);
    x(:, i+1) = A * x(:, i) + B * u(:, i);
end

% Plot the state variables
figure;
subplot(2,1,1);
plot(t, x(1, :), 'b', 'LineWidth', 1.5);
xlabel('Time');
ylabel('x_1');
title('State Variable x_1');
grid on;

subplot(2,1,2);
plot(t, x(2, :), 'r', 'LineWidth', 1.5);
xlabel('Time');
ylabel('x_2');
title('State Variable x_2');
grid on;

% Plot the input
figure;
plot(t, u, 'm', 'LineWidth', 1.5);
xlabel('Time');
ylabel('u');
title('Control Input');
grid on;
