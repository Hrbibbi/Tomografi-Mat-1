function intersect_cell=intersect_cell(i,j,a,N,rho,theta)
    [x0,y0,x1,y1]=deal(-a+(2*a/N)*(i-1),-a+(2*a/N)*(j-1),-a+(2*a/N)*(i),-a+(2*a/N)*(j));
    if sin(theta)~=0 
        Ly=@(x) (rho-x*cos(theta))/sin(theta);
        L=[x0,Ly(x0);x1,Ly(x1)];
    else
        L=[rho/cos(theta),y0;rho/cos(theta),y1];
        
    end
    D1=[x0,y0;y1,y1];
    D2=[x0,y1;x1,y0];
    Intersect1=intersect_lines(D1(1,:),D1(2,:),L(1,:),L(2,:));
    Intersect2=intersect_lines(D2(1,:),D2(2,:),L(1,:),L(2,:));
    if (Intersect1==1 || Intersect2==1)
        intersect_cell=1;
    else
        intersect_cell=0;
    end
end