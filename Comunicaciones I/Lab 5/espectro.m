%% Cuantificacion Uniforme y No Uniforme. LAB5 EC2422 (Comunicaciones I) Universidad Sim�n Bol�var
%Armando Longart 10-10844
%Yurjelis Brice�o 11-11371
%% 

function [X, f] = espectro(x, Fs)

    %V�a 1
%     X=fftshift(fft(x))/length(x);
%     L=length(x);
%     f=(-L/2:L/2-1)*Fs/L;
    
    %V�a 2
    X=fftshift(fft(x));
    N=length(X);
    MX=X/N;
    f=-Fs/2:Fs/N:Fs/2-Fs/N;
    
    
%     %V�a 3
%     X=fftshift(fft(x));
%     MX=abs(X); % Se busca el modulo de X
%     N=length(MX);
%     MX=MX/N;
%     f=-fs/2:fs/N:fs/2-fs/N;
 

end