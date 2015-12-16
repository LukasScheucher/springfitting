close all
clear
clc

numstep=1499;
timestep=0.15;

deltax=0.05



timedata=0:numstep;
timedata=timedata;
timedata=timedata*timestep/1000;

theta_sim=-16;


data_sim=[];
for fileid=0:numstep
  data_sim=[data_sim;csvread(strcat('/scratch/scheucher/workspace/baci_springfitting/transfer/results/oscillation_baci/data0.',num2str(fileid),'.csv'),1)];
end

EXP_sim=exp(theta_sim.*(timedata+0.014));
plot(timedata,data_sim(:,2),timedata,EXP_sim)
legend('data simulation',strcat('theta=',num2str(theta_sim)))
hold on
xlabel('time [s]');
ylabel('diplacement z [cm]');
axis([0.00 0.2 -0.4,0.4]);
title('vacuum damping simulation with MDAMP=0.034');

% figure()
% EXP_sim_15
% semilogy(timedata,data_sim(:,2),'-o',timedata,EXP_sim_18,timedata,EXP_sim_15)

%load('/scratch/scheucher/workspace/baci_springfitting/transfer/results/oscillation_baci/data0.0.csv')


% hold on 
% figure()
% data_measure=load('/scratch/scheucher/workspace/baci_springfitting/transfer/seitz/full_data.dat');
% 
% time_measure=data_measure(:,1);
% disp_measure=data_measure(:,2);
% 
% disp_measure=disp_measure-4.760922074265793;
% EXP_measure=exp(-18.393086282426186.*(time_measure-0.39))+0.016;
% plot(time_measure-0.45,disp_measure,'m',time_measure-0.45,EXP_measure)
% axis([0.0 0.3 -0.4,0.2])
