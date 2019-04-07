function [X,k,t]=BB(X,er,Nmax)
k=1;

tic
while k<=Nmax
    Fx=F(X);
    if norm(Fx)<=er
        break;
    end
    if k==1
        alpha=1;
    else
    alpha=(norm(X-X_)^2)/dot(X-X_,Fx-Fx_);
    end

    X_=X;
    Fx_=Fx;
    X=X-alpha*Fx;
    k=k+1;
end
t=toc;
