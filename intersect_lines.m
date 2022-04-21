function does_intersect=intersect_lines(p1,q1,p2,q2)

o1=orientation(p1,q1,p2);
o2=orientation(p1,q1,q2);
o3=orientation(p2,q2,p1);
o4=orientation(p2,q2,q1);
if ((o1~=o2) && (o3 ~= o4))
    does_intersect=1;
    % p1 , q1 and p2 are collinear and p2 lies on segment p1q1
elseif ((o1 == 0) && onSegment(p1, p2, q1))
        does_intersect=1;
    % p1 , q1 and q2 are collinear and q2 lies on segment p1q1
elseif ((o2 == 0) && onSegment(p1, q2, q1))
      does_intersect=1;
    % p2 , q2 and p1 are collinear and p1 lies on segment p2q2
elseif ((o3 == 0) && onSegment(p2, p1, q2))
        does_intersect=1;
    % p2 , q2 and q1 are collinear and q1 lies on segment p2q2
elseif ((o4 == 0) && onSegment(p2, q1, q2))
        does_intersect=1;
else
    does_intersect=0;
end
 
end