% Hamming code (31,26)
m=3; 
n=2^m - 1;      %31
k=2^m - m- 1;   %26

[H,G]=hammgen(m);

P = G(:,1:m)

disp('Tasa de Código')
tasa = k/n
disp('Incremento porcentual de la velocidad')
incremento = tasa*100