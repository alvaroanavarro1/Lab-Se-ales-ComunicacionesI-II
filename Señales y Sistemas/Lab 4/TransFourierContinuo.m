
t = -5:0.0001:5;
p1 = 1;
p2 = cos(2*pi*500*t - (pi/6));
p3 = cos(2*pi*750*t - (pi/4));
p4 = sin(2*pi*1000*t - (pi/4));
p = p1 + p2 + p3 + p4;

figure (1)
subplot(2,2,1);
stem(t,p2,'.m')
xlabel('Eje t')
ylabel('p2(t)')
title('p2 = cos(2*pi*500*t - (pi/6))')
grid on
subplot(2,2,2);
stem(t,p3,'.m')
xlabel('Eje t')
ylabel('p3(t)')
title('p3 = cos(2*pi*750*t - (pi/4))')
grid on
subplot(2,2,3);
stem(t,p3,'.m')
xlabel('Eje t')
ylabel('p4(t)')
title('p4 = sin(2*pi*1000*t - (pi/4))')
grid on
subplot(2,2,4);
stem(t,p,'.m')
xlabel('Eje t')
ylabel('p(t)')
title('p = 1 + p2 + p3 + p4')
grid on

Pf =  fft(p);
Pt = ifft(Pf);

figure (2)
subplot(2,2,1);
stem(t,abs(Pf),'.m')
xlabel('Eje w')
ylabel('|P|')
title('Modulo de TF de p[n]')
grid on
subplot(2,2,2);
stem(t,angle(Pf),'.m')
xlabel('Eje w')
ylabel('Fase P')
title('Angulo de TF de p[n]')
grid on
subplot(2,2,3);
stem(t,p,'.m')
xlabel('Eje t')
ylabel('p[t]')
title('Señal Original')
grid on
subplot(2,2,4);
stem(t,Pt,'.m')
xlabel('Eje y')
ylabel('ITF P[jw]')
title('Inversa de transformada de Fourier de P[jw]')
grid on 

m1 = cos(2*pi*500*t);
m2 = sin(2*pi*2000*t);
m = m1.*m2;

figure (3)
subplot(3,1,1);
stem(t,m1,'.m')
xlabel('Eje t')
ylabel('m1(t)')
title('m1 = cos(2*pi*500*t))')
grid on
subplot(3,1,2);
stem(t,p3,'.m')
xlabel('Eje t')
ylabel('m2(t)')
title('m2 = sin(2*pi*2000*t)')
grid on
subplot(3,1,3);
stem(t,m,'.m')
xlabel('Eje t')
ylabel('m(t)')
title('m = m1*m2')
grid on


M1=  fft(m1);
M2=  fft(m2);

figure (4)
subplot(2,2,1);
stem(t,abs(M1),'.m')
xlabel('Eje w')
ylabel('|M1|')
title('Modulo de TF de m1[n]')
grid on
subplot(2,2,2);
stem(t,angle(M1),'.m')
xlabel('Eje w')
ylabel('Fase M1')
title('Angulo de TF de m1[n]')
grid on
subplot(2,2,3);
stem(t,abs(M2),'.m')
xlabel('Eje w')
ylabel('|M2|')
title('Modulo de TF de m2[n]')
grid on 
subplot(2,2,4);
stem(t,angle(M2),'.m')
xlabel('Eje w')
ylabel('Fase M2')
title('Angulo de TF de m2[n]')
grid on

Mf =  fft(m);
Mt = ifft(Mf);

figure (5)
subplot(2,2,1);
stem(t,abs(Mf),'.m')
xlabel('Eje w')
ylabel('|M|')
title('Modulo de TF de m[n]')
grid on
subplot(2,2,2);
stem(t,angle(Mf),'.m')
xlabel('Eje w')
ylabel('Fase M')
title('Angulo de TF de m[n]')
grid on
subplot(2,2,3);
stem(t,m,'.m')
xlabel('Eje t')
ylabel('m[t]')
title('Señal Original')
grid on
subplot(2,2,4);
stem(t,Mt,'.m')
xlabel('Eje y')
ylabel('ITF M[jw]')
title('Inversa de transformada de Fourier de M[jw]')
grid on 


%%%escuchar m1 m2 y  m !!!