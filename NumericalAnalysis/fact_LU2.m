function [L,U]=fact_LU2(A)
n=size(A,1);
L=eye(n);
for k=1:n-1
    Ck=1/A(k,k)*A(k+1:n,k);
    Ek=eye(n);    
    Ek(k+1:n,k)=-Ck;
    Bk=eye(n);
    Bk(k+1:n,k)=Ck;
    L=L*Bk;
    A=Ek*A;
end
U=A;