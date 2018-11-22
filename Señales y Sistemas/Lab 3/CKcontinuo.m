A = 5;
T = 20;
Ts = 0.001*T;
t = -2*T:Ts:2*T;
p = trian(t+2*T,A,T)+trian(t+T,A,T)+trian(t,A,T)+trian(t-T,A,T)+trian(t-2*T,A,T);
subplot(3,2,1)
plot(t,p);
grid on
xlabel('t')
ylabel('x')
title('x(t)')
x = 0;
y = 0;
for k = 1:50
    x = x + i*(20/(k*pi)^2)*sin(k*pi/2)*exp(-i*k.*t*2*pi/T);
end
for k = -50:-1
    y = y + i*(20/(k*pi)^2)*sin(k*pi/2)*exp(-i*k.*t*2*pi/T);
end
subplot(3,2,2)
plot(t,x+y);
grid on
xlabel('t')
ylabel('x')
title('x(t) reconstruida con 50 muestras')

x1 = 0;
y1 = 0;
for k = 1:10
    x1 = x1 + i*(20/(k*pi)^2)*sin(k*pi/2)*exp(-i*k.*t*2*pi/T);
end
for k = -10:-1
    y1 = y1 + i*(20/(k*pi)^2)*sin(k*pi/2)*exp(-i*k.*t*2*pi/T);
end

subplot(3,2,3)
plot(t,x1+y1);
grid on
xlabel('t')
ylabel('x')
title('x(t) reconstruida con 10 muestras')

x2 = 0;
y2 = 0;
for k = 1:100
    x2= x2 + i*(20/(k*pi)^2)*sin(k*pi/2)*exp(-i*k.*t*2*pi/T);
end
for k = -100:-1
    y2 = y2 + i*(20/(k*pi)^2)*sin(k*pi/2)*exp(-i*k.*t*2*pi/T);
end

subplot(3,2,4)
plot(t,x2+y2);
grid on
xlabel('t')
ylabel('x')
title('x(t) reconstruida con 100 muestras')

rango = find(t>=0 & t<= 20);
E50 = p - (x+y);
E10 = p - (x1+y1);
E100 = p - (x2+y2);
EMC50 = (1/T)*sum(abs(E50(rango)).^2)
EMC10 = (1/T)*sum(abs(E10(rango)).^2)
EMC100 = (1/T)*sum(abs(E100(rango)).^2)

amplitud = abs(p);
subplot(3,2,5)
plot(t,amplitud,'.b');
grid on
xlabel('t')
ylabel('x')
title('Amplitud x(t)')

fase = angle(p);
subplot(3,2,6)
plot(t,fase,'.b');
grid on
xlabel('t')
ylabel('x')
title('Fase de x(t)')

P = (1/T)*sum(abs(p(rango)).^2)