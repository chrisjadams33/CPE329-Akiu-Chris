M = 15;                 %filter length
Fc = 0.2;               %digital cutoff
fsample = 1000;         %sampling frequency
beta = 2.180895622;     %beta for kaiser

%rectangular window filter
rect_filter = FIR_Filter_By_Window(M, Fc, rectwin(M));
[h_rect] = freqz(rect_filter,1,1024);

%hamming window filter
hamm_filter = FIR_Filter_By_Window(M, Fc, hamming(M));
[h_hamm] = freqz(hamm_filter,1,1024);

%kaiser window filter
kaiser_filter = FIR_Filter_By_Window(M, Fc, kaiser(M,beta));
[h_kaiser] = freqz(kaiser_filter,1,1024);

%filter by frequency sampling
hn = FIR_Filter_By_Freq_Sample([1 1 1 0.5 0 0 0 0 0 0 0 0 0.5 1 1]  , 1);
[h_sample] = freqz(hn,1,1024);

%Parks-McClellan optimal FIR filter
pm_filter = firpm(M-1, [0 .1335 0.2665 0.5]*2, [1 1 0 0]);
[h_pm,w] = freqz(pm_filter,1,1024);


figure
plot(w/2/pi, abs(h_rect), w/2/pi, abs(h_hamm), w/2/pi, abs(h_kaiser), w/2/pi, abs(h_sample), w/2/pi, abs(h_pm), 'LineWidth',3)
legend( 'rectangular window', 'hamming window', 'kaiser window', 'frequency sampling filter', 'Parks-McClellan optimal filter')
xlabel('Digital Frequency (cycles/sample)')
ylabel('Magnitude Response')
title('FIR Filter Responses')
grid
figure(2)
plot(w/2/pi, 20*log10(abs(h_rect)), w/2/pi, 20*log10(abs(h_hamm)), w/2/pi, 20*log10(abs(h_kaiser)), w/2/pi, 20*log10(abs(h_sample)), w/2/pi, 20*log10(abs(h_pm)), 'LineWidth',3)
legend( 'rectangular window', 'hamming window', 'kaiser window', 'frequency sampling filter', 'Parks-McClellan optimal filter')
xlabel('Digital Frequency (cycles/sample)')
ylabel('Magnitude Response (dB)')
title('FIR Filter Repsonses')
grid