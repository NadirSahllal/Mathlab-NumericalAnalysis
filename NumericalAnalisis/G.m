 function Y=G(X)
% Y(1)=(1-X(2))/2;
% Y(2)=sqrt(1-X(1)^2);
% Y(1)=(1-X(2))/2;
% Y(2)=-sqrt(1-X(1)^2);
Y(1)=-1/81*cos(X(1))+1/9*X(2)^2+1/3*sin(X(3));
Y(2)=1/3*sin(X(1))+1/3*cos(X(3));
Y(3)=-1/9*cos(X(1))+1/3*X(2)+1/6*sin(X(3));