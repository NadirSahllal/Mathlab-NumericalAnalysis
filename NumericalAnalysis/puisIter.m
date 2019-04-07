function [x,my]=puisIter(A,x0,er,Nmax)
x=x0/norm(x0);
x=x(:);
for k=1:Nmax;
    y=A*x;
    my=dot(y,x);
    x=y/sqrt(dot(y,y));
    if norm(A*x -my*x)<er
        break;
    end;

end;