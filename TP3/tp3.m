[Y, Fe] = audioread('blas4.wav');
N = length(Y);
%sound(Y, Fe);

%filtre de Diana
B = [1 1 0];
A = [3];
Res = filter(B, A, Y);
figure(1);
%sound(Res, Fe);
[H, W] = freqz(B, A, N, Fe);
subplot(2,1,1);
plot(W, abs(H));
title('filtre de Diana');

%filtre de Thierry
B = [1 2 1];
A = [13 -14 5];
Res = filter(B, A, Y);
[H, W] = freqz(B, A, N, Fe);
subplot(2,1,2);
plot(W, abs(H));
title('filtre de Thierry');
%sound(Res, Fe);

%filtre1
%B = [1 -1];
%A = [1 -(2-pi)/(2+pi)];
%figure(2);
%subplot(2, 1, 1);
[B, A] = ellip(8,1,80,[0.0375,0.425]);
%fvtool(B,A);
%zplane(B, A);
%title('H(z) de filtre1');
Res = filter(B, A, Y);
%[H, W] = freqz(B, A, N, Fe);
%[H,T] = impz(B,A);
%[Gd,W] = grpdelay(B,A,N);
%subplot(2,1,2);
%plot(T, abs(H));
%title('filtre1');
sound(Res, Fe);





