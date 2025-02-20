
%initialize material parameters
ep = [1 1.66 2.76]*8.85e-12;
mu = [1 1 1]*pi*4e-7;
layers = 3;
f = (6:0.005:14)*10^5;
d = 58.19;

%calculate intrinsic impedences
for n = 1:layers
    eta(n) = sqrt(mu(n)/ep(n));
end

%cycle through freq to get reflection coefficient magnitude
for i = 1:length(f)
    beta_2 = 2*pi*f(i)*sqrt(mu(2)*ep(2));
    z = eta(2)*(eta(3)+1i*eta(2)*tan(beta_2*d))/(eta(2)+1i*eta(3)*tan(beta_2*d));
    refl_mag(i) = abs((z - eta(1))/(z + eta(1)));
end

refl_mag_dB = 20*log10(refl_mag);       %convert to dB

%finding -10dB bandwidth
index1 = find(refl_mag_dB <-19.99 & refl_mag_dB > -20.01, 1, 'first');
index2 = find(refl_mag_dB <-19.99 & refl_mag_dB > -20.01, 1, 'last');
delt = f(index2)-f(index1);
BW = delt/10^4;
disp(['BW = ', num2str(BW), '%'])

%plot response
plot(f/10^6, refl_mag_dB) 
grid
xlabel('frequency (MHz)')
ylabel('Reflection Coefficient Magnitude Response (dB)')
title('Reflection Coefficient Magnitude vs. Frequency for 5.14 (d = 58.19m)')