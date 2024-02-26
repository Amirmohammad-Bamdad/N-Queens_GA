function plotFitnessMutation(mutation_rates, final_generation)
    plot(mutation_rates, final_generation, 'o-');
    xlabel("Generation_Size");
    ylabel("Final_Generation");
    title("Generation_Size Final_Generation Diagram");
    grid on;
end