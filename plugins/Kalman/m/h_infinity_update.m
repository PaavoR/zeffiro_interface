function [m, P, K] = h_infinity_update(m,P,y,H,R, A, Q)
% kf_update is the update step of kalman filter
    v = y-H*m;
    % downsample? H, P, R before S
    S = (eye(size(P)) + H'/R*H*P);
    K = P/S*H'/R;    % /S is  same as *inv(S) but faster and more accurate
    % upsample? K, P
    m = A*m + A * K * v;
    P = A*P/S*A' + Q;
    % upsample P
end
