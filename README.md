% 参数（可调）
pars.c     = 0.10;
pars.gamma = 1.0;
pars.tau   = 0.10;
pars.k     = 0.30;   % 开关阈值：S = F/T = k
pars.m     = 20;     % 陡峭度（大=更像开关）

% pplane 调用
pp8(@(z,X) tw_FT_sys(z,X,pars), [0 2  0 2]);   % 视窗 [Tmin Tmax Fmin Fmax]
