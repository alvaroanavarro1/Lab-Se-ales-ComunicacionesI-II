
%%Alvaro Navarro 13-10968
%% 3.2h
x_RF = mensaje('arch2');       % Seleccionar mensaje del archivo 2.
W = 1600;
fc1 = 20000;
fc2 = 35000;
fif = 14000;
flo1 = fc1 + fif;
flo2 = fc2 + fif;
W_IF = 2*1055;                
freqdev = 1000;
fs = 110250;
N = 825000;
t = 0: 1/fs: (N-1)*(1/fs);

% Rreceptor
[y_A1, y_B1, y_C1, y_D1, y_E1] = receptor(x_RF, flo1, freqdev, W_IF, W, fs);
[y_A2, y_B2, y_C2, y_D2, y_E2] = receptor(x_RF, flo2, freqdev, W_IF, W, fs);

%Receptor mensaje 1
fftplot(y_A1, fs);
title('Mensaje 1 Punto A');
xlabel('f[Hz]');
grid on;

fftplot(y_B1, fs);
title('Mensaje 1 Punto B');
xlabel('f[Hz]');
grid on;

fftplot(y_C1, fs);
title('Mensaje 1 Punto C');
xlabel('f[Hz]');
grid on;

fftplot(y_D1, fs);
title('Mensaje 1 Punto D');
xlabel('f[Hz]');
grid on;

fftplot(y_E1, fs);
title('Mensaje 1 Punto E');
xlabel('f[Hz]');
grid on;

%Receptor mensaje 2
fftplot(y_A2, fs);
title('Mensaje 2 Punto A');
xlabel('f[Hz]');
grid on;

fftplot(y_B2, fs);
title('Mensaje 2 Punto B');
xlabel('f[Hz]');
grid on;

fftplot(y_C2, fs);
title('Mensaje 2 Punto C');
xlabel('f[Hz]');
grid on;

fftplot(y_D2, fs);
title('Mensaje 2 Punto D');
xlabel('f[Hz]');
grid on;

fftplot(y_E2, fs);
title('Mensaje 2 Punto E');
xlabel('f[Hz]');
grid on;

%% 3.2i
% Demodulacion de los mensajes detectados
 y1 = fmdemod(y_A1, fc1, fs, freqdev);
 y2 = fmdemod(y_A2, fc2, fs, freqdev);

 
%% 3.2j
% Reproduccion de las emisoras por separado
sound(y_E1, fs);
pause;

sound(y_E2, fs);
pause;

