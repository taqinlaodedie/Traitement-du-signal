[Y, FS] = audioread('Cplus4.wav');
N = length(Y);
B = 8000;
%sound(Y, FS);

%représentation temporelle de l'audio
t = 1/FS : 1/FS : N/FS;
figure(1);
subplot(2,1,1);
plot(t, Y);
title('Représentation Temporelle');
xlabel('t[s]');
ylabel('A');
%représentation fréquentielle
ff = fft(Y);
f = FS/N : FS/N : FS/2;
sp = ff(1 : N/2);
sp = 20*(log10(abs(sp)));
subplot(2,1,2);
plot(f, sp);
title('Représentation fréquentielle');
xlabel('f[Hz]');
ylabel('G[dB]');

%démodulation
v = cos(2*pi*B*t);
dem = v'.*Y;

vc = B/FS;
figure(2)
subplot(2,1,1);
title('Représentation Temporelle du signal démodulé');
xlabel('t[s]');
ylabel('A');
[n,wp]=ellipord(2*vc,2*vc+0.01,1,80);
[b,a]=ellip(n,1,80,wp);
sig = filter(b,a,dem);
plot(t,sig);
sound(sig, FS);
ffd = fft(sig);
spd = ffd(1 : N/2);
spd = 20*log10(abs(spd));

subplot(2,1,2);
plot(f, spd);
title('Représentation fréquentielle du spectre démodulé');
xlabel('f[Hz]');
ylabel('G[dB]');
