e_c = 1.6e-19;   % electron charge
N = 2e10;        % number of electrons
sig_r = 30e-6;   % radius
sig_z = 60e-6;   % bunch length
e_0 = 8.854e-12; % permittivity of free space
he_i = 5;       % helium ionization threshold in GV/m

r = linspace(0.1e-6,100e-6,1000);
z = linspace(-100e-6,200e-6,2000);
e_i = he_i*ones(numel(r),1);

% radial elcectric field
e_r = e_c*N*(1-exp(-r.^2/(2*sig_r^2)))./((2*pi)^1.5*e_0*sig_z*r);

figure(1);
plot(1e6*r,e_r/1e9,'b',1e6*r,e_i,'r');
xlabel('r (\mum)','fontsize',14);
ylabel('E_r (GV/m)','fontsize',14);
title('Radial Electric field at z = 0, Ionizing field = 5 GV/m','fontsize',14);

figure(2);
[R,Z] = meshgrid(0.1e-6:0.5e-6:100e-6,-100e-6:0.5e-6:100e-6);
Er_z = e_c*N*(1-exp(-R.^2/(2*sig_r^2))).*exp(-Z.^2/(2*sig_z^2))./((2*pi)^1.5*e_0*sig_z*R);
mesh(1e6*R,1e6*Z,Er_z/1e9);
xlabel('r (\mum)','fontsize',14);
ylabel('z (\mum)','fontsize',14);
zlabel('E_r (GV/m)','fontsize',14);
