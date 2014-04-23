function [ Generation ] = ga(PopSize , BreedSize, SurvivorSize, MutChance, Iterations)
%GA Runs the genetic algorithm with the given parameters.

Population = randi(10,PopSize,2)
Generation = zeros(PopSize, 3);

for i=1:PopSize
    Generation(i,:) = [Population(i,:) weight(Population(i,:))];
end

for k=1:Iterations
fprintf('Iteration %d \n___________\n',k)
SortedGeneration = sortrows(Generation,-3);
fprintf('Current best (%d,%d) with weight=%d\n',SortedGeneration(end,1),SortedGeneration(end,2),SortedGeneration(end,3))

%Select (BreedSize lowest) Parents.
Parents = SortedGeneration(end-BreedSize:end,:)
Survivors = SortedGeneration(end-(BreedSize+SurvivorSize):end-BreedSize,:)

%Breed to create BreedSize Children
Children = zeros(BreedSize,3);
for j=1:BreedSize
    %Select random numbers from an exponential distribution depending on the breedsize.
    exprnd1 = exprnd(BreedSize/5);
    exprnd2 = exprnd(BreedSize/5);
    
    %Failsafe to not select a parent out of the bounds.
    if exprnd1 > BreedSize
        exprnd1 = BreedSize;
    end
    if exprnd2 > BreedSize
        exprnd2 = BreedSize;
    end
    
    %Ceil to make up for 1-based counting of matlab.
    parentselector1 = ceil(exprnd1);
    parentselector2 = ceil(exprnd2);

    %Failsafe to be sure two different parents are picked.
    if parentselector1==parentselector2
        if parentselector1 > 1
            parentselector1=parentselector1-1;
        else
            parentselector1=parentselector1+1;
        end 
    end
    
    %Select the first/second gene of the first/second parent to keep.
    geneselector1 = randi(2);
    geneselector2 = mod(geneselector1, 2) +1;

    % Mutations
    MutMod1 = 0;
    MutMod2 = 0;
    if rand(1)<MutChance
        MutMod1 = (-1)^randi(2);
    end
    if rand(1)<MutChance
        MutMod2 = (-1)^randi(2);
    end
    
    %Generate the new child.
    Gene1 = Parents(parentselector1,geneselector1)+MutMod1;
    Gene2 = Parents(parentselector2,geneselector2)+MutMod2;
    Children(j,geneselector1) = Gene1;
    Children(j,geneselector2) = Gene2;
    Children(j,3) = weight([Children(j,1) Children(j,2)]);
end
Children
Generation = [Parents ; Survivors ; Children];

end 

end

