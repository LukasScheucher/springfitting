close all
clear
clc

% TITLE     = "Versuch_13 | Versuch_13 | Versuch_13 | Versuch_13 | Versuch_13"
% VARIABLES = "Time [s]"
% "Kapazitiv 2 [mm] offset correction"
% ZONE T="dp=0kPa"
%  STRANDID=0, SOLUTIONTIME=0
%  I=40002, J=1, K=1, ZONETYPE=Ordered
%  DATAPACKING=POINT
%  DT=(DOUBLE DOUBLE )
 
MAT0p0=dlmread('./Damping_elasticpanel_magnetpulse_DP_0p0kPa.dat','',5);
MAT1p7=dlmread('./Damping_elasticpanel_magnetpulse_DP_1p7kPa.dat','',5);
MAT2p9=dlmread('./Damping_elasticpanel_magnetpulse_DP_2p9kPa.dat','',5);
MAT4p0=dlmread('./Damping_elasticpanel_magnetpulse_DP_4p0kPa.dat','',5);
MAT5p3=dlmread('./Damping_elasticpanel_magnetpulse_DP_5p3kPa.dat','',5);

figure();
plot(MAT0p0(:,1),MAT0p0(:,2))
xlabel('time');
ylabel('displacement');
legend(strcat('mean value:',num2str(mean(MAT0p0(:,2)))));
title('vaccum oscillation around offset of 0.0 kPA');

figure();
plot(MAT1p7(:,1),MAT1p7(:,2))
xlabel('time');
ylabel('displacement');
legend(strcat('mean value:',num2str(mean(MAT1p7(:,2)))));
title('vaccum oscillation around offset of 1.7 kPA');

figure();
plot(MAT2p9(:,1),MAT2p9(:,2))
xlabel('time');
ylabel('displacement');
legend(strcat('mean value:',num2str(mean(MAT2p9(:,2)))));
title('vaccum oscillation around offset of 2.9 kPA');

figure();
plot(MAT4p0(:,1),MAT4p0(:,2))
xlabel('time');
ylabel('displacement');
legend(strcat('mean value:',num2str(mean(MAT4p0(:,2)))));
title('vaccum oscillation around offset of 4.0 kPA');

figure();
plot(MAT5p3(:,1),MAT5p3(:,2))
xlabel('time');
ylabel('displacement');
legend(strcat('mean value:',num2str(mean(MAT5p3(:,2)))));
title('vaccum oscillation around offset of 5.3 kPA');

