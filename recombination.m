function offsprings = recombination(parents, Problem)
    offsprings = zeros(Problem.num_parents, Problem.n);
    for i=1:2:Problem.num_parents
        if permitRecombination(Problem)
            prob_matrix = rand(Problem.n);
            offsprings(i,:) = uniformCrossover(parents(i), parents(i+1), prob_matrix, Problem);
            offsprings(i+1,:) = uniformCrossover(parents(i+1), parents(i), prob_matrix, Problem);
        else
            offsprings(i,:) = parents(i).gene;
            offsprings(i+1,:) = parents(i+1).gene;
        end
    end
end

function new_offspring = uniformCrossover(parent1, parent2, prob, Problem)
    new_offspring = parent1.gene;
    for i=1:Problem.n
        if prob(i)<0.5
            tmp = new_offspring(i);
            new_offspring(i) = parent2.gene(i);
            parent2.gene(i) = tmp;
        end
    end
end

function permission = permitRecombination(Problem)
    random_number = rand;
    if random_number < Problem.recomb_rate
        permission = 1;
    else
        permission = 0;
    end
end
