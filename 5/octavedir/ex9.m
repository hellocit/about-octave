A = [-5 -2; 4 1];
B = [1; -1];
C = [0 1];

ObservabilityMatrix = [C; C*A; C*A^2];
ControllabilityMatrix = [B A*B A^2*B];

ObservabilityRank = rank(ObservabilityMatrix);
ControllabilityRank = rank(ControllabilityMatrix);

if ObservabilityRank == size(A, 1)
    disp("The system is observable.");
else
    disp("The system is not observable.");
end

if ControllabilityRank == size(A, 1)
    disp("The system is controllable.");
else
    disp("The system is not controllable.");
end

