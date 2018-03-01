% Draw bar graphs of results
% Metric: Annualized Percentage Yield (APY)
%
% (c) Copyright Favour M Nyikosa <favour@nyikosa.com> 1st March 2018

categories = categorical( ...
    { 'DJIA', 'SP500', 'TSE', 'MSCI', 'NYSE(O)', 'NYSE(N)' });

D  = [];
S  = [];
T  = [];
M  = [];
NO = [];
MM = [];

results    = [            ...
    D; ... DJIA
    S; ... SP500
    T; ... TSE
    M; ... MSCI
    NO; ... NYSE(O)
    NN; ... NYSE(N)
    ];
