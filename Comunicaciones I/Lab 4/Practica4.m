%%Alvaro Navarro 13-10968

%Actividad 5 Huffman
 H=[2.433832 1.829518 0.859188]; %Entropia
 NC=[0.854 0.7146 0.577];      %Bits Codificados
 P0=[0.75 0.85 0.95];            %Probabilidad de Ceros

figure(1);
plot(P0,H);
grid ON;
title('H vs P0  (Huffman)');
xlabel('P0');
ylabel('H');


figure(2);
plot(P0,NC);
grid ON;
title('NC vs P0 (Huffman)');
xlabel('P0');
ylabel('NC');

%%
%Actividad 8 run-lenght
NC1=[1.0869 0.8522 0.61513];

figure(3);
plot(P0,NC1);
grid ON;
title('NC vs P0 (run-lenght)');
xlabel('P0');
ylabel('NC');

%%
%Actividad 9 run-length

%m=2
NC2=[1.0728 0.94918 0.81818];

%m=4
NC4=[1.2028 0.84094 0.47332];

%m=5
NC5=[1.381 0.9196 0.40267];

%m=6
NC6=[1.5695 1.0427 0.39547];

figure(4);
plot(P0,NC2,'r',P0,NC4,'b',P0,NC5,'g',P0,NC6,'y');
grid ON;
title('NC vs P0 (run-lenght) distintos valores de m');
xlabel('P0');
ylabel('NC');
legend('m=2','m=4','m=5','m=6');

%%
  %                    Cuestionario

%1
figure(5);
plot(P0,NC,'r',P0,H,'b');
grid ON;
title('NC vs P0 (Huffman) longitud 3');
xlabel('P0');
ylabel('NC y H');
legend('NC','H');

%%
%2

%%
%3

figure(6);
plot(P0,NC2,'r',P0,NC1,'m',P0,NC4,'b',P0,NC5,'g',P0,NC6,'y');
grid ON;
title('NC vs P0 (run-lenght) varios valores de m');
xlabel('P0');
ylabel('NC');
legend('m=2','m=3','m=4','m=5','m=6');

%%
%4

figure(7);
plot(P0,NC,'ro-.',P0,NC1,'bo-.');
grid ON;
title('NC vs Po');
xlabel('P0');
ylabel('NC');
legend('Huffman','Run-Length');
