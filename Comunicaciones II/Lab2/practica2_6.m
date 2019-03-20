EbNo_dB_array = 2:1:9;

BER_Exp_C1 = [0.2241, 0.1643, 0.1316, 0.0944, 0.0524, 0.0269, 0.0121, 0.0045];
BER_Teo_C1 = [0.2112, 0.1586, 0.1142, 0.0768, 0.0466, 0.0258, 0.0120, 0.005];

BER_Exp_C2 = [0.2169, 0.1510, 0.1084, 0.0783, 0.0385, 0.0250, 0.0118, 0.0020];
BER_Teo_C2 = [0.2576, 0.2235, 0.1865, 0.1512, 0.1188, 0.0885, 0.0618, 0.0402];

figure();
plot(EbNo_dB_array, BER_Exp_C1, EbNo_dB_array, BER_Teo_C1, EbNo_dB_array, BER_Exp_C2, EbNo_dB_array, BER_Teo_C2);
legend('Pes C1 Experimental','Pes C1 Teórico','Pes C2 Experimental','Pes C2 Teórico');
ylabel('Pes');
xlabel('Eb/No');
title('Tasa de Errores de Símbolo para distintos valores de Eb/No (Const I)');