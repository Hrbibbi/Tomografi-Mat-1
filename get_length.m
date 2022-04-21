function length=get_length(i,j,a,N,rho,theta)
    [x0,y0,x1,y1]=deal(-a+(2*a/N)*(i-1),-a+(2*a/N)*(j-1),-a+(2*a/N)*(i),-a+(2*a/N)*(j));
    if intersect_cell(i,j,a,N,rho,theta)==0
        length=NaN;
    else
        if sin(theta)==0 || cos(theta)==0
            length=x1-x0;
        else
            eq_Line=[cos(theta),sin(theta),rho];
            eq_Sides=[0,x1-x0,x1*y1-x0*y1;0,x1-x0,x1*y0-x0*y0;y1-y0,0,x0*y0-x0*y1;y1-y0,0,x1*y0-x1*y1];
            for i=1:4
                X(:,i)=intersect_points(eq_Line,eq_Sides(i,:));
            end
            I=find((x0<=X(1,:) & X(1,:)<=x1 & y0<=X(2,:) & X(2,:)<=y1).*X(1,:));
            K=X(:,I);
            length=norm(K(:,2)-K(:,1));
         end
     end
end    
