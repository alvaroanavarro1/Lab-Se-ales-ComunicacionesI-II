fs = 10000;
Ts = 1/fs;
t = -5:Ts:5;
L = length(t);

m1 = cos(2*pi*500*t);
m2 = cos(2*pi*2000*t);
m = m1.*m2;

figure (1)
subplot(3,1,1);
plot(t,m1,'r')
xlabel('t')
ylabel('m1')
title('m1(t) = cos(2*pi*500*t))')
grid on
subplot(3,1,2);
plot(t,p3,'r')
xlabel('t')
ylabel('m2')
title('m2(t) = cos(2*pi*2000*t)')
grid on
subplot(3,1,3);
plot(t,m,'r')
xlabel('t')
ylabel('m')
title('m(t) = cos(2*pi*500*t)*cos(2*pi*2000*t')
grid on


M1=  (2*pi/L).*fftshift(fft(m1));
M2=  (2*pi/L).*fftshift(fft(m2));

figure (2)
subplot(2,2,1);
stem(t,abs(M1),'.r')
xlabel('w')
ylabel('|M1|')
title('Modulo de TF de cos(2*pi*500*t)')
grid on
subplot(2,2,2);
stem(t,angle(M1),'.r')
xlabel('w')
ylabel('Fase M1')
title('Angulo de TF de cos(2*pi*500*t)')
grid on
subplot(2,2,3);
stem(t,abs(M2),'.r')
xlabel('w')
ylabel('|M2|')
title('Modulo de TF de cos(2*pi*2000*t)')
grid on 
subplot(2,2,4);
stem(t,angle(M2),'.r')
xlabel('w')
ylabel('Fase M2')
title('Angulo de TF de cos(2*pi*2000*t)')
grid on

Mf = (2*pi/L).*fftshift(fft(m));
Mt = ifftshift(ifft(Mf));

figure (3)
subplot(2,2,1);
stem(t,abs(Mf),'.r')
xlabel('Eje w')
ylabel('|M|')
title('Modulo de TF de m[n]')
grid on

subplot(2,2,2);
stem(t,angle(Mf),'.r')
xlabel('Eje w')
ylabel('Fase M')
title('Angulo de TF de m[n]')
grid on

subplot(2,2,3);
plot(t,m,'r')
xlabel('Eje t')
ylabel('m[t]')
title('Señal Original')
grid on

subplot(2,2,4);
plot(t,Mt,'r')
xlabel('Eje y')
ylabel('ITF M[jw]')
title('Inversa de transformada de Fourier de M[jw]')
grid on 


%%%escuchar m1 m2 y  m !!!