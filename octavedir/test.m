% Define the system matrices
A = [0 1; -5 -6];
B = [0; 1];

% Define the weighting matrices
Q = [1 0; 0 1000];
R = 100; % Updated: Use scientific notation for readability

% Calculate the LQR gain matrix
[K, S, E] = lqr(A, B, Q, R);

% Define the initial state
x0 = [1; 0];

% Simulate the closed-loop system
t = 0:0.01:5;  % Time vector
u = -K * x0;   % Control input

% Simulate the system using the state-space representation
sys = ss(A - B * K, B, eye(2), 0);
[y, ~, x] = lsim(sys, zeros(size(t)), t, x0);

% Plot the state response

plot(t, x)
xlabel('Time')
ylabel('State')
legend('x1', 'x2')



Q_str = num2str(Q);
disp(Q_str);