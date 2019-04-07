function x=TrilSol(A,b)
%résoudre Ax=b avec A triangulaire inf
n=size(A,1);
x=zeros(n,1);

for i=1:n
    t=b(i);
    for j=1:i-1
        t=t-A(i,j)*x(j);
    end
    x(i)=(t/A(i,i));
end