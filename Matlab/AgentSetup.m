

%Nominalagent
c=100; %[kg/s] Reibungskonstante
m=1500; %[kg] Masse Fahrzeug
kP=0.9*m; %[1/s] - PI-Regler Parameter
kI=0.6*m; %[m^2/(N*kg)] - PI-Regler Parameter
A_teil=[-(c+kP)/m, -kP/m; 1, 0]; %Dynamikmatrix Fahrzeug + Geschwindigkeitsregelung
B_teil=[kP/m; -1]; %Eingangsmatrix Fahrzeug + Geschwindigkeitsregelung
C_teil=[1, 0]; %Ausgangsverstärkung Fahrzeug + Geschwindigkeitsregelung
A=[0, C_teil; zeros(2,1), A_teil]; %Dynamikmatrix erweitert
B=[0; B_teil]; %Eingangsverstärkung erweitert
C=[C_teil 0]; %Ausgangsverstärkung erweitert


%Agent 1
c1=c;
m1=m; 
kP_1=kP; 
kI_1=kI; 
A_1_teil=A_teil;
B_1_teil=B_teil; 
C_1_teil=[1, 0]; 
A1=[0, C_1_teil; zeros(2,1), A_1_teil]; 
B1=[0; B_1_teil]; 
C1=[C_1_teil 0]; 
Abstand1=[4 0 0]; %Sollabszand zu virtuellem Führungsagent
AW1=[2;0;0]; %Anfangswerte Zustand
x1=zeros(nx,1)*t_grid; %Zustand

%Agent 2
c2=c;
m2=m; 
kP_2=kP; 
kI_2=kI; 
A_2_teil=A_teil;
B_2_teil=B_teil; 
C_2_teil=[1, 0]; 
A2=[0, C_2_teil; zeros(2,1), A_2_teil]; 
B2=[0; B_2_teil]; 
C2=[C_2_teil 0]; 
Abstand2=[8 0 0]; %Sollabszand zu virtuellem Führungsagent
AW2=[3;0;0]; %Anfangswerte Zustand
x2=zeros(nx,1)*t_grid; %Zustand

%Agent 3
c3=c;
m3=m; 
kP_3=kP; 
kI_3=kI; 
A_3_teil=A_teil;
B_3_teil=B_teil; 
C_3_teil=[1, 0]; 
A3=[0, C_3_teil; zeros(2,1), A_3_teil]; 
B3=[0; B_3_teil]; 
C3=[C_3_teil 0]; 
Abstand3=[12 0 0]; %Sollabszand zu virtuellem Führungsagent
AW3=[7;0;0]; %Anfangswerte Zustand
x3=zeros(nx,1)*t_grid; %Zustand

