

%Normalverteilung Einganstotzeit
for i=1:np
    P_dichte_1_Eingang{i}=@(tau) sqrt((1/(2*pi*sigma_Eingang(i)^2)))*exp(-((tau-mu_Eingang(i))^2)/(2*sigma_Eingang(i)^2));
end
    
%Delay-PDE-states
Phi1=zeros(length(z_grid),length(t_grid));
Phi2=Phi1;
Phi3=Phi1;

%PhiMatrix is the coupling into the ODE in (15c)
PhiMatrix_disc=zeros(length(z_grid),np,np);
for i=1:np
    for m=1:length(z_grid)
        PhiMatrix_disc(m,i,i)=D(1)*P_dichte_1_Eingang{i}(D(1)*(1-z_grid(m)));        
    end
end
PhiMatrix_interp = numeric.interpolant({z_grid,1:np,1:np},PhiMatrix_disc);
PhiMatrix = @(z) reshape((PhiMatrix_interp.evaluate(z,1:np,1:np)),[np,np]); %same for different agents


%Input signals (needed just in the beginning, not in the closed loop)
u1=sin(2*pi*t_grid);

tsprung=1;
u2(t_grid(1)/dt+1:tsprung/dt-1)=0; %Sprung bei t=1;
u2(tsprung/dt:t_grid(end)/dt)=1;

u3=t_grid; %Rampe

%Phi Initial conditions 
Phi_0=0*z_grid;

Phi1(:,1)=Phi_0;
Phi2=Phi1;
Phi3=Phi1;

%(15b)
Phi1(end,1)=u1(1);
Phi2(end,1)=u2(1);
Phi3(end,1)=u3(1);




