f1=@(z) 1-z;
f3=@(r) r+2;
syms zeta;
f2=@(z) int(f1(z)*zeta*f3(zeta),zeta,0,z);
f2(0.5)