close all
clc
syms t n
A = [0 1 2];
f =[t -t+2];

f = sym(f);
T = max(A)-min(A);
Wo= 2*pi/(T)

Ao= 0;
for i=1:length(f)
    Ao = Ao + int(f(i), 't', A(i), A(i+1));
end
Ao = simple(Ao/T);

An= 0;
for i=1:length(f)
    An= An +int(f(i)*cos(n*Wo*t), A(i), A(i+1));
end
An= simple(2*An/T);

Bn=0;
for i=1:length(f)
    Bn=Bn+int(f(i)*sin(n*Wo*t), A(i), A(i+1));
end
Bn = simple (2*Bn/T);

An=char(An);
Bn=char(Bn);
An = simple(sym(strrep(char(An), 'sin(pi*n)','0')));
Bn = simple(sym(strrep(char(Bn), 'sin(pi*n)','0')));

An = simple(sym(strrep(char(An), 'cos(pi*n)','(-1)^n')));
Bn = simple(sym(strrep(char(Bn), 'cos(pi*n)','(-1)^n')));

An = simple(sym(strrep(char(An), 'sin(2*pi*n)','0')));
Bn = simple(sym(strrep(char(Bn), 'sin(2*pi*n)','0')));

An = simple(sym(strrep(char(An), 'cos(2*pi*n)','1')));
Bn = simple(sym(strrep(char(Bn), 'cos(2*pi*n)','1')));
%
disp('Ao')
pretty(Ao)
disp('An')
pretty(An)
disp('Bn')
pretty(Bn)

x = linspace(min(A), max(A), 1000);
fx = 0;
for i=1:length(A)-1
    if mod(i,2) == 1
        fx = fx+((x>=A(i))&(x<=A(i+1))).*subs(f(i),x);
    else
        fx = fx+((x>A(i))&(x<A(i+1))).*subs(f(i),x);
    end
end
plot(x, fx, 'linewidth', 2); hold on
plot(x+max(x)-min(x), fx, 'linewidth', 2)
plot(x-max(x)+min(x), fx, 'linewidth', 2)
plot([max(x) max(x)],[fx(1) fx(end)], 'linewidth', 2)
plot([min(x) min(x)],[fx(end) fx(1)], 'linewidth', 2)
grid on
xlabel('\bTIEMPO');
ylabel('\bAMPLITUD');
title('\bGRAFICA DE LA FUNCION');

