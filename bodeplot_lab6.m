%%

clear
clc
%Created by Grant Mottershaw
%%
load st2bode0_5Hz.txt
% The values governing the system.

%%

w=st2bode0_5Hz(:,1)*(2*pi);
m1=st2bode0_5Hz(:,2);
p1=st2bode0_5Hz(:,3);
%
k = 1.6;
j = 1.5;
wn = 85;
a = 90000;
kp=(10.796*1000)/430;
%%
 % System C(s) 
	numC = [0 0 k*kp*wn^2];    % the numerator 
	denC = [1 2*j*wn wn^2];    % The demnomater 
 	
    % System K(s)
    numK = [0 1 ];
 	denK = [1/a 1];
    
    % Combined system B(s)
    [numB,demB]= series(numC,denC,numK,denK);  % Adding the two systems together. 
    Bs=tf(numB,demB);
    % Adding the feedback loop. 
    Hs=feedback(Bs,1);
    
    [m2,p2]=bode(Hs)



% The bode plot of the Real system over the simulated system. 
figure(1)  
subplot(2,1,1)
    semilogx(w,m1);
    ylabel('Phase Shift (deg)')

subplot(2,1,2)
    semilogx(w,p1);
    ylabel('Phase Shift (deg)')