function length=get_length(i,j,a,N,rho,theta)
    % The function finds the length of the line-segment of the line that
    % Passes through the cell
    % Usage: length=get_length(i,j,a,N,rho,theta)
    % Inputs: i,j defines the cell number
    %   a is the size of the square
    %   N is the size of the partitions of the cell
    %   rho,theta defines the values for the line equation
    %   rho=x*cos(theta)+y*sin(theta)

    %Create the sides of the cell used
    [x0,y0,x1,y1]=deal(-a+(2*a/N)*(i-1),-a+(2*a/N)*(j-1),-a+(2*a/N)*(i),-a+(2*a/N)*(j));
    % We have two special cases if the line is horizontal or vertical
    % Here the lines are simply the paratition length i.e x1-x0=y1-y0
    if sin(theta)==0 || cos(theta)==0
        length=x1-x0;
    else
        %The general case: We define the line equations for each side as
        %(y1-y2)x+(x2-x1)y+(x1y2-x2y1)=0 and write it as a the matrix Ax=B
        eq_Line=[cos(theta),sin(theta),rho];
        eq_Sides=[0,x1-x0,x1*y1-x0*y1;0,x1-x0,x1*y0-x0*y0;y1-y0,0,x0*y0-x0*y1;y1-y0,0,x1*y0-x1*y1];
        for i=1:4
            %We solve for the intersection between the line and the sides
            %and append them to a Matrix
            X(:,i)=intersect_points(eq_Line,eq_Sides(i,:));
        end
        % We choose the indicies where the intersection is in the cell
        % range
        I=(find((x0<=X(1,:) & X(1,:)<=x1 & y0<=X(2,:) & X(2,:)<=y1)));
        K=X(:,I);
        %We get the length
        length=norm(K(:,2)-K(:,1));
    end
end    
