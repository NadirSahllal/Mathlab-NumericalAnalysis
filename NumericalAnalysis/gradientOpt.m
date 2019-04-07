function [x,k,t]=gradientOpt(A,b,N,er,x0)
tic
%n=size(A,1);
x0=x0(:);
b=b(:);
x(:,1)=x0;
for k=1:N
    res=A*x(:,k)-b;
    Nres=norm(res);
    if Nres<=er
        break;
    else
        a0=norm(res)^2/dot(res,A*res);
        x(:,k+1)=x(:,k)-a0*res;
    end
end
t=toc;