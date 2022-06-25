clc;
close all;
clear all;

fc = input('Enter the carrierfreq = ');
fm = input('Enter the messagefrequency  = ');

fs=100*fc;
t = 0:1/fs:4/fm; 
m = sin(2*pi*fm*t); %impulse signal
c=0.5*square(2*pi*fc*t)+0.5; %signal
mo=m.*c;

subplot(4,1,1); %for impulse signal plot
plot(t,m);
title('message Signal');
xlabel('Time');
ylabel('Amplitude ');
grid on;

subplot(4,1,2) %for sine wave plot
plot(t,c);
title('carrier');
xlabel('Time ');
ylabel('Amplitude ');
grid on;

subplot(4,1,3) %for Natural Sampling wave plot
plot(t,mo);
title('Natural PAM (Sampling) signal');
xlabel('Time');
ylabel('Amplitude');
grid on;
