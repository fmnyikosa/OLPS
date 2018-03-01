% Draw bar graphs of results
% Metric: Sharpe Ratio
%
% (c) Copyright Favour M Nyikosa <favour@nyikosa.com> 1st March 2018

close all
clc

categories = categorical( ...
    {'DJIA', 'SP500', 'TSE', 'MSCI', 'NYSE(O)', 'NYSE(N)'} );

D  = [ 1 2 3 ];
S  = [ 1 3 4 ];
T  = [ 1 2 3 ];
M  = [ 1 4 5 ];
NO = [ 4 5 6 ];
NN = [ 56 7 8];

results    = [            ...
    D;  ... DJIA
    S;  ... SP500
    T;  ... TSE
    M;  ... MSCI
    NO; ... NYSE(O)
    NN; ... NYSE(N)
    ];


% Plot

F = figure;
H = bar( categories, results );
grid off;
legend('Market', 'BS', 'BCRP'); %, 'UP', 'EG', 'ONS', 'AntiCor', 'PAMR', 'CWMR', 'OLMAR-S', 'OLMAR-E' )