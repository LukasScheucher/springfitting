close all
clear
clc


%% header zu dz01
% 
% TITLE     = ""
% VARIABLES = "Kapazitiv 2 offset [mm]"
% "Kulite 4 offset [Pa]"
% "Time offset [s]"
% ZONE T="Sensoren"
%  STRANDID=0, SOLUTIONTIME=0
%  I=12002, J=1, K=1, ZONETYPE=Ordered
%  DATAPACKING=POINT
%  DT=(SINGLE SINGLE SINGLE )
 
 
%% header zu dy39
% 
% TITLE     = ""
% VARIABLES = "Kapazitiv 2 offset [mm]"
% "Kulite 4 offset [Pa]"
% "Time offset [s]"
% ZONE T="Sensoren"
%  STRANDID=0, SOLUTIONTIME=0
%  I=6002, J=1, K=1, ZONETYPE=Ordered
%  DATAPACKING=POINT
%  DT=(SINGLE SINGLE SINGLE )

%% Messergebnisse

dz0_1=load('dz0_1.dat');
dz39_1=load('dz39_1.dat');
M87mbar= dlmread('Damping_elasticpanel_magnetrelease_87mbar.dat','',27);
M160mbar= dlmread('Damping_elasticpanel_magnetrelease_160mbar.dat','',27);


relation_deltay_deltav=load('relation_deltay_deltav');
deltay=relation_deltay_deltav(:,1);
deltav=relation_deltay_deltav(:,2);


disp_dz0_1=dz0_1(:,1);
pres_dz0_1=dz0_1(:,2);
time_dz0_1=dz0_1(:,3);


disp_dz39_1=dz39_1(:,1);
pres_dz39_1=dz39_1(:,2);
time_dz39_1=dz39_1(:,3);


M87mbar       =M87mbar(1:6000,:)
M87mbar_time  =M87mbar(:,1);
M87mbar_disp  =M87mbar(:,2);
M87mbar_ampere=M87mbar(:,3);
M87mbar_pres  =M87mbar(:,4);

%M160mbar       =M160mbar(1:5400,:)
M160mbar_time  =M160mbar(:,1);
M160mbar_disp  =M160mbar(:,2);
M160mbar_ampere=M160mbar(:,3);
M160mbar_pres  =M160mbar(:,4);


plot(time_dz0_1,disp_dz0_1)
xlabel('time [s]')
ylabel('offset [mm]')
title('osciallion with aerospring and displacement offset of 0.0');

figure()
plot(time_dz39_1,disp_dz39_1)
xlabel('time [s]')
ylabel('offset [mm]')
title('osciallion with aerospring and displacement offset of 3.9');


figure()
plot(pres_dz0_1,disp_dz0_1,'x')
xlabel('pressure [Pa]')
ylabel('displacement y [mm]')
title('measured data');

figure()
plot(pres_dz39_1,disp_dz39_1,'x')
xlabel('pressure [Pa]')
ylabel('displacement y [mm]')
title('measured data');


figure()
plot(M87mbar_time,M87mbar_disp,'-')
xlabel('time [s]')
ylabel('displacement y [mm]')
title('M87mbar disp over time');

figure()
plot(M160mbar_time,M160mbar_disp,'-')
xlabel('time [s]')
ylabel('displacement y [mm]')
title('M160mbar disp over time');

figure()
plot(M160mbar_time,M160mbar_ampere,'-')