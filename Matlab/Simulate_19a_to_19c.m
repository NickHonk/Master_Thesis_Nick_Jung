%The locally stabilized agents (19a)
ex=zeros(3*nx,length(t_grid));

%transform the initial conditions (17)
int_0=zeros(3*nx,1);
for i=1:length(z_grid)
    int_0=int_0+dz*(kron(eye(3),Q1(z_grid(i)))*Phi(i,:,1).'); %different for different agents
end
ex(:,1)=x(:,1)-int_0;

for i=1:3
    Phi(:,i,1)=Phi_0;
end
Phi(end,:,1)=u(1); %(15b)

for k=2:length(t_grid)
    %get next PDE state of Phi: (15a)
    for m=1:length(z_grid)-1 %because at the end the boundary condition (15b) will apply
        Phi(m,:,k)=Phi(m,:,k-1)+dt*(kron(eye(3),Lambda)*(Phi(m+1,:,k-1)-Phi(m,:,k-1)).'/dz).';
    end
    Phi(end,:,k)=u(:,k); %(15b) 
    
    inputODE=u(:,k-1)-kron(eye(3),K1_local_stab1)*ex(:,k-1); %19a - different for different agents
    
    %different for different agents
    ex(:,k)=ex(:,k-1)+dt*(kron(eye(3),A-B1_local_stab1*K1_local_stab1)*ex(:,k-1)-kron(eye(3),B1_local_stab1)*inputODE);
end

