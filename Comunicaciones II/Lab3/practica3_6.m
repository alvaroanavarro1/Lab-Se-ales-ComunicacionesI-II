EbNo_dB_array = 3:0.5:6.5;

NSIMB_array_Antipoda = [4385, 5882, 7936, 11235, 16666, 25641, 41666, 71428];
Pe_teo_Antipoda = [0.0228, 0.017, 0.0126, 0.0089, 0.006, 0.0039, 0.0024, 0.0014];
Pe_exp_Antipoda = [0.0219, 0.0155, 0.0125, 0.0078, 0.0050, 0.0032, 0.0022, 0.0014];

NSIMB_array_Ortogonal = [1265, 1497, 1754, 2150, 2631, 3333, 4347, 5747];
Pe_teo_Ortogonal = [0.079, 0.0668, 0.057, 0.0465, 0.038, 0.03, 0.023, 0.0174];
Pe_exp_Ortogonal = [0.0741, 0.0625, 0.0539, 0.0449, 0.0370, 0.0289, 0.0219, 0.0152];

figure();
plot(EbNo_dB_array, Pe_exp_Antipoda, EbNo_dB_array, Pe_teo_Antipoda, EbNo_dB_array, Pe_exp_Ortogonal, EbNo_dB_array, Pe_teo_Ortogonal);
legend('Pe Antípoda Experimental','Pe Antípoda Teórico','Pe Ortogonal Experimental','Pe Ortogonal Teórico');
ylabel('Pe')
xlabel('Eb/No')
title('Probabilidad de error para distintos valores de Eb/No (Antípoda y Ortogonal)');
