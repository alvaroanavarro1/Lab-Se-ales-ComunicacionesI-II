Fs = 44100;
[y,Fs] = audioread('practica4senales.wav');
Ts= 1/Fs;
tiempo = size(y,1)/Fs
t=[0:1/Fs:tiempo];
figure(1)
plot(t(2:end),y);

a = 1*exp(-3)*[0.0598 0 -0.299 0 0.598 0 -0.598 0 0.299 0 -0.0598];
b = [1 -6.4322 20.5771 -42.0775 60.4562 -63.4748 49.2785 -27.9457 11.1415 -2.8385 0.3599];
filtrada1=filter(a,b,y);
figure(2)
plot(t(2:end),filtrada);

c = [0.0033 0 -0.0164 0 0.0328 0 -0.0328 0 0.0164 0 -0.033];
d = [1 5.7207 15.7768 27.5627 33.7438 30.1855 19.9491 9.6155 3.2418 0.6934 0.0723];
filtrada2=filter(c,d,y);
figure(3)
plot(t(2:end),y);