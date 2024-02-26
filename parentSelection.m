function parents = parentSelection(Population, Problem)
    nPopulation = Problem.population_size;
    nParents = Problem.num_parents;
    randomNumbers = randi(nPopulation,[1,nParents]);
    parents = Population(randomNumbers);