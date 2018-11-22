n = -500:500;
f = (pi/8).*n;
x = 5*sin((pi/8).*n);
Xf =  fft(x);
Xt = ifft(Xf)

figure (1)
subplot(2,2,1);
stem(f,abs(Xf),'.m')
xlabel('Eje w')
ylabel('|X|')
title('Modulo de TF de x[n]')
grid on
subplot(2,2,2);
stem(f,angle(Xf),'.m')
xlabel('Eje w')
ylabel('Fase X')
title('Angulo de TF de x[n]')
grid on
subplot(2,2,3);
stem(n,x,'.m')
xlabel('Eje n')
ylabel('x[n]')
title('Señal Original')
grid on
subplot(2,2,4);
stem(n,Xt,'.m')
xlabel('Eje n')
ylabel('ITF X[e^(jw)]')
title('Inversa de transformada de Fourier de X[e^(jw)]')
grid on

N = -10:10;
y = ((1/2).^N).*heaviside(N);
Yf =  fft(y);
Yt = ifft(Yf)

figure (2)
subplot(2,2,1);
stem(N,abs(Yf),'.m')
xlabel('Eje w')
ylabel('|Y|')
title('Modulo de TF de y[n]')
grid on
subplot(2,2,2);
stem(N,angle(Yf),'.m')
xlabel('Eje w')
ylabel('Fase Y')
title('Angulo de TF de y[n]')
grid on
subplot(2,2,3);
stem(N,y,'.m')
xlabel('Eje n')
ylabel('y[n]')
title('Señal Original')
grid on
subplot(2,2,4);
stem(N,Yt,'.m')
xlabel('Eje n')
ylabel('ITF Y[e^(jw)]')
title('Inversa de transformada de Fourier de Y[e^(jw)]')
grid on