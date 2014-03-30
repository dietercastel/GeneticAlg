function [ V ] = locations( )

V = zeros(50,2);

for i=1:10
    for j=1:5
        V(5*(i-1)+j, :) = [i j];
    end
end

end

