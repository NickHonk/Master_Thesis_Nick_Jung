ex_compare=zeros(3*nx,length(t_grid));
for k=1:length(t_grid)
    int=zeros(3*nx,1);
    for m=1:length(z_grid)
        int=int+dz*(kron(eye(3),Q1(z_grid(m)))*Phi(m,:,k).'); %different for different agents 
    end
    ex_compare(:,k)=x(:,k)-int; %(17)
end