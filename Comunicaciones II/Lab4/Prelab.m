% codigo hamming
m=3; n=2^m - 1; k=2^m - m- 1;
% genera la matriz G y H usando metodo de hamming para indice de codigo m 
[H,G]=hammgen(m)
% secuencia mensaje aleatorio de tamaño 16 x k             
msg = rand(16,k); 
% palabras codigo
code= encode(msg,n,k,'hamming/binary');    
% se usa la palabra ejemplo 1110010
% Caso error en segunda posicion 1 bit 1010010 
codigo_e1 = [1 1 0 0 1 1 0];
% decodifica el mensaje 
msg_1 = decode(codigo_e1,n,k,'hamming/binary')
% Caso error en dos bits posicion 2 y 4  1011010
code_e2 = [1 1 0 1 1 1 0];
msg_2 = decode(code_e2,n,k,'hamming/binary')
