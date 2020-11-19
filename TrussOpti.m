%% Truss Optimization Problem
%% State Problem
% vars: A1, A2, A3, A4, l, E, P, theta, alpha
% Objective: Min(Weight [Volume]),
% Constraints: buckkling conditions & axial stress <= allowable strength ;
% End Deflection Constraint: delta <= delta_max ;
% Bounds:  10 e-06 <= A1, A2, A3, A4 <= 500 e-06 ;

% Givens: l= 1; delta_max= 2e-03  P= 2000 ,E= 2 e+011, S_all= 5 e+08, theta= 45 deg, alpha= 33.69 deg;

%% Solution
% Create Bounds
LB= [10e-06 10e-06 10e-06 10e-06 ];  %Lower Bound
UB= [500e-06 500e-06 500e-06 500e-06 ];  %Upper Bound

% Optimization Options
optimization = optimoptions(@ga, 'MaxGenerations', 300, 'PopulationSize', 300 ...
    , 'FunctionTolerance', 10e-012, 'EliteCount', 10, 'PlotFcn', {@gaplotbestf,@gaplotstopping});

% Run GA
rng(0, 'twister');

[xbest, fbest, exitflag] = ga(@Weight, 4, [], [], [], [], ...
    LB, UB, @TrussConstraints, [], optimization);

display(xbest);
fprintf('Best Volume returned by ga = %g\n', fbest);

