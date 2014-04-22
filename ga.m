function [ Generation ] = ga(PopSize , BreedSize, SurvivorSize, MutChance, Iterations)
%GA Runs the genetic algorithm with the given parameters.

Population = randi(10,PopSize,2);

Generation = zeros(PopSize, 3);

for i=1:PopSize
    Generation(i,:) = [Population(i,:) weight(Population(i,:))];
end

for k=1:Iterations
SortedGeneration = sortrows(Generation,-3);
%Select Parents (BreedSize lowest).
Parents = SortedGeneration(end-BreedSize:end,:);
Survivors = SortedGeneration(end-(BreedSize+SurvivorSize):end-BreedSize,:);

%Breed to create BreedSize Children
Children = zeros(BreedSize,3);

%Keep first coordinate.
for j=1:BreedSize
    MutMod1 = 0;
    MutMod2 = 0;
    
    %Select the first/second gene of the first/second parent to keep.
    geneselector1 = randi(2);
    geneselector2 = mod(geneselector1, 2) +1;

    if rand(1)<MutChance
        MutMod1 = round(randi(1));
    end
    if rand(1)<MutChance
        MutMod2 = round(randi(1));
    end
    
    Gene1 = Parents(end,geneselector1)+MutMod1;
    Gene2 = Parents(j,geneselector2)+MutMod2;
    Children(j,geneselector1) = Gene1;
    Children(j,geneselector2) = Gene2;
    Children(j,3) = weight([Children(j,1) Children(j,2)]);
end

Generation = [Parents ; Survivors ; Children];

end 

end

