function [qx,qy,qMag] = reconstruct_oneforms(q,h,e,J,dxdxi,dxdeta,dydxi,dydeta)

% only for single grid
% reconstruct 1-forms

global globalnr_1v globalnr_1h

Qxi  = q(globalnr_1v);
Qeta = q(globalnr_1h);

qxi  =  h'*Qxi*e;
qeta =  e'*Qeta*h;
qx = ( qxi.*dxdxi + qeta.*dxdeta )./J;
qy = ( qxi.*dydxi + qeta.*dydeta )./J;

if nargout==3
    % qMag is magnitude of q

    qMag = sqrt(qx.^2+qy.^2);

end