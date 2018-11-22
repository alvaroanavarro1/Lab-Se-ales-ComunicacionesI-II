%ejercicio continuo resuelto practica 3 ejercicio 1
close all
clc

T=20;
Ts=0.001*T;
t=-2*T:Ts:2*T;
A=5;
n=10;
k = -10:10;
wo=2*pi/T;
  

x= ((-1)*(t-(T/2))-T).*(t<-T/4 & t>=-3*T/4) + ((t+T)).*(t<-3*T/4 & t>=-5*T/4)+ ((-1)*(t-3*T/2)- 3*T).*(t<-5*T/4 & t>=-7*T/4)+ ((t+2*T)).*(t<-7*T/4 & t>=-2*T)   +    (t).*(t>=-T/4 & t<=T/4) + ((-1)*(t+(T/2))+T).*(t>T/4 & t<=3*T/4) + ((t-T)).*(t>3*T/4 & t<=5*T/4)+ ((-1)*(t+3*T/2)+ 3*T).*(t>5*T/4 & t<=7*T/4)+ ((t-2*T)).*(t>7*T/4 & t<=2*T) ;
 subplot(2,1,1);
 hold on
%plot(t,x);

ak=zeros(n,1);

[r m]=size(t);

for i=1:n
    for j=1:m
         ak(i,1)=ak(i)+ ((1/T)*(x(1,j)*exp((-1i)*i*t(1,j)*wo)*Ts));   
    end 
end

a0=0;
for i=1:n
    a0 = a0+((1/T)*x(i)*Ts);
end

a0=0;
t1=-2*T:Ts:2*T;
xf=a0/2;

for i=1:n
    xf=xf+(ak(i)*exp((1i)*i*wo*t1))/2;    
end

%Error
plot(t1,xf,'b');

f2=abs(abs(x)-abs(real(xf)));
f3=f2*Ts ;
ECM=0;


for i=1:length(t1)
    ECM= ECM + ((f3(i)^2)/n);
end
% para 2,5mili 26 muestras
% para 10 mili 10 muestras
   
 hold off
 z=[1:length(ak)];

subplot(2,1,2);
hold on 
%Modulo
stem(z,abs(ak),'b');stem(-z,abs(ak),'b');stem(0,abs(a0),'b');
title('Modulo');
xlabel('t');
ylabel('|Ak|');
%Fase
fase = pi/2*delta_me(0,-10,10)
stem(z,fase);
%hold off


