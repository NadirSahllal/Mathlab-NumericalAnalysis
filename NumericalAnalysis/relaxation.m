function [x,j,t]=relaxation(A,b,er,N,x0,w)
n=size(A,1);
d=diag(A);
x0=x0(:);
%x=zeros(n,1);
if prod(d)==0
    error('la diagonale de la matrice contient un élément nul')
end
tic
for j=1:N
    %1ere composante
    s=0;
    for k=2:n
        s=s+A(1,k)*x0(k);
    end
    x(1)=(1-w)*x0(1)-w/A(1,1)*(s-b(1));
    %composantes de 2 à n-1
    for i=2:n-1
        s=0;t=0;
        for k=1:i-1
            s=s+A(i,k)*x(k);
        end
        for k=i+1:n
            t=t+A(i,k)*x0(k);
        end
        x(i)=(1-w)*x0(i)-w/A(i,i)*(s+t-b(i));
    end
    %neme composante
    s=0;
    for k=1:n-1
        s=s+A(n,k)*x(k);
    end
    x(n)=(1-w)*x0(n)-w/A(n,n)*(s-b(n));  
    x=x(:)
    err=norm(x-x0);
    if err<er
        break
    end
    x0=x;
end
t=toc;
       