% Laboratorio 1
% ALvaro Navarro 13-10968
% Eugenio Martinez 13-10842

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
[X4,F4] = pwelch(x4,1000,500,500000,'twosided');
X4 = fftshift(X4);

% 50 bits
[X5,F5] = pwelch(x5,1000,500,500000,'twosided');
X5 = fftshift(X5);

% 1000 bits
[X6,F6] = (pwelch(x6,1000,500,500000,'twosided'));
X6 = fftshift(X6);

figure
subplot (2,2,1)
plot(F4,X4,'r');
xlabel('Frecuencia')
ylabel('Amplitud')
title('Densidad espectral 6bits-NRZ Unipolar')

subplot (2,2,2)
plot(F5,X5,'g');
xlabel('Frecuencia')
ylabel('Amplitud')
title('Densidad espectral 50bits-NRZ Unipolar')

subplot (2,2,3)
plot(F6,X6,'b');
xlabel('Frecuencia')
ylabel('Amplitud')
title('Densidad espectral 1000bits-NRZ Unipolar')


% %4)Grafique en una misma figura la DEP de los tres casos estudiados usando una secuencia
% de entrada de 1000 bits.

[t7,x7,fs7] = NRZpolar(N3, rb2, A2);
[t8,x8,fs8] = Manchester(N3, rb2, A2);

[X7,F7] = pwelch(x7,1000,500,500000,'twosided');
X7 = fftshift(X7);

[X8,F8] = pwelch(x8,1000,500,500000,'twosided');
X8 = fftshift(X8);

figure
subplot (2,2,1)
plot(F6,X6,'r');
xlabel('Frecuencia')
ylabel('Amplitud')
title('Densidad espectral NRZ unipolar 1000 bits')

subplot (2,2,2)
plot(F7,X7,'g');
xlabel('Frecuencia')
ylabel('Amplitud')
title('Densidad espectral NRZ polar 1000 bits')

subplot (2,2,3)
plot(F8,X8,'b');
xlabel('Frecuencia')
ylabel('Amplitud')
title('Densidad espectral Manchester 1000 bits')

figure
hold on
plot(F4,X4,'r');
plot(F5,X5,'g');
plot(F6,X6,'b');
xlabel('Frecuencia')
ylabel('Amplitud')
title('Densidad espectral UNRZ (red = 6bits, green = 50bits, blue=1000bits)')

figure
hold on
plot(F6,X6,'r');
plot(F7,X7,'g');
plot(F8,X8,'b');
xlabel('Frecuencia')
ylabel('Amplitud')
title('Densidad espectral 1000 bits (red = UNRZ, green = PNRZ, blue=Manchester)')