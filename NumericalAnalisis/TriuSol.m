function x=TriuSol(A,b)
%r�soudre Ax=b avec A triangulaire sup
n=size(A,1);
x=zeros(n,1);
for i=n:-1:1
    t=b(i);
    for j=i+1:n
        t=t-A(i,j)*x(j);
    end
    x(i)=(t/A(i,i));
end