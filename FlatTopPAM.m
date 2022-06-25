clc; 
close all; 
clear all;

fc = input('Enter the carrierfreq = ');
fm =input('Enter the messagefrequency  = ');

fs = 1000;
t=1;
n = [0:1/fs:t];
n = n(1:end-1);%impulse signal
dutycycle = 50; %holding time

s = square(2*pi*fc*n,dutycycle);
s(find(s<0))=0;   %to make it unipolar

%plot(s);
m = sin(2*pi*fm*n); %signal
period_sam = length(n)/fc;     %to find the number of samples in one period
ind = 1:period_sam:length(n);   %to find the starting sample index
on_samp = ceil(period_sam * dutycycle/100);   %no. of samples in on period of time
pam = zeros(1,length(n));

for i =1:length(ind)
    pam(ind(i):ind(i)+on_samp) = m(ind(i));
end

subplot(4,1,1);
plot(n,s);title('Impulse Signal')%plot impulse signal
ylim([-0.2 1.2]);
subplot(4,1,2);
plot(n,m);title('Signal')%plot impulse signal
ylim([-1.2 1.2]);
subplot(4,1,3);
plot(n,pam);title('modulation')% plot PAM Signal
ylim([-1.2 1.2]);

[b,a] = butter(5,0.02);%demodulation
s1=filter(b,a,pam);
subplot(4,1,4);
plot(n,s1); title('demodulation') %plot demodulation