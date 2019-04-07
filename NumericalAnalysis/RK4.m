%function [T,U]=RK4(a,b,N,y0,y,f)
clc 
clear
close all
a=0;b=1;
N=input('Donner N ');
h=(b-a)/N;
T=a:h:b;
U=zeros(1,N+1);
Ys=zeros(1,N+1);
Err=zeros(1,N+1);
eq1='Dy=3*y-3*x';
y=dsolve(eq1,'y(0)=1','x');
y0=1;

U(1)=y0;
Ys(1)=y0;
for i=1:N
    %yi=feval(y,ti);
    %Z=[ti,yi];
    Z1=[T(i),U(i)];
    p1=fn(Z1);
    Z2=[T(i)+h/2,U(i)+h/2*p1];
    p2=fn(Z2);
    Z3=[T(i)+h/2,U(i)+h/2*p2];
    p3=fn(Z3);
    Z4=[T(i+1),U(i)+h/2*p3];
    p4=fn(Z4);
    
    U(i+1)=U(i)+h/6*(p1+2*p2+2*p3+p4);
    x=T(i+1);
    Ys(i+1)=eval(y);

    Err(i+1)=abs(U(i+1)-Ys(i+1));
end
subplot(2,1,1)
plot(T,U,'r.--')
grid
title('')
subplot(2,1,2)
plot(T,Ys,'k*-')