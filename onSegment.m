function onSegment =onSegment(p,q,r):
    if ( (q(1) <= max(p(1),r(1))) && (q(1)>= min(p(1),r(1))) && (q(2) <= max(p(2),r(2))) && (q(2)>= min(p(2),r(2))))
        onSegment=1;
    else
        onSegment=0;