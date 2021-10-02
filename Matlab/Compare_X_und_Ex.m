clc
clear

%spatial & time domain
dz=1/100;
L=1;
z_grid=0:dz:L;
dt=1/100;
T_simulate=6;
t_grid=0:dt:T_simulate;

nx=3; %Anzahl Zustände erweiterte Agenten
np=1; %Anzahl Eingänge je Agent
ny=np; %Anzahl Ausgänge je Agent

D=1; %Array der maximalen Totzeiten der p Eingänge - [s]
T=0.8; %Array der maximalen Totzeiten der p Ausgänge - [s]

Lambda=zeros(size(D));
for i=1:np
   Lambda(i,i)=1/D(i); 
end

mu_Eingang=0.5;
sigma_Eingang=0.1;
mu_Ausgang=0.4;
sigma_Ausgang=0.08;

AgentSetup;
DelayPDESetup;
SolveLocalDecoupling;
Controllability;