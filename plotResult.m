function plotResult(bestIndividuals, i, times)
    elapsed = toc;
    disp(['Elapsed Time: ' num2str(elapsed)]);
    plot(bestIndividuals(1:i),'b-');
    xlabel("Generation");
    ylabel("Fitness");
    title("Generation Fitness Diagram");
    
    figure;
    plot(times(1:i), bestIndividuals(1:i),'o-');
    xlabel("Time");
    ylabel("Fitness");
    title("Time Fitness Diagram");
end