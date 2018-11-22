
function [y_A, y_B, y_C, y_D, y_E] = receptor(msg_RF, flo, freqdev, W_IF, W, fs)
    
    t = 0:1/fs:824999/fs;
    fif = 14000;
    fc = flo - fif;
    W_RF = 5000;
    f3dB1_RF = fc - W_RF/2;
    f3dB2_RF = fc + W_RF/2;
    RF = fdesign.bandpass('N,F3dB1,F3dB2', 4, f3dB1_RF, f3dB2_RF, fs);
    RF = design(RF, 'butter');
    y_A = filter(RF, msg_RF);       % Obtener y_A
	y_B = y_A .* cos(2*pi*flo*t);   % Obtener y_B
    f3dB1_IF = fif - W_IF/2;        % Frecuencia de corte del inicial del filtro IF
    f3dB2_IF =  fif + W_IF/2;       % Frecuencia de corte final del filtro IF
	IF = fdesign.bandpass('N,F3dB1,F3dB2', 4, f3dB1_IF, f3dB2_IF, fs); 
    IF = design(IF, 'butter');
    
    y_C = filter(IF, y_B);      % Obtener y_C
    y_D = fmdemod(y_C, fif, fs, freqdev);       % Obtener y_D
    LPF = fdesign.lowpass('N,F3dB', 4, W, fs);
    LPF = design(LPF, 'butter');
    
    y_E = filter(LPF, y_D);     % Obtener y_E
end
