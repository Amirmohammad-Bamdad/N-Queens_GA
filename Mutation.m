function mutated_offspring = Mutation(offsprings, Problem)
    num_offsprings = Problem.num_parents;
    
    for i=1:num_offsprings
        if permitMutation(Problem)
            tempOffsprings.gene = InversionMutation(offsprings(i,:), Problem.n);
        else
            tempOffsprings.gene = offsprings(i,:);
        end
        tempOffsprings.fitness = Problem.fitnessFunction(tempOffsprings.gene, Problem);
        mutated_offspring(i) = tempOffsprings;
    end
end

function child = InversionMutation(parent, n)
    start_position = round(rand*n); % rand returns a random scalar from uniform dist. betwenn (0,1)
    end_position = round(rand*n);
    if start_position ~= end_position
        if start_position > end_position
            tmp = start_position;
            start_position = end_position;
            end_position = tmp;
        end
        child = [parent(1:start_position) fliplr(parent(start_position+1:end_position)) parent(end_position+1:n)];
    else
        child = parent;
    end
end

function permission = permitMutation(Problem)
    random_number = rand;
    if random_number < Problem.mutation_rate
        permission = 1;
    else
        permission = 0;
    end
end

    