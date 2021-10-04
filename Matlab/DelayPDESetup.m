
%Normalverteilung Einganstotzeit
for i=1:np
    P_dichte_1_Eingang{i}=@(tau) sqrt((1/(2*pi*sigma_Eingang(i)^2)))*exp(-((tau-mu_Eingang(i))^2)/(2*sigma_Eingang(i)^2));
end
    
%Delay-PDE-states
Phi=zeros(length(z_grid),3*np,length(t_grid));

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
u=zeros(3,length(t_grid));

u(1,:)=sin(2*pi*t_grid);

tsprung=1;
u(2,(t_grid(1)/dt+1:tsprung/dt-1))=0; %Sprung bei t=1;
u(2,(tsprung/dt:t_grid(end)/dt))=1;

u(3,:)=t_grid; %Rampe

%Phi Initial conditions 
Phi_0=0*z_grid;

for i=1:3
    Phi(:,i,1)=Phi_0;
end

%(15b)
Phi(end,:,1)=u(1);





