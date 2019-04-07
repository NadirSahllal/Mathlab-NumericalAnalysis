%function [X,k,t]=PtFixeN(G,X0,er,Nmax)
G=input('enter G');
tic
X0=X0(:);
for k=1:Nmax
    X=feval(G,X0);
    X=X(:);
    if norm(X-X0)<er
        break
    end
    X0=X;
end
t=toc;