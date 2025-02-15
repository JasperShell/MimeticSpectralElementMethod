% 2D linear advection

clear all
close all
clc

% Exact solution

nn = 100;
x = linspace(-1,1,nn);
y = x;
X = x'*ones(1,nn);
Y = ones(nn,1)*y;

lambda = 1/8;
x0 = -1/2;
y0 = 0;

U0 = exp(-((X-x0).^2+(Y-y0).^2)/(2*lambda^2));

surf(X,Y,U0)
shading interp
colorbar
axis equal
axis([-1 1 -1 1 0 1])
set(gca,'Ztick',[0 1])
set(gca,'clim',[0 1])
pause(0.05)

T = 1;
dt = 0.05;

t=0;
while t<T
    
    t = t+dt;
    
    Xh = X-x0*cos(2*pi*t)-y0*sin(2*pi*t);
    Yh = Y+x0*sin(2*pi*t)-y0*cos(2*pi*t);
    
    U = exp(-(Xh.^2+Yh.^2)/(2*lambda^2));
    
    surf(X,Y,U)
    shading interp
    colorbar
    axis equal
    axis([-1 1 -1 1 0 1])
    set(gca,'Ztick',[0 1])
    set(gca,'clim',[0 1])
    pause(0.05)
    
end