A = [0 1; -5 -6];
B = [0; 1]; % ベクトルBを2x1の列ベクトルに変形
Mc = [B, A*B]; % 行列Mcを構築
det_Mc = det(Mc);
disp(det_Mc);

