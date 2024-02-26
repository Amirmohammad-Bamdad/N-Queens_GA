function Problem= problemDefinition
    Problem.n = 8;
    Problem.population_size = 200;
    Problem.num_generation = 1000;
    Problem.fitnessFunction = @(x, p) CostFunction(x,p);
    Problem.num_parents = 100;
    Problem.mutation_rate = 0.45;
    Problem.recomb_rate = 0.8;
end
    
    