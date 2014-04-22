function [ W ] = meshweight( X,Y )
l1 = length(X);
l2 = length(X(:,1));
W = zeros(l1,l2);
for i=1:l1
    for j=1:l2
        W(i,j) = weight([X(i,j),Y(i,j)]);
    end
end
end

