clear
Nmax=100;
er=1e-10;
X0=input('donner une estimation initiale');
syms x1 x2
F=[exp(x1^2+ x2^2)-1;exp(x1^2 - x2^2)-1];
v=[x1 x2];
J_f=jacobian(F,v);
tic
for k=1:Nmax
    x1=X0(1);x2=X0(2);
    Jv=subs(J_f); Fv=subs(F);
    [L,U]=lu(Jv);
    Y=TrilSol(L,Fv);
    X=TriuSol(U,Y);
    if norm(X-X0)<er
        disp('sol est')
        disp(X)
        disp('Nbr iter est')
        disp(k)
        break
    end
    X0=X;
    if k==Nmax
        disp('sol non atteinte')
    end
end
t=toc;
disp('tps exec')
disp(t)
