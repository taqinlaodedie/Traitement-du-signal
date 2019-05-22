%Butterworth---------------------------------------------------------------
%%Q1
% Wn = 2000/8000;            %fc = 2000Hz, fe = 16000Hz
% [B,A] = butter(3,Wn,'low'); %ordre 3
% h = fvtool(B,A);
% %a 9520Hz, attenuation = 50dB

% %Q2
% Wp = 2000/8000;            %fc = 2000Hz, fe = 16000Hz
% Ws = 2500/8000;            %a 2500Hz attenuation 50dB
% [n,Wn] = buttord(Wp,Ws,3,50);
% [B,A] = butter(n,Wn,'low');
% [H,F] = freqz(B,A,1024,16000);
% plot(F,20*log10(abs(H)));

%elliptique----------------------------------------------------------------
% %Q3
% Wp = 2000/8000;            %fc = 2000Hz, fe = 16000Hz
% Ws = 2500/8000;            %a 2500Hz attenuation 50dB
% [n,Wp] = ellipord(Wp,Ws,0.1,50);
% [B,A] = ellip(n,0.1,50,Wp);
% [H,F] = freqz(B,A,1024,16000);
% plot(F,20*log10(abs(H)));

%fir avec sinc-------------------------------------------------------------
% %Q4
% N = 53;
% vc = 2000/16000;
% ham = hamming(N);
% k = -(N-1)/2 : (N-1)/2;
% T = 1:1:N;
% h = 2*vc*sinc(2*vc*k');
% h = h.*ham;
% B = h;
% A = 1;
% [H,W] = freqz(B,A,500);
% plot(W/2/pi*16000,20*log10(abs(H)));

%firpm---------------------------------------------------------------------
% %Q5
% [n,fo,mo,w] = firpmord( [2000 2500], [1 0], [0.01 (10^(-50/20))], 16000 );
% h = firpm(n,fo,mo,w);
% freqz(h,1,1024,16000);

%derivateur----------------------------------------------------------------
Fe = 16000;
N = 500;
G = 20;
b = G*firpm(N,[0 0.9],[0 0.9],'d');
k = 1: 1: N;
for i = 1:N
    f(i) = (1 - (k(i)/Fe)^2) * sin(2*pi*100*k(i)/Fe);
    T(i) = k(i)/Fe;
end
subplot(2,1,1);
plot(T,f);