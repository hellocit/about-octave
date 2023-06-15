A = [0 1; -5 -6];
C = [1 0];

ObservabilityMatrix = [C; C*A];
ObservabilityRank = rank(ObservabilityMatrix);

if ObservabilityRank == size(A, 1)
    disp("The system is observable.");
else
    disp("The system is not observable.");
end

