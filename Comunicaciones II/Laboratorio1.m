% Laboratorio 1
% ALvaro Navarro 13-10968
% Eugenio 

clear all
close all
% 1) Verifique el funcionamiento de las funciones desarrolladas por Usted en el prelaboratorio
%    usando la secuencia de entrada [1 0 1 1 0 0 1]. Haga la gráfica de las señales en el tiempo.

X = [1 0 1 1 0 0 1];
rb = 1;
A = 1;

[t1,x1,fs1] = UNRZ(X, rb, A);
figure;
plot (t1,x1);
title('Codigo NRZ Unipolar')


[t2,x2,fs2] = NRZpolar(X, rb, A);
figure ;
plot (t2,x2);
title('Codigo NRZ Polar')

[t3,x3,fs3] = Manchester(X, rb, A);
figure ;
plot (t3,x3);
title('Codigo Manchester')

% 2)Halle la DEP para el caso de señalamiento NRZ Unipolar para una secuencia de entrada de 6 bits, 50 bits y 1000 bits.

N1 = randi([0,1],1,6) ; % 6 bits
N2 = randi([0,1],1,50) ; % 50 bits
N3 = randi([0,1],1,1000) ; % 1000 bits

rb2 = 1;
A2 = 1;

[t4,x4,fs4] = UNRZ(N1, rb2, A2);
[t5,x5,fs5] = UNRZ(N2, rb2, A2);
[t6,x6,fs6] = UNRZ(N3, rb2, A2);

% 6 bits
X4 = fftshift(fft(x4));
MX4=abs(X4);
L1 = length(MX4);
MX4=MX4/L1;
Sx4 = (MX4.*conj(MX4));
f4=-fs4/2:fs4/L1:fs4/2-fs4/L1; 

% 50 bits
X5 = fftshift(fft(x5));
MX5=abs(X5);
L2 = length(MX5);
MX5=MX5/L2;
Sx5 = (MX5.*conj(MX5));
f5=-fs5/2:fs5/L2:fs5/2-fs5/L2; 

% 1000 bits
X6 = fftshift(fft(x6));
MX6=abs(X6);
L3 = length(MX6);
MX6=MX6/L3;
Sx6 = (MX6.*conj(MX6));
f6=-fs6/2:fs6/L3:fs6/2-fs6/L3; 

figure
subplot (2,2,1)
plot(f4,Sx4,'r');
%axis([0 100 0 20])
xlabel('Frecuencia')
title('Densidad espectral 6bits ---')

subplot (2,2,2)
plot(f5,Sx5,'g');
%axis([0 100 0 20])
xlabel('Frecuencia')
title('Densidad espectral 50bits')

subplot (2,2,3)
plot(f6,Sx6,'b');
%axis([0 100 0 20])
xlabel('Frecuencia')
title('Densidad espectral 1000bits')

% %4)Grafique en una misma figura la DEP de los tres casos estudiados usando una secuencia
% de entrada de 1000 bits.

[t7,x7,fs7] = NRZpolar(N3, rb2, A2);
[t8,x8,fs8] = Manchester(N3, rb2, A2);

X7 = fftshift(fft(x7));
MX7=abs(X7);
L4 = length(MX7);
MX7=MX7/L4;
Sx7 = (MX7.*conj(MX7));
f7=-fs7/2:fs7/L4:fs7/2-fs7/L4; 

X8 = fftshift(fft(x8));
MX8=abs(X8);
L5 = length(MX8);
MX8=MX8/L5;
Sx8 = (MX8.*conj(MX8));
f8=-fs8/2:fs8/L5:fs8/2-fs8/L5; 

figure
subplot (2,2,1)
plot(f6,Sx6,'r');
%axis([0 100 0 20])
xlabel('Frecuencia')
title('Densidad espectral NRZ unipolar 1000 bits')

subplot (2,2,2)
plot(f7,Sx7,'g');
%axis([0 100 0 20])
xlabel('Frecuencia')
title('Densidad espectral NRZ polar 1000 bits')

subplot (2,2,3)
plot(f8,Sx8,'b');
%axis([0 100 0 20])
xlabel('Frecuencia')
title('Densidad espectral Manchester 1000 bits')

figure
hold on
plot(f4,Sx4,'r');
plot(f5,Sx5,'g');
plot(f6,Sx6,'b');
title('Densidad espectral UNRZ (red = 6bits, green = 50bits, blue=1000bits)')

figure
hold on
plot(f6,Sx6,'r');
plot(f7,Sx7,'g');
plot(f8,Sx8,'b');
title('Densidad espectral 1000 bits (red = UNRZ, green = PNRZ, blue=Manchester)')