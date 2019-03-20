% EC1482 Laboratorio de Comunicaciones Digitales
% Versi�n 2003
% Simulaciones Computarizadas - PRACTICA 1
% Autor: Prof. Renny E. Badra, Ph.D.

%EC3423. Comunicaciones II
%Practica 3. Trimestre enero-marzo 2007

close all;
clear; format compact;
%%%% Constelacion Binaria
CONST_Antipoda=[1 -1];
CONST_Ortogonal=[1 0];

for index_ = 1:2

    if(index_==1)
        CONST=CONST_Antipoda;
    else
        CONST=CONST_Ortogonal;
    end

    %%%% Personalizaci�n de la simulacion
    C1=1310968; % n�mero de carnet del integrante 1
    C2=1310842; % n�mero de carnet del integrante 2

    %%%% Par�metros B�sicos
    j=sqrt(-1);
    NMPS=2; %n�mero de muestras por s�mbolo (entero, m�nimo 2)
    NSIMB=5000; %n�mero de s�mbolos (entero)
    NNIV=length(CONST); %n�mero de niveles de cada s�mbolo
    NBPS=length(dec2bin(NNIV))-1; %n�mero de bits por s�mbolo
    CONST=sqrt(NBPS)*CONST/sqrt(CONST*CONST'/NNIV); % Normalizar para tener Eb=1

    %%%% Inicializaci�n de arreglos y escalares
    rand('state',C1); randn('state',C2); % inicializaci�n de los generadores seudoaleatorios
    BUFF_SZ=20; %tama�o del buffer de simbolos enviados
    TSIMB=zeros(BUFF_SZ,1); %buffer de s�mbolos enviados
    CBE=0; CSE=0; %Contadores de bits y s�mbolos errados
    PR=0; PSEN=0;

    %%%% Filtro de conformaci�n de pulsos
    FCA=firrcos(10*NMPS,.5,.25,NMPS);  %Filtro coseno alzado alfa=25%
    FCA1(1:5*NMPS+1)=FCA(5*NMPS+1:10*NMPS+1); FCA1(NMPS*5+1:NMPS*10)=FCA(1:5*NMPS);
    FCA1=ifft(sqrt(abs(fft(FCA1)))); %Raiz cuadrada
    FCA(5*NMPS+1:10*NMPS+1)=FCA1(1:5*NMPS+1); FCA(1:5*NMPS)=FCA1(NMPS*5+1:NMPS*10);
    FCA=real(FCA.'/sqrt(abs(FCA*FCA'))); %normalizaci�n

    %%%% Ajuste del Eb/No
    EbNo_dB=4; %EbNo en dB
    EbNo=10^(EbNo_dB/10); %Eb/No
    VR=(1/EbNo); %Varianza del ruido
    DSR=sqrt(VR/2) %Desviaci�n est�ndar de cada componente I,Q del ruido
    
    if(index_==1)
        DSR_Antipoda_Programa = DSR;
    else
        DSR_Ortogonal_Programa = DSR;
    end
    %%%% Registros temporales
    rg1=zeros(NMPS*10+1,1); %salida del conformador de pulsos del transmisor
    rg2=zeros(NMPS*11+1,1); %salida del conformador de pulsos del receptor

    %%%% Lazo central empieza aqu�
    for nsimb=1:NSIMB

    %%%% Generaci�n del caudal de s�mbolos
    for k=BUFF_SZ:-1:2; TSIMB(k)=TSIMB(k-1); end
    TSIMB(1)=floor(NNIV*rand);
    TSEN=CONST(TSIMB(1)+1); %se�al transmitida

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

    %%%% Extracci�n de la Se�al Recibida
    if nsimb >= 30 & nsimb < 130
    Rsen((nsimb-30)*NMPS+1:(nsimb-29)*NMPS)=real(flipud(rg2(NMPS*10:NMPS*11-1)));
    end

    %%%% Detector
    if nsimb>=10
    DSEN=rg2(NMPS*10); %se�al detectada
    if nsimb<5000; Dsen(nsimb-9)=real(DSEN); end; %extracci�n de la se�al a detectar
    X1(nsimb-9)=DSEN;
    [x1,DSIMB]=min(abs(DSEN*ones(size(CONST))-CONST)); DSIMB=DSIMB-1; %s�mbolo detectado
    CSE=CSE+abs(sign(DSIMB-TSIMB(10))); % contador de simbolos errados
    end
    end

    CBE=CSE; % bits errados, constelaci�n binaria
    %disp('Tasa de Errores de Bit='); 
    Pe = CSE/(NSIMB-10);
    
    if(index_==1)
        Dsen_Antipoda = Dsen;
    else
        Dsen_Ortogonal = Dsen;
    end
end

disp('Ant�poda');
figure(1);
[Y,X]=hist(Dsen_Antipoda, 50);
X = X(1:25)
Y = Y(1:25)
hist(Dsen_Antipoda, 50);
title('Histograma Dsen Ant�poda Eb/No(dB)=4 NMPS = 2 y NSIMB = 5000');

