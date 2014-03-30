function [ W ] = weight( V )
%WEIGHT Summary of this function goes here
%   Detailed explanation goes here
W = 0;
loc = locations
for i=1:length(loc)
    W = W + minDist(V,loc(i,:));
end

end
