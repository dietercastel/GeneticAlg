function [ Dist ] = minDist( P1, P2 )
% Calculates the shortest distance
Bridge1 = [3.5 3.5]; 
Bridge2 = [8.5 3.5]; 

if (P1(2) < 3.5 && P2(2) < 3.5) || (P1(2) > 3.5 && P2(2) > 3.5)
    Dist = norm(P1 - P2);
else
    Dist = min(norm( P1- Bridge1 )+ norm(Bridge1 -P2), norm(P1 - Bridge2)+norm(Bridge2 - P2));
end

end