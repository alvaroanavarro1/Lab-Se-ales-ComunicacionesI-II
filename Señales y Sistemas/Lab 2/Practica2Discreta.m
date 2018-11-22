n = [-10:10];
x = delta_me(-2,-10,10)+2*delta_me(-1,-10,10)+3*delta_me(0,-10,10)+3*delta_me(1,-10,10)+2*delta_me(2,-10,10)+delta_me(3,-10,10);
subplot(3,1,1),stem(n,x);

z = -delta_me(-7,-10,10)-delta_me(-6,-10,10)-delta_me(-5,-10,10)+delta_me(-4,-10,10)+delta_me(-3,-10,10)+delta_me(-2,-10,10)-delta_me(2,-10,10)-delta_me(3,-10,10)-delta_me(4,-10,10)+delta_me(5,-10,10)+delta_me(6,-10,10)+delta_me(7,-10,10)
subplot(3,1,2),stem(n,z);