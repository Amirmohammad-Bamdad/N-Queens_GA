clc;
clear;
close all;

%% Definition
Problem = problemDefinition();

%% Start
%rate = 50;
%recomb_list = nan(20,1);
%scores = nan(20,1);

%for i=1:20
%    %% Change Population Size 
%    Problem.num_generation = rate.*i;
%    recomb_list(i) = Problem.num_generation;
    
%    %% Init Population
%    Population = populationCreation(Problem);
%    [~,order] = sort([Population.fitness]);
%    Population = Population(order);
    
%    %%
%    [bestIndividuals, index, Population] = GALoop(Problem, Population);
%    scores(i) = index;
%end
%figure;
%plotFitnessMutation(recomb_list, scores);

%% Init Population
Population = populationCreation(Problem);
[~,order] = sort([Population.fitness]);
Population = Population(order);
[bestIndividuals, i, Population, times] = GALoop(Problem, Population);
displayBoard(Problem.n, Population(1).gene);
figure;
plotResult(bestIndividuals, i, times);