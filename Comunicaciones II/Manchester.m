function [t,x,fs] = Manchester(bits, bitrate, Amp)

T = length (bits)/bitrate;
n= 500;
N = n*length(bits);
dt= T/N;
fs = 1/dt;
t = 0:dt:T;
x = zeros(1,length(t));
for i = 0 :(length(bits)-1)
    if bits(i+1) ==1;
        x(i*n+1 :(i+0.5)*n) = Amp;
        x((i+0.5)*n+1 :(i+1)*n) = -Amp;
    else
        x(i*n+1 :(i+0.5)*n) = -Amp;
        x((i+0.5)*n+1 :(i+1)*n) = Amp;
    end
end
        

end

