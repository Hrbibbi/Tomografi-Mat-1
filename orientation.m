function orientation=orientation(p,q,r)
    %disp((q(2)-p(2))*(r(1)-q(1)))
    det=(q(2)-p(2))*(r(1)-q(1))-(q(1)-p(1))*(r(2)-q(2));
    if det>0
        orientation=1;
    elseif (det<0)
        orientation=2;
    else
        orientation=0;  
end
