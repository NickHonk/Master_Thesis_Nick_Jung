%(Ai;B1i) steuerbar, wenn (Ai,Bi) steuerbar und det(Fi(lambda))!=0 für alle lambda Element Eigenwerte(Ai)


%% create the transport-system transfer functions Fi(s)
rank_count=0;
if(rank(ctrb(A1,B1))==nx)
    %check the transfer function F @ all eigenvalues of Ai    
    abs_det_F=zeros(nx,1);
    for i=1:nx       
        F_to_check=zeros(np,np);
        for m=1:length(z_grid) 
           F_to_check(:,:)=F_to_check+PhiMatrix(z_grid(m))*expm(E(i,i)/Lambda*(z_grid(m)-1)); 
        end
        abs_det_F(i)=abs(det(F_to_check));
        if(rank(F_to_check)==np)            
            rank_count=rank_count+1;
        end
    end
    if(rank_count==nx)
        disp("(A,B1) steuerbar")
        disp("Betrag der Determinanten der Übertragungsfunktionen: ")
        disp(abs_det_F)
    else
        disp("(A,B1) nicht steuerbar, da Übertragungsfunktion für einen Eigenwert von A nicht vollen Rang hat")
    end
else
    disp("(A,B1) nicht steuerbar, da (A,B) nicht steuerbar")
end