% EC1482 Laboratorio de Comunicaciones Digitales
% Versión 2003
% Simulaciones Computarizadas - PRACTICA 1
% Autor: Prof. Renny E. Badra, Ph.D.

%EC3423. Comunicaciones II
%Practica 3. Trimestre enero-marzo 2007


clear; format compact;

CONST_Antipoda=[1 -1];
CONST_Ortogonal=[1 0];

for index_ = 1:2
    %%%% Constelacion Binaria
    if(index_==1)
        CONST=CONST_Antipoda;
    else
        CONST=CONST_Ortogonal;
    end
    %%%% Personalización de la simulacion
    C1=1310968; % número de carnet del integrante 1
    C2=1310842; % número de carnet del integrante 2

    %%%% Parámetros Básicos
    j=sqrt(-1);
    NMPS=20; %número de muestras por símbolo (entero, mínimo 2)
    NSIMB=503; %número de símbolos (entero)
    NNIV=length(CONST); %número de niveles de cada símbolo
    NBPS=length(dec2bin(NNIV))-1; %número de bits por símbolo
    CONST=sqrt(NBPS)*CONST/sqrt(CONST*CONST'/NNIV); % Normalizar para tener Eb=1

    %%%% Inicialización de arreglos y escalares
    rand('state',C1); randn('state',C2); % inicialización de los generadores seudoaleatorios
    BUFF_SZ=20; %tamaño del buffer de simbolos enviados
    TSIMB=zeros(BUFF_SZ,1); %buffer de símbolos enviados
    CBE=0; CSE=0; %Contadores de bits y símbolos errados
    PR=0; PSEN=0;

    %%%% Filtro de conformación de pulsos
    FCA=firrcos(10*NMPS,.5,.25,NMPS);  %Filtro coseno alzado alfa=25%
    FCA1(1:5*NMPS+1)=FCA(5*NMPS+1:10*NMPS+1); FCA1(NMPS*5+1:NMPS*10)=FCA(1:5*NMPS);
    FCA1=ifft(sqrt(abs(fft(FCA1)))); %Raiz cuadrada
    FCA(5*NMPS+1:10*NMPS+1)=FCA1(1:5*NMPS+1); FCA(1:5*NMPS)=FCA1(NMPS*5+1:NMPS*10);
    FCA=real(FCA.'/sqrt(abs(FCA*FCA'))); %normalización

    %%%% Ajuste del Eb/No
    EbNo_dB=100; %EbNo en dB
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

    %%%% Canal
    for k=1:NMPS; rg1(k)=rg1(k)+DSR*(randn+j*randn); end %agregar ruido

    %%%% Conformador de pulsos del receptor 
    for k=NMPS*11+1:-1:NMPS+1; rg2(k)=rg2(k-NMPS); end
    for k=1:NMPS; rg2(k)=0; end
    for k=NMPS:-1:1; rg2(k:k+10*NMPS)=rg2(k:k+10*NMPS)+rg1(k+9*NMPS+1)*FCA; end

    %%%% Extracción de la Señal Recibida
    if nsimb >= 30 & nsimb < 130
    Rsen((nsimb-30)*NMPS+1:(nsimb-29)*NMPS)=real(flipud(rg2(NMPS*10:NMPS*11-1)));
    end

    %%%% Detector
    if nsimb>=10
    DSEN=rg2(NMPS*10); %señal detectada
    if nsimb<5000; Dsen(nsimb-9)=real(DSEN); end; %extracción de la señal a detectar
    X1(nsimb-9)=DSEN;
    [x1,DSIMB]=min(abs(DSEN*ones(size(CONST))-CONST)); DSIMB=DSIMB-1; %símbolo detectado
    CSE=CSE+abs(sign(DSIMB-TSIMB(10))); % contador de simbolos errados
    end
    end

    CBE=CSE; % bits errados, constelación binaria
    disp('Tasa de Errores de Bit='); CSE/(NSIMB-10)
    if(index_==1)
        Rsen_Antipoda = Rsen(1:200);
    else
        Rsen_Ortogonal = Rsen(1:200);
    end
end

figure();
plot((1:1:200), Rsen_Antipoda, (1:1:200), Rsen_Ortogonal);
grid();
legend('Rsen Antípoda','Rsen Ortogonal')
ylabel('Rsen')
title('Rsen Antípoda y Ortogonal para NMPS=20, NSIMB=503, EbNo_dB=100');