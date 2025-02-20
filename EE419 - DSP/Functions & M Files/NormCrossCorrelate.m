function [Cxy, index] =  NormCrossCorrelate(xn, yn)
%this function takes 2 inputs and takes the normalized cross correlation
%between the two

My = length(yn);       %compute lengths
Mx = length(xn);
M = My + Mx - 1;       %number of samples for fft is sum of lenghts - 1
n = 2^(nextpow2(M));   %for most efficient fft computation

extra = floor(n-M);    %to see how much is going to be zero padded
index = (0:M-1);

Xk = fft(xn, n);       %fft of x[n]
Yk = fft(yn, n);       %fft of y[n]
Ck = Xk.*conj(Yk);     % to compute cross correlation conv. in time domain is multipl. in freq. 

cn = real(ifft(Ck));   %compute the cross correlation of x and y

rxx = real(ifft(Xk.*conj(Xk))); %compute autocorrelation of x
ryy = real(ifft(Yk.*conj(Yk))); %compute autocorrelation of y 
Cxy_temp = cn/(sqrt(rxx(1)*ryy(1))); %compute the normalized cross correlation of x and y

Cxy = Cxy_temp(1:end-extra);
%Cxy = [Cxy_temp((Mx/2):end-extra+1) Cxy_temp(1:(Mx/2)-1)];

%Generate plots
    figure

    %make stem plot of input
    subplot(3, 1, 1)
    stem(0:(length(xn)-1), xn, '.', 'MarkerSize', 20, 'Linewidth', 2);
    xlabel('Sample Index')
    ylabel('Amplitude')
    title('x[n] Sequence')

    %make stem plot of unit sample response
    subplot(3, 1, 2)
    stem(0:(length(yn)-1), yn, '.', 'MarkerSize', 20, 'Linewidth', 2);
    xlabel('Sample Index')
    ylabel('Amplitude')
    title('y[n] Sequence')

    %make stem plot of output
    subplot(3, 1, 3)
    stem(index, Cxy, '.', 'MarkerSize', 20, 'Linewidth', 2);
    xlabel('Sample Index')
    ylabel('Normalized Amplitude')
    title('Cross Correlation Between x[n] and y[n]')
    xlim([0 length(Cxy)])

end