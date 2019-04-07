function R=cholesky(A)
n=size(A,1);

R(1,1)=sqrt(A(1,1));
for i=2:n
    R(i,1)=A(1,i)/R(1,1);
end
for j=2:n
    s=0;
    for k=1:j-1
        s=s+R(j,k)^2;
    end
    R(j,j)=sqrt(A(j,j)-s);
    for i=j+1:n
        t=0;
        for k=1:j-1
            t=t+R(i,k)*R(j,k);
        end
        R(i,j)=(A(j,i)-t)/R(j,j);        
    end
end