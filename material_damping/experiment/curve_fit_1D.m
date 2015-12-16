close all
%clear all

% only data lines, no comments
data=load('Damping_elasticpanel_magnetrelease_13mbar_0.55-0.65.dat');
Xdata=data(:,1);
Ydata=data(:,2);

% %% plot full oscillation
% data=load('full_data.dat');
% Xdata=data(:,1);
% Ydata=data(:,2);
% Ydata=Ydata-4.760922074265793;
% EXP=exp(-18.393086282426186.*(Xdata-0.38))+0.016;
% plot(Xdata,Ydata,Xdata,EXP)
% axis([0.4 1.0 -0.4,0.2])
% legend('oscilation','damping coefficient of 18.4')
% xlabel('time');
% ylabel('maesured displacement in z direction');
% title('damping study with vacuum cavity');
% 
% %% plot oscillation between 0.60 and 0.65
% data=load('Damping_elasticpanel_magnetrelease_13mbar_0.6-0.65.dat');
% Xdata=data(:,1);
% Ydata=data(:,2);
% Ydata=Ydata-4.760922074265793;
% EXP=exp(-18.393086282426186.*(Xdata-0.38))+0.016;
% plot(Xdata,Ydata,Xdata,EXP)
% axis([0.6 1.0 -0.4,0.2])
% legend('oscilation','damping coefficient of 18.4')
% xlabel('time');
% ylabel('maesured displacement in z direction');
% title('damping study with vacuum cavity');


%pause(100)

%data=load('dz39_1_short.dat');
%Xdata=data(:,3);
%Ydata=data(:,1);

% x(1): offset
% x(2): amplitude
% x(3): phase
% x(4): frequenz
% x(5): daempfung
H = @(x,xdata) x(1).*xdata./xdata+x(2).*exp(-x(5).*xdata).*cos(x(4).*xdata+x(3));
% startwert: platte im vakuuum
 X0=100*[0.047434201872717,   0.835226733383034 ,  0.231870089680025 ,4.534505850176174,   0.128926300389358 ]; % start wert für verschiebung
% X0=100*[0.047434201872717,   0.835226733383034 ,  0.231870089680025 ,4.534505850176174,   0.128926300389358 ];
% X0=[0,-800,pi,2*pi*100,0.00001] % druck
    

%[A,No] = lsqcurvefit(H,X0,Xdata,Ydata)

%X0=[0,0.01,0,2*pi*100,0.00001]; % start wert für verschiebung
%Ydata=data(:,1); % spalte 1: verschiebung , spalte 2: druck 
[B,No2] = lsqcurvefit(H,X0,Xdata,Ydata)

syms t
f(t) = B(1)+B(2)*exp(-B(5)*t)*cos(B(4)*t+B(3));
f(t) = B(2)*exp(-B(5)*t)*cos(B(4)*t+B(3));


XDataFit=linspace(Xdata(1),Xdata(end),1000);
YDataFit=B(1)+B(2).*exp(-B(5).*XDataFit).*cos(B(4).*XDataFit+B(3));

plot(Xdata,Ydata,XDataFit,YDataFit,'m')
legend('oscilation','damping coefficient of 17')
xlabel('time');
ylabel('maesured displacement in z direction');
axis([min(XData) max(XData) min(Ydata) max(Ydata)])
title('damping study with vacuum cavity');