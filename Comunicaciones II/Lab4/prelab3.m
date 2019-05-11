clear

%Código Hamming (7,4)
m = 3;          % Bits del mensaje              -> 3
n=2^m - 1;      % Bits de la palabra codificada -> 7
k=2^m - m- 1;   % Bits de paridad               -> 4

[H,G]=hammgen(m);  %Genera la matriz G y H usando metodo de hamming para
                   %indice de codigo m, en este caso m = 3                  

% Codificación de 1 mensaje
disp('Codificación de 1 grupo de mensaje')
disp('Mensaje')
msg = [1 0 1 0]                         % Mensaje
disp('Mensaje Codificado')
code = encode(msg,n,k,'hamming/binary') % Mensaje codificado 

disp('Se agrega un error al segundo Bit del mensaje codificado')
code_error1 = [0     0     1     1     0     0     0]
disp('Mensaje decodificado')
msg1=decode(code_error1,n,k,'hamming/binary') %decodifica el mensaje 

disp('Se agregan 2 errores, en las posiciones 2 y 6')
code_error2 = [0     1     1     1     0     0     0]
disp('Mensaje decodificado')
msg2=decode(code_error2,n,k,'hamming/binary') %decodifica el mensaje 

% Codificación de 1 grupo de mensajes mensaje
disp('Codificación de 1 grupo de mensajes')
disp('Matriz de Mensajes')
msg = randi([0,1],4,k) % Secuencia mensajes aleatorio de tamaño 16xk
disp('Matriz de Mensajes Codificados')
code = encode(msg,n,k,'hamming/binary')    %palabras codigo
disp('Decodificación de una matriz de mensajes codificados')
msg_decoded = decode(code,n,k,'hamming/binary')