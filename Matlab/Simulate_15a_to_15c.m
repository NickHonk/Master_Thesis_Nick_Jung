for k=2:length(t_grid)
    %get next PDE state of Phi: (15a)
    for m=1:length(z_grid)-1 %because at the end the boundary condition (15b) will apply
        Phi(m,:,k)=Phi(m,:,k-1)+dt*(kron(eye(3),Lambda)*(Phi(m+1,:,k-1)-Phi(m,:,k-1)).'/dz).';
    end
    Phi(end,:,k)=u(:,k); %(15b)
    
    %get next ODE state: (15c)
    delayedInput=zeros(3*nx,1);
    for i=1:length(z_grid)
        %should depend on the agents, but doesn't so far
        delayedInput=delayedInput+dz*(kron(eye(3),B*PhiMatrix(z_grid(i)))*Phi(i,:,k-1).'); %input (15c)
    end
    x(:,k)=x(:,k-1)+dt*(kron(eye(3),A)*x(:,k-1)+delayedInput); %also dependent on agent dynamics
end