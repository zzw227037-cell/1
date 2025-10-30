function dXdz = tw_FT_sys(z, X, pars)
% X = [T; F], slow-flow reduction with L = ((1-c)/c) F
T = max(X(1), 1e-12);  % 保底，避免除零
F = max(X(2), 0);

% 参数
c  = pars.c;          % ~0.1
gam= pars.gamma;      % gamma
tau= pars.tau;        % ~0.05 - 0.2
k  = pars.k;          % switch threshold in S=F/T
m  = pars.m;          % Hill steepness

L = ((1-c)/c) * F;
S = F / T;

Phi = (S.^m) ./ (k^m + S.^m);  % Hill（m大时≈开关）

dT = (gam/c) * ( T - ((1-c)/c + tau)*F );
dF = (1/(1-c)) * ( -F + L*T .* Phi );

dXdz = [dT; dF];
end
