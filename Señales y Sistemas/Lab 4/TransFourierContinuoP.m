fs = 10000;
Ts = 1/fs;
t = -5:Ts:5;
L = length(t);
p1 = 1;
p2 = cos(2*pi*500*t - (pi/6));
p3 = cos(2*pi*750*t + (pi/4));
p4 = sin(2*pi*1000*t - (pi/4));
p = p1 + p2 + p3 + p4;

figure (1)
subplot(2,2,1);
plot(t,p2,'m')
xlabel('t')
ylabel('p2')
title('p2(t) = cos(2*pi*500*t-(pi/6))')
grid on
subplot(2,2,2);
plot(t,p3,'m')
xlabel('t')
ylabel('p3')
title('p3(t) = cos(2*pi*750*t-(pi/4))')
grid on
subplot(2,2,3);
plot(t,p4,'m')
xlabel('t')
ylabel('p4')
title('p4(t) = sin(2*pi*1000*t - (pi/4))')
grid on
subplot(2,2,4);
plot(t,p,'m')
xlabel('t')
ylabel('p')
title('p(t) = 1 + p2 + p3 + p4')
grid on

Pf =  (2*pi/L).*fftshift(fft(p));
Pt = ifftshift(ifft(Pf));

angle(Pf)

figure (2)
subplot(2,2,1);
stem(t,abs(Pf),'.m')
xlabel('w')
ylabel('|P|')
title('Modulo de P(jw)')
grid on
subplot(2,2,2);
stem(t,round(angle(Pf)),'.m')
xlabel('w')
ylabel('Fase')
title('Fase de P(jw)')
grid on
subplot(2,2,3);
plot(t,p,'m')
xlabel('t')
ylabel('p')
title('Señal Original p(t)')
grid on
subplot(2,2,4);
plot(t,Pt,'m')
xlabel('t')
ylabel('ITF P[jw]')
title('Inversa de transformada de Fourier de P[jw]')
grid on 