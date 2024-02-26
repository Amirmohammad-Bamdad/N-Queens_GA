function Population = survivorSelection(Population, offsprings, Problem)
    Population = [Population; offsprings];
    [~, order] = sort([Population.fitness]);
    Population = Population(order);
    tmp_population = Population;
    eps = 0.01;
    [row, ~] = size(Population);
    for i=1:row
        non_zero_fit = Population(i).fitness + eps;
        selection_probability(i) = 1 ./ (non_zero_fit + eps);
    end
    total_probability = sum(selection_probability);
    normalized_prob = selection_probability/total_probability;
    
    random_num = rand;
    cumulative_prob = cumsum(normalized_prob);
    index = cumulative_prob < random_num;
    Population = Population(index, :);
    
    [nRows, ~] = size(Population);
    if nRows>Problem.population_size
        Population = Population(1:Problem.population_size, :);
    elseif nRows<Problem.population_size
        tmp = tmp_population(1:(Problem.population_size-nRows), :);
        Population = [Population; tmp];
    end 
    [~, order] = sort([Population.fitness]);
    Population = Population(order);
end