disp('Ortogonal');
figure(2);
[Y,X]=hist(Dsen_Ortogonal, 50);
X = X(1:25)
Y = Y(1:25)
hist(Dsen_Ortogonal, 50);
title('Histograma Dsen Ortogonal Eb/No(dB)=4 NMPS = 2 y NSIMB = 5000');

for index_ = 1:2

    if(index_==1)
        CONST=CONST_Antipoda;
    else
        CONST=CONST_Ortogonal;
    end

    %%%% Personalizaci�n de la simulacion
    C1=1310968; % n�mero de carnet del integrante 1
    C2=1310842; % n�mero de carnet del integrante 2

    %%%% Par�metros B�sicos
    j=sqrt(-1);
    NMPS=2; %n�mero de muestras por s�mbolo (entero, m�nimo 2)
    NSIMB=5000; %n�mero de s�mbolos (entero)
    NNIV=length(CONST); %n�mero de niveles de cada s�mbolo
    NBPS=length(dec2bin(NNIV))-1; %n�mero de bits por s�mbolo
    CONST=sqrt(NBPS)*CONST/sqrt(CONST*CONST'/NNIV); % Normalizar para tener Eb=1

    %%%% Inicializaci�n de arreglos y escalares
    rand('state',C1); randn('state',C2); % inicializaci�n de los generadores seudoaleatorios
    BUFF_SZ=20; %tama�o del buffer de simbolos enviados
    TSIMB=zeros(BUFF_SZ,1); %buffer de s�mbolos enviados
    CBE=0; CSE=0; %Contadores de bits y s�mbolos errados
    PR=0; PSEN=0;

    %%%% Filtro de conformaci�n de pulsos
    FCA=firrcos(10*NMPS,.5,.25,NMPS);  %Filtro coseno alzado alfa=25%
    FCA1(1:5*NMPS+1)=FCA(5*NMPS+1:10*NMPS+1); FCA1(NMPS*5+1:NMPS*10)=FCA(1:5*NMPS);
    FCA1=ifft(sqrt(abs(fft(FCA1)))); %Raiz cuadrada
    FCA(5*NMPS+1:10*NMPS+1)=FCA1(1:5*NMPS+1); FCA(1:5*NMPS)=FCA1(NMPS*5+1:NMPS*10);
    FCA=real(FCA.'/sqrt(abs(FCA*FCA'))); %normalizaci�n

    %%%% Ajuste del Eb/No
    EbNo_dB=8; %EbNo en dB
    EbNo=10^(EbNo_dB/10); %Eb/No
    VR=(1/EbNo); %Varianza del ruido
    DSR=sqrt(VR/2) %Desviaci�n est�ndar de cada componente I,Q del ruido
    
    if(index_==1)
        DSR_Antipoda_Programa = DSR;
    else
        DSR_Ortogonal_Programa = DSR;
    end
    %%%% Registros temporales
    rg1=zeros(NMPS*10+1,1); %salida del conformador de pulsos del transmisor
    rg2=zeros(NMPS*11+1,1); %salida del conformador de pulsos del receptor

    %%%% Lazo central empieza aqu�
    for nsimb=1:NSIMB

    %%%% Generaci�n del caudal de s�mbolos
    for k=BUFF_SZ:-1:2; TSIMB(k)=TSIMB(k-1); end
    TSIMB(1)=floor(NNIV*rand);
    TSEN=CONST(TSIMB(1)+1); %se�al transmitida

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

    %%%% Extracci�n de la Se�al Recibida
    if nsimb >= 30 & nsimb < 130
    Rsen((nsimb-30)*NMPS+1:(nsimb-29)*NMPS)=real(flipud(rg2(NMPS*10:NMPS*11-1)));
    end

    %%%% Detector
    if nsimb>=10
    DSEN=rg2(NMPS*10); %se�al detectada
    if nsimb<5000; Dsen(nsimb-9)=real(DSEN); end; %extracci�n de la se�al a detectar
    X1(nsimb-9)=DSEN;
    [x1,DSIMB]=min(abs(DSEN*ones(size(CONST))-CONST)); DSIMB=DSIMB-1; %s�mbolo detectado
    CSE=CSE+abs(sign(DSIMB-TSIMB(10))); % contador de simbolos errados
    end
    end

    CBE=CSE; % bits errados, constelaci�n binaria
    %disp('Tasa de Errores de Bit='); 
    Pe = CSE/(NSIMB-10);
    
    if(index_==1)
        Dsen_Antipoda = Dsen;
    else
        Dsen_Ortogonal = Dsen;
    end
end


disp('Ant�poda');
figure(3);
[Y,X]=hist(Dsen_Antipoda, 50);
X = X(1:25)
Y = Y(1:25)
hist(Dsen_Antipoda, 50);
title('Histograma Dsen Ant�poda Eb/No(dB)=8 NMPS = 2 y NSIMB = 5000');

disp('Ortogonal');
figure(4);
[Y,X]=hist(Dsen_Ortogonal, 50);
X = X(1:25)
Y = Y(1:25)
hist(Dsen_Ortogonal, 50);
title('Histograma Dsen Ortogonal Eb/No(dB)=8 NMPS = 2 y NSIMB = 5000');