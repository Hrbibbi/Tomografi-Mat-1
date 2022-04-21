function intersection= intersect_points(equation1,equation2)
    A=[equation1(1),equation1(2);equation2(1),equation2(2)];
    B=[equation1(3);equation2(3)];
    intersection=linsolve(A,B);
end