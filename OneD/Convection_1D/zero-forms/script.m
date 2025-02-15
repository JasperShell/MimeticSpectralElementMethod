clear all
close all
clc

N = 5;
H = 3;%16%[ 4 8 16 32 ];
T = 100;  T = T-1e-10;
dt=5e-3;

for i=1:length(H)
    L2error_dt(i)=skew_zero_1D_CN_ME_funct(N,H(i),T,dt)
end

loglog(1./[16 32 64 128],[0.7881    0.3824    0.1503    0.0588])
hold on
loglog(1./[16 32 64 128],[0.0267    0.0079    0.0023    0.0007],'r')
loglog(1./[16 32 64 128],[0.0064    0.0030    0.0012    0.0004],'g')
loglog(1./[8 16 32 64],[0.0141    0.0029    0.0009    0.0003],'c')
loglog(1./[4 8 16 32],[0.0214    0.0046    0.0011    0.00025],'m')

legend('N=1','N=2','N=3','N=4','N=5')
xlabel('\Delta x')
ylabel('L^2-error')
%%%%%%%%%%%%%%%%%%%%%%
