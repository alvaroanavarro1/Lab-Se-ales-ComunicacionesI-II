t = [-10:0.001:10];

subplot(3,1,1),plot(t,y);
T=2
a = rectpuls(t,T);
subplot(3,1,2), plot(t,a);