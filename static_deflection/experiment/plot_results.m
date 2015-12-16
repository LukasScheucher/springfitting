close all
clear
clc

REF=load('reference')
LIN=load('results_static_linspring')
LIN20=load('results_static_linspring_20')
LIN25=load('results_static_linspring_25')
LINKUB=load('results_static_linkubspring')
LINKUBQUINT=load('results_static_linkubquintspring')


p=plot(REF(:,1),REF(:,2),'-.kx',LIN(:,1),LIN(:,2),'-o',...
  LINKUB(:,1),LINKUB(:,2),'-s',LINKUBQUINT(:,1),LINKUBQUINT(:,2),'-x')
set(p,'LineWidth',2)

legend('reference','lin spring','lin+kub spring','lin+kub+quint spring')

xlabel('pressure')
ylabel('displavcement maximum')
title('center displacement under constant load')
grid on


%% plot frame


REFFRAME=load('reference_frame')
DISPFRAME=load('results_static_frame')

figure()
p=plot(REFFRAME(:,1),REFFRAME(:,2),'-.kx',DISPFRAME(:,1),DISPFRAME(:,2),'-o')
set(p,'LineWidth',2)

legend('reference','simulation')

xlabel('\Delta z center')
ylabel('\Delta x spring')
title('Deformation of the frame')
grid on

