clear;
clc;
close all
%%
answer1 = questdlg('select input?','Force','step','sin','others','step');
switch answer1
    case 'step'
coef1=1;coef2=0;coef3=0;coef4=0;coef5=0;
    case 'sin'
coef1=0;coef2=1;coef3=0;coef4=0;coef5=0;
    case 'others'
answer2 = questdlg('select input?','selection','square','sawtooth','random','square');
        switch  answer2
            case 'square'
coef1=0;coef2=0;coef3=1;coef4=0;coef5=0; 
            case 'sawtooth'
coef1=0;coef2=0;coef3=0;coef4=1;coef5=0;
            case 'random'
coef1=0;coef2=0;coef3=0;coef4=0;coef5=1;
        end
end
%%
answer3 = questdlg('select input?','Torque','step','sin','others','step');
switch answer3
    case 'step'
coef6=1;coef7=0;coef8=0;coef9=0;coef10=0;
    case 'sin'
coef6=0;coef7=1;coef8=0;coef9=0;coef10=0;
    case 'others'
answer4 = questdlg('select input?','selection','square','sawtooth','random','square');
        switch  answer4
            case 'square'
coef6=0;coef7=0;coef8=1;coef9=0;coef10=0; 
            case 'sawtooth'
coef6=0;coef7=0;coef8=0;coef9=1;coef10=0;
            case 'random'
coef6=0;coef7=0;coef8=0;coef9=0;coef10=1;
        end
end
%%
c1=10;c2=10;k1=1000;k2=1000;md=20;ms=100;x0=0.2;L=1;g=10;R=0.1;
I=0.25*ms*R*R+((ms*L*L)/3);
params=[c1,c2,k1,k2,md,ms,x0,L,g,R,I];
%% input
amplitudef=100;
frequencyf=2;
%
amplitudeT=100;
frequencyT=5;
torque=10;
%%
sim('prob5')
%% 
figure
subplot(221)
plot(time,force)
xlabel('time - sec')
ylabel('inputs - N')
grid minor
title('Force Input')
subplot(223)
plot(time,y)
xlabel('time - sec')
ylabel('y - m')
grid minor
title('Flexural Vibration')
subplot(222)
plot(time,Torque)
xlabel('time - sec')
ylabel('inputs - N.m')
grid minor
title('Torque Input')
subplot(224)
plot(time,teta)
xlabel('time - sec')
ylabel('\theta - rad')
grid minor
title('Torsional Vibration')
%%
% omega=[1,2,3,4,5,6,7,8,9,10];
% for i=1:numel(omega)
% frequency=omega(i);
% sim('prob5')
% RPM(i).rpm=tetadot;
% end
%%
% figure
% plot(RPM(1).rpm)
% hold on
% plot(RPM(2).rpm)
% hold on
% plot(RPM(3).rpm)
% hold on
% plot(RPM(4).rpm)
% hold on
% plot(RPM(5).rpm)
% hold on
% plot(RPM(6).rpm)
% hold on
% plot(RPM(7).rpm)
% hold on
% plot(RPM(8).rpm)
% hold on
% plot(RPM(9).rpm)
% hold on
% plot(RPM(10).rpm)
% ylabel('Angular Velocity - rad/sec')
% legend(['\omega=',num2str(omega(1))],['\omega=',num2str(omega(2))],['\omega=',num2str(omega(3))],['\omega=',num2str(omega(4))],['\omega=',num2str(omega(5))],['\omega=',num2str(omega(6))],['\omega=',num2str(omega(7))],['\omega=',num2str(omega(8))],['\omega=',num2str(omega(9))],['\omega=',num2str(omega(10))],'location','northwest')
% grid minor
% title('Campbell Diagram')