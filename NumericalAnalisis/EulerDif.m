function [X,Y]=EulerDif(a,b,N,y0)
X=zeros(1,N+1);
Y=zeros(1,N+1);
X(1)=a;
Y(1)=y0;
h=(b-a)/N;
for i=1:N
    Y(i+1)=Y(i)+h*firstode(X(i),Y(i));
    X(i+1)=X(i)+h;
end