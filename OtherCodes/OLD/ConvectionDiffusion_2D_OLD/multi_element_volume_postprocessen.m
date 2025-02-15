% multi_element_volume_postprocessen

etaGLL = xiGLL;
dxideta = diff(xiGLL)'*diff(etaGLL);

figure
axis([-1 1 -1 1])
for r=1:numRows
for c=1:numColumns
    rc = c+(r-1)*numColumns;
    
    P = reshape(p((rc-1)*N2+(1:N2)),N,N);

%     subplot(1,2,1)
%     for i=1:N
%         for j=1:N
%             ii = (c-1)*N+i;
%             jj = (r-1)*N+j;
%     surf([XGLLGLL(ii:ii+1,1)' ; XGLLGLL(ii:ii+1,1)'],[YGLLGLL(1,jj) YGLLGLL(1,jj) ; YGLLGLL(1,jj+1) YGLLGLL(1,jj+1)],P(i,j)/dxideta(i,j)*ones(2))
%     hold on
%     view([0 0 1])
%         end
%     end


nn = 50;
xx = linspace(-1,1,nn);
XX = linspace(-1+2/numColumns*(c-1),-1+2/numColumns*c,nn)'*ones(1,nn);
yy = linspace(-1,1,nn);
YY = ones(nn,1)*linspace(-1+2/numRows*(r-1),-1+2/numRows*r,nn);

XiGLL  = xiGLL'*ones(1,N+1);
EtaGLL = ones(N+1,1)*etaGLL;

[hh,dhhdxx] = LagrangeVal(xx,N,1);
ee = EdgeVal(dhhdxx);
pp = ee'*P*ee;

% subplot(1,2,2)
surf(XX,YY,pp)
hold on
view([0 0 1])
end
end

% subplot(1,2,1)
% xlabel('x')
% ylabel('y')
% view([0 0 1])
% axis square
% 
% subplot(1,2,2)
shading interp
xlabel('x')
ylabel('y')
% set(gca,'clim',[-1.1 1.1])
axis square
