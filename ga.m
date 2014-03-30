function [ Generation ] = ga(PopSize , BreedSize, SurvivorSize, MutChance)
%GA Runs the genetic algorithm with the given parameters.

Population = randi(10,PopSize,2);

Generation = zeros(PopSize, 3);

for i=1:PopSize
    Generation(i,:) = [Population(i,:) weight(Population(i,:))];
end

for k=1:1000
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
    if rand(1)<MutChance
        MutMod1 = round(randi(1));
    end
    if rand(1)<MutChance
        MutMod2 = round(randi(1));
    end
    Gene1 = Parents(end,1)+MutMod1;
    Gene2 = Parents(j,2)+MutMod2;
    
    Children(j,:) = [Gene1 Gene2 weight([Gene1 Gene2])];
end

Generation = [Parents ; Survivors ; Children];

end 

end

