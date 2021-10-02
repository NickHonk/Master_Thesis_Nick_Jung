%% Get Q(z)
 
%right EV, eigenvalues, left eigenvectors (columns are the vectors) - different if agents differ
[V1,E1,W1]=eig(A1); 

Theta_disc=zeros(length(z_grid),nx,np);
for i=1:nx
    for m=1:length(z_grid)
        Theta_disc(m,i,:)=W1(:,i).'*B1*PhiMatrix(z_grid(m));
    end
end
Theta_interp = numeric.interpolant({z_grid,1:nx,1:np},Theta_disc);
Theta1 = @(z) reshape((Theta_interp.evaluate(z,1:nx,1:np)),[nx,np]); %different if agents differ

Einheitsvek=eye(nx);
q_transpose_disc=zeros(length(z_grid),nx,np);
for i=1:nx          
    for m=1:length(z_grid)
        for q=1:m
            q_transpose_disc(m,i,:)= q_transpose_disc(m,i,:) -Einheitsvek(:,i).'*Theta1(z_grid(q))/Lambda*expm(-E1(i,i)/Lambda*(z_grid(m)-z_grid(q)));
        end
    end
end
q_transpose1_interp = numeric.interpolant({z_grid,1:nx,1:np},q_transpose_disc);
q_transpose1 = @(z) reshape((q_transpose1_interp.evaluate(z,1:nx,1:np)),[nx,np]); %(24) - %different if agents differ


Winv1=(W1.')^-1; %Inverse der linken Eigenvektormatrix - %different if agents differ
Q1=@(z) Winv1*q_transpose1(z); %(25) - %different if agents differ



