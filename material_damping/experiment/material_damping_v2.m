close all
clear
clc

numstep=1499;
timestep=0.15;

deltax=0.05;


lowid=1096;
highid=1399;

lowid=399;
highid=1499;


timedata=lowid:highid;
timedata=timedata
timedata=timedata*timestep/1000;


data=[];
for fileid=lowid:highid
  data=[data;csvread(strcat('/scratch/scheucher/workspace/baci_springfitting/transfer/results/oscillation_baci/data0.',num2str(fileid),'.csv'),1)];
end

plot(timedata,data(:,2),'m')
%legend('data simulation','curve with paramter 18','curve with parameter 15')
legend('simulated oscialation');
xlabel('time');
ylabel('center displacement');
title('simulation with Mdamp=0.038');
hold on


Xdata=timedata';
Ydata=data(:,2);

EXP=exp(-18.*timedata);
plot(timedata,EXP,'--k')

legend('simulated oscialation','bounding curve with theta=18');

pause(100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% x(1): offset
% x(2): amplitude
% x(3): phase
% x(4): frequenz
% x(5): daempfung
H = @(x,xdata) x(1).*xdata./xdata+x(2).*exp(-x(5).*xdata).*cos(x(4).*xdata+x(3));
% startwert: platte im vakuuum
% X0=100*[0.047434201872717,   0.835226733383034 ,  0.231870089680025 ,4.534505850176174,   0.128926300389358 ]; % start wert für verschiebung
 X0=100*[0.047434201872717,   0.835226733383034 ,  0.431870089680025 ,2.534505850176174,   0.128926300389358 ];
% X0=[0,-800,pi,2*pi*100,0.00001] % druck
    

%[A,No] = lsqcurvefit(H,X0,Xdata,Ydata)

%X0=[0,0.01,0,2*pi*100,0.00001]; % start wert für verschiebung
%Ydata=data(:,1); % spalte 1: verschiebung , spalte 2: druck 
[B,No2] = lsqcurvefit(H,X0,Xdata,Ydata)

syms t
f(t) = B(1)+B(2)*exp(-B(5)*t)*cos(B(4)*t+B(3));
f(t) = B(2)*exp(-B(5)*t)*cos(B(4)*t+B(3));
pause(1)
hold on
ezplot(f,[timedata(1),timedata(end)])
legend('simulation',strcat('dampiing coefficient of: ',num2str(B(end) ) ))
