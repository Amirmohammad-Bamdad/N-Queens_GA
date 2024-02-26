function [bestIndividuals, i, Population, times] = GALoop(Problem, Population)
    tic;
    times = nan(Problem.num_generation,1);
    bestIndividuals = nan(Problem.num_generation, 1);
    for i=1:Problem.num_generation
        parents = parentSelection(Population, Problem);
        offsprings = recombination(parents, Problem);
        offsprings = Mutation(offsprings, Problem);
   
        offsprings = offsprings.';
        Population = survivorSelection(Population, offsprings, Problem);
        disp(['Best Individual: ' mat2str(Population(1).gene) ', Fitness: ' num2str(Population(1).fitness) ', Generation: ' num2str(i)]);
        bestIndividuals(i) = Population(1).fitness;
        times(i) = toc;
        
        if Population(1).fitness == 0
            break;
        end
    end
end