close all
clear
clc

curve=load('digitized_curve.csv');


pres=curve(:,1);
disp=curve(:,2);





a =      -3.347;
b =    0.008726;
c =       3.196;
d =     -0.1191;

smooth = a*exp(b*pres) + c*exp(d*pres);



hold on

plot(pres,disp,'-o',pres,smooth,'-o')
legend('points','smoothed via exponetial')

%% plot vertical lines
hold on





f=@(x) a*exp(b*x) + c*exp(d*x)