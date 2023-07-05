% EKF_localization   Extended Kalman Filter for localization

function [mu_t, Sigma_t, pzt]=ekf_localization(mu_t1, Sigma_t1, ut, zt, ct, m)

dt = 0.01;                              % サンプリングタイム
alpha = [0.001, 0.001, 0.001, 0.001];       % 分散の係数
sigma_r = 0.1;                          % ランドマークの距離の計測ノイズ
sigma_phai = 0.5;                       % ランドマークの方位の計測ノイズ
sigma_s = 0.1;                          % ランドマークの対応の計測ノイズ（今回は１個だけなので関係ない）

theta = mu_t1(3);                       % ロボットの方位
vt = ut(1);                             % 速度
wt = ut(2);                             % 角速度
Gt = [1, 0, -vt/wtcos(theta)+vt/wtcos(theta+wtdt);
      0, 1, -vt/wtsin(theta)+vt/wtsin(theta+wtdt);
      0, 0, 1];
Vt = [(-sin(theta)+sin(theta+wtdt))/wt,  vt(sin(theta)-sin(theta+wtdt))/(wt^2)+vtcos(theta+wtdt)dt/wt; ...
      ( cos(theta)-cos(theta+wtdt))/wt, -vt(cos(theta)-cos(theta+wtdt))/(wt^2)+vtsin(theta+wtdt)dt/wt; ...
      0, dt];
Mt = [alpha(1) * vt^2 + alpha(2) * wt^2, 0; ...
      0, alpha(3) * vt^2 + alpha(4) * wt^2];
mu_tb = mu_t1 + [-vt/wtsin(theta)+vt/wtsin(theta+wtdt); -vt/wtcos(theta)+vt/wtcos(theta+wtdt)]';
Sigma_tb = GtSigma_t1Gt'+VtMtVt';
Qt = [sigma_r^2, 0, 0; 0, sigma_phai^2, 0; 0, 0, sigma_s^2];

if (not(isempty(zt)))
  % ランドマークまでの距離と方位を計算（理論値）
  q = (m(1)-mu_tb(1))^2+(m(2)-mu_tb(2))^2;
  zth = [sqrt(q), atan2(m(2)-mu_tb(2), m(1)-mu_tb(1)) - mu_tb(3), 0]';
  Ht = [-(m(1)-mu_tb(1))/sqrt(q), -(m(2)-mu_tb(2))/sqrt(q), 0;
        (m(2)-mu_tb(2))/q, -(m(1)-mu_tb(1))/q, -1;
        0, 0, 0];
  St = HtSigma_tbHt'+Qt;
  Kt = Sigma_tbHt'/St;                               %カルマンゲインの計算
  % 計測更新ステップ
  mu_tb = mu_tb+Kt(zt-zth);
  Sigma_tb = (1-KtHt)Sigma_tb;
endif

mu_t = mu_tb;
Sigma_t = Sigma_tb;
pzt = 0;

endfunction