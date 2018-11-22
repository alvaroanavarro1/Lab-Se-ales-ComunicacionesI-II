%Alvaro Navarro 13-10968

Am=1;
fm=1000;
fs=110250;
N=825000;
t=0:1/fs:(N-1)*(1/fs);
xc = Am*cos(2*pi*fm*t); %Tono producido
tono = fftplot(xc, fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro');
figure
plot(t, xc);
axis ([ 0 0.01 -1 1 ]);
grid on;
xlabel('Tiempo [s]'), ylabel('Amplitud'), title('SeÃ±al en el dominio temporal');

fc=20000; %Frecuencia de la portadora
Am1=1; %Se varia la amplitud del tono manteniendo constante la frecuencia
Am2=10;
Am3=20;
xc1 = Am1*xc;
xc2 = Am2*xc;
xc3 = Am3*xc;
freqdev= 1*(fm/Am1); %Caso beta=1
mod1 = fmmod(xc1,fc,fs,freqdev);
freqdev= 1*(fm/Am2);
mod2 = fmmod(xc2,fc,fs,freqdev);
freqdev= 1*(fm/Am3);
mod3 = fmmod(xc3,fc,fs,freqdev);
MSG1 = fftplot(mod1,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=1/ Am=1');
MSG2 = fftplot(mod2,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=1/Am=10');
MSG3 = fftplot(mod3,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=1/Am=20');

freqdev= 2*(fm/Am1); %caso beta=2
mod1 = fmmod(xc1,fc,fs,freqdev);
freqdev= 2*(fm/Am2);
mod2 = fmmod(xc2,fc,fs,freqdev);
freqdev= 2*(fm/Am3);
mod3 = fmmod(xc3,fc,fs,freqdev);
MSG1 = fftplot(mod1,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=2/Am=1');
MSG2 = fftplot(mod2,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=2/Am=10');
MSG3 = fftplot(mod3,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=2/Am=20');

freqdev= 5*(fm/Am1); %caso beta=5
mod1 = fmmod(xc1,fc,fs,freqdev);
freqdev= 5*(fm/Am2);
mod2 = fmmod(xc2,fc,fs,freqdev);
freqdev= 5*(fm/Am3);
mod3 = fmmod(xc3,fc,fs,freqdev);
MSG1 = fftplot(mod1,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=5/Am=1');
MSG2 = fftplot(mod2,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=5/Am=10');
MSG3 = fftplot(mod3,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=5/Am=20');


fm1=300; %Se varia la frecuencia del tono manteniendo constante la amplitud
fm2=500;
fm3=1000;
xc1 = Am*cos(2*pi*fm1*t);
xc2 = Am*cos(2*pi*fm2*t);
xc3 = Am*cos(2*pi*fm3*t);
freqdev= 1*(fm1/Am); %caso beta=1
mod1 = fmmod(xc1,fc,fs,freqdev);
freqdev= 1*(fm2/Am);
mod2 = fmmod(xc2,fc,fs,freqdev);
freqdev= 1*(fm3/Am);
mod3 = fmmod(xc3,fc,fs,freqdev);
MSG1 = fftplot(mod1,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=1/Fm=300');
MSG2 = fftplot(mod2,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=1/Fm=500');
MSG3 = fftplot(mod3,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=1/Fm=1000');

freqdev= 2*(fm1/Am); %caso beta=2
mod1 = fmmod(xc1,fc,fs,freqdev);
freqdev= 2*(fm2/Am);
mod2 = fmmod(xc2,fc,fs,freqdev);
freqdev= 2*(fm3/Am);
mod3 = fmmod(xc3,fc,fs,freqdev);
MSG1 = fftplot(mod1,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=2/Fm=300');
MSG2 = fftplot(mod2,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=2/Fm=500');
MSG3 = fftplot(mod3,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=2/Fm=1000');

freqdev= 5*(fm1/Am); %Caso beta=5
mod1 = fmmod(xc1,fc,fs,freqdev);
freqdev= 5*(fm2/Am);
mod2 = fmmod(xc2,fc,fs,freqdev);
freqdev= 5*(fm3/Am);
mod3 = fmmod(xc3,fc,fs,freqdev);
MSG1 = fftplot(mod1,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=5/Fm=300');
MSG2 = fftplot(mod2,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=5/Fm=500');
MSG3 = fftplot(mod3,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para beta=5/Fm=1000');

y = msg(1); %Se utiliza el mensaje del arch1
figure
plot (y);
grid on;
xlabel('Tiempo [s]'), ylabel('Amplitud'), title('Señal en el dominio temporal');
arch1 = fftplot(y,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro');

W=1000;
freqdev= 1*(W); %caso igual a 1
mod1 = fmmod(y,fc,fs,freqdev);
freqdev= 5*(W); %caso igual a 5
mod2 = fmmod(y,fc,fs,freqdev);
freqdev= 10*(W); %caso igual a 10
mod3 = fmmod(y,fc,fs,freqdev);
MSG1 = fftplot(mod1,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para delta=1');
MSG2 = fftplot(mod2,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para delta=5');
MSG3 = fftplot(mod3,fs);
grid on;
xlabel('Frecuencia [Hz]'), ylabel('Amplitud'), title('Magnitud del espectro para delta=10');


