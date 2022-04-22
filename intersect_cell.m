function bool_intersect = intersect_cell(i,j,a,N,rho,theta)
% Checks if the line l(rho,theta) passes through the cell C{ij}
% input:
%   i - first cell index
%   j - first cell index
%   a - parameter describing the size of the region B
%   N - number of cells in a row of the region B
%   rho - minimal distance between the origin and the ray
%   theta - angle between the ray and tha y-axis
% output:
%   bool_intersect = 1 if the ray passes through the cell C{ij}, 0
%   otherwise.

bool_intersect = 0;

[x0,y0,x1,y1] = deal(-a+(2*a/N)*(i-1), -a+(2*a/N)*(j-1), -a+(2*a/N)*(i), -a+(2*a/N)*(j)); % computes the corners of the cell

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
