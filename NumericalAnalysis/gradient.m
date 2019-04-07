function [x,k,t]=gradient(A,b,N,a0,er,x0)
tic
n=size(A,1);
x0=x0(:);
x=zeros(n,1);
b=b(:);
for k=1:N
    x=x0-a0*(A*x0-b);
    err=norm(A*x-b);
    if err<=er
        break;
    end
    x0=x;
end
t=toc;