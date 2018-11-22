t=[-10:10];
x = ((1/2)*exp(-i*pi*t))+((1/2)*exp(-i*0.5*pi*t))+((1/2)*exp(-i*0.25*pi*t))+((1/2)*exp(i*0.25*pi*t))+((1/2)*exp(i*0.5*pi*t))+((1/2)*exp(i*pi*t));
stem(t,x);

