function bool_intersect = intersect_cell(i,j,a,N,rho,theta)

bool_intersect = 0;

[x0,y0,x1,y1] = deal(-a+(2*a/N)*(i-1), -a+(2*a/N)*(j-1), -a+(2*a/N)*(i), -a+(2*a/N)*(j));

if theta <= pi/2
    rho0 = cos(theta)*x0 + sin(theta)*y0;
    rho1 = cos(theta)*x1 + sin(theta)*y1;

    if rho0 < rho && rho < rho1
        bool_intersect = 1;
    end
    if (phi == 0 || phi == pi/2) && rho == rho1:
        bool_intersect = 1;
    end
    
end

if theta > pi/2
    rho0 = cos(theta)*x1 + sin(theta)*y0;
    rho1 = cos(theta)*x0 + sin(theta)*y1;
    
    if rho0 < rho && rho < rho1
        bool_intersect = 1;
    end
    if phi == pi && rho == rho0:
        bool_intersect = 1;
    end
end
