function Population = populationCreation(Problem)
    % Each gene consists n elements (as columns of chess board) showcasing
    % the row that a queen is placed in that: gene[i] = j => a queen is in
    % jth row of ith column.
    
    Individual.gene = [];
    Individual.fitness = inf;
    Population = repmat(Individual, Problem.population_size, 1);
    for index=1:Problem.population_size
        Population(index).gene = randperm(Problem.n);
     
        %Solution Example: disp(Problem.fitnessFunction([5, 3, 1, 7, 2, 8, 6, 4],Problem));
        Population(index).fitness = Problem.fitnessFunction(Population(index).gene, Problem);
    end
end
