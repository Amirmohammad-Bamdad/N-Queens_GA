function cost = CostFunction(individual, Problem)
    cost = 0;
    for col = 1:Problem.n-1
        row = individual(col);

        for col2 = col+1:Problem.n
            % Queens placed at the same row
            if (individual(col2) == row)
                cost = cost + 1;
            end

            if ((col2 + individual(col2) == col + row) || ...
                (col2 - individual(col2) == col - row))
                cost = cost + 1;
            end
        end
    end
end
