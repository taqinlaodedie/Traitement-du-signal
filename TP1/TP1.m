FILE = 'boss.wav'
[Y, FS]=audioread(FILE)

F = fft(Y)
L=length(axisY)
dec = 20*abs(log10(F))
dec = dec(1:L/2+1)

%t=[0:1/FS:length(Y)/FS]
f=FS*(0:L/2)/L
plot(f,dec)
