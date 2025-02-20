%Matlab Assignment #1
%EE 402-02  2/11/19
%Chris Adams

%compute integral of x^2 from 0 to 1
samples = 100000;
t = 0:(1/samples):1;                %discretizing time
delt = t(2);                        %time spacing
f_x = t.^2;                         %x^2 matrix

sum_integral = delt*sum(f_x);       %computing summation integral

trap_integral = trapz(t, f_x);      %computing trapezoidal integral

sum_int = num2str(sum_integral);
disp(strcat('Summation integral of x^2 =', sum_int))

trap_int = num2str(trap_integral);
disp(strcat('Trapz integral of x^2 =', trap_int))