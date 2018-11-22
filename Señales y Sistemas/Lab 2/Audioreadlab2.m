Fs = 44100;
[y,Fs] = audioread('voz_limpia.wav');
tfinal=14;
Ts= 1/Fs;
t=[0:1/Fs:tfinal-Ts];

entradavoz = [t' y];
%sound(Salida,Fs);


subplot(2,1,1), plot(t,y);
title('Entrada vs Tiempo');
subplot(2,1,2), plot(t,Salida);
title('Salida vs Tiempo');

entradavoz2 = [t' Salida];

subplot(2,1,1), plot(t,Salida);
title('Entrada vs Tiempo 2');
subplot(2,1,2), plot(t,Salida2);
title('Salida vs Tiemp 2');
%sound(Salida2,Fs);