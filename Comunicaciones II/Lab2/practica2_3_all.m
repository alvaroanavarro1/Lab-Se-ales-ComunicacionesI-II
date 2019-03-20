% EC3423 Comunicaciones II
% Trimestre septiembre diciembre 2006. 
% PRACTICA 2
% Autor: Prof. Renny E. Badra, Ph.D.

clear; sq2=sqrt(2)/2; j=sqrt(-1);
%%%% Constelacion
CONST=[1+j 0.5 j -0.5 -1+j -1-j -j 1-j];

%%%% Personalización de la simulacion
C1=1310968; % número de carnet del integrante 1
C2=1310842; % número de carnet del integrante 2

%%%% Parámetros Básicos
NMPS=2; %número de muestras por símbolo (entero, mínimo 2)
NSIMB=200; %número de símbolos (entero)
NNIV=length(CONST); %número de niveles de cada símbolo
NBPS=log2(NNIV); %número de bits por símbolo
CONST=sqrt(NBPS)*CONST/sqrt(CONST*CONST'/NNIV); % Normalizar para tener Eb=1

%%%% Inicialización de arreglos y escalares
rand('state',C1); randn('state',C2); % inicializaci[on de los generadores seudoaleatorios
BUFF_SZ=20; %tamaño del buffer de simbolos enviados
TSIMB=zeros(BUFF_SZ,1); %buffer de símbolos enviados
CBE=0; CSE=0; %Contadores de bits y símbolos errados
PR=0; PSEN=0;

%%%% Filtro de conformación de pulsos
FCA=firrcos(10*NMPS,.5,.30,NMPS);  %Filtro coseno alzado alfa=30%
FCA1(1:5*NMPS+1)=FCA(5*NMPS+1:10*NMPS+1); FCA1(NMPS*5+1:NMPS*10)=FCA(1:5*NMPS);
FCA1=ifft(sqrt(abs(fft(FCA1)))); %Raiz cuadrada
FCA(5*NMPS+1:10*NMPS+1)=FCA1(1:5*NMPS+1); FCA(1:5*NMPS)=FCA1(NMPS*5+1:NMPS*10);
FCA=real(FCA.'/sqrt(abs(FCA*FCA'))); %normalización

EbNo_dB_array = [2,5,10,100];
EbNo_dB_array_len = size(EbNo_dB_array,2);

for index_ = 1:EbNo_dB_array_len
    %%%% Ajuste del Eb/No
    EbNo_dB=EbNo_dB_array(index_); %EbNo en dB
    EbNo=10^(EbNo_dB/10); %Eb/No
    VR=(1/EbNo); %Varianza del ruido
    DSR=sqrt(VR/2); %Desviación estándar de cada componente I,Q del ruido

    %%%% Registros temporales
    rg1=zeros(NMPS*10+1,1); %salida del conformador de pulsos del transmisor
    rg2=zeros(NMPS*11+1,1); %salida del conformador de pulsos del receptor

    %%%% Lazo central empieza aquí
    for nsimb=1:NSIMB

    %%%% Generación del caudal de símbolos
    for k=BUFF_SZ:-1:2; TSIMB(k)=TSIMB(k-1); end
    TSIMB(1)=floor(NNIV*rand);
    TSEN=CONST(TSIMB(1)+1); %señal transmitida

    %%%% Conformador de pulsos del transmisor
    for k=NMPS*10+1:-1:NMPS+1; rg1(k)=rg1(k-NMPS); end
    for k=1:NMPS; rg1(k)=0; end
    rg1=rg1+TSEN*FCA; 
    if nsimb<210 & nsimb>=10; Tsen((nsimb-10)*NMPS+1:(nsimb-9)*NMPS)=flipud(abs(rg1(NMPS*9:NMPS*10-1))); end

    %%%% Canal
    for k=1:NMPS; rg1(k)=rg1(k)+DSR*(randn+j*randn); end %agregar ruido

    %%%% Conformador de pulsos del receptor 
    for k=NMPS*11+1:-1:NMPS+1; rg2(k)=rg2(k-NMPS); end
    for k=1:NMPS; rg2(k)=0; end
    for k=NMPS:-1:1; rg2(k:k+10*NMPS)=rg2(k:k+10*NMPS)+rg1(k+9*NMPS+1)*FCA; end

    %%%% Extraer Señal Recibida
    if nsimb >= 30 & nsimb<130
    Rsen((nsimb-30)*NMPS+1:(nsimb-29)*NMPS)=flipud(rg2(NMPS*10:NMPS*11-1));
    end

    %%%% Detector
    if nsimb>=10
    DSEN=rg2(NMPS*10); %señal detectada
    if nsimb<5000; Dsen(nsimb-9)=DSEN; end; %extraer señal a detectar
    X1(nsimb-9)=DSEN;
    [x1,DSIMB]=min(abs(DSEN*ones(size(CONST))-CONST)); DSIMB=DSIMB-1; %símbolo detectado
    CSE=CSE+abs(sign(DSIMB-TSIMB(10))); % contador de simbolos errados
    end
    end

    figure();
    plot(Dsen,'.');
    title(num2str(EbNo_dB_array(index_)));
    %disp('Tasa de Errores de Simbolo='); 
    BER(index_)=CSE/(NSIMB-10);
end

BER
