% this function initilaizes a Bayesian optimization model for
% Online Portfilio Selection
%
% (c) Copyright Favour M Nyikosa <favour@nyikosa.com> March 3rd 2018

function model = initBayesOptModelOLPS()

% We assume that data is 2D - {time, param}

% Pre-data configurations

settings                    = getDefaultGPMetadataGPML();
settings.hyp_opt_mode       = 2;

% GP model 

gpModel                     = {{'infGaussLik'},{'meanZero'},{'covOLPS'},{'likGauss'}};                              
hyperparameters.mean        = [];
l                           = 3;
sf                          = 1;
hyp_t                       = [l; sf; l; sf];
hyp_s                       = [l; sf; alpha];
hyperparameters.cov         = log( [ hyp_t; hyp_s ] );
sn                          = 0.1;
hyperparameters.lik         = log(sn);
settings.gpModel            = gpModel;
settings.hyp                = hyperparameters;

% Data settings

settings.hyp_opt_mode_nres  = 50;
settings.hyp_bounds_set     = 1;
settings.hyp_lb             = log([ 0.01, 0.001, 0.01, 0.001,  0.01, 0.001, 0.001, 0.00001 ]);
settings.hyp_ub             = log([ 10.0, 3.000, 10.0, 3.000,  10.0, 3.000, 2.000, 0.20000 ]);

% ABO settings

max_t_train                 = 5000;
max_t_test                  = 5000;

settings.abo                = 1;
settings.current_time_abo   = 1;

settings.initial_time_tag   = max_t_train;
settings.time_delta         = 1;
settings.final_time_tag     = max_t_test;

settings                    = getDefaultBOSettingsLCB(x0, iters, settings);
%settings                   = getDefaultBOSettingsEL(x0, iters, settings);
%settings                   = getDefaultBOSettingsMinMean(x0, iters, settings);

% Post data settings

settings.optimiseForTime    = 0;
settings.burnInIterations   = 5;

settings.acq_opt_mode       = 9;
settings.acq_opt_mode_nres  = 5;

settings.tolX               = eps;
settings.tolObjFunc         = eps;

settings.acq_bounds_set     = 1;
settings.acq_lb             = lb;
settings.acq_ub             = ub;
settings.acq_lb_            = lb_;
settings.acq_ub_            = ub_;
% settings.true_func        = @(x) stybtang_func_bulk(x);
% settings.true_func_bulk   = @(x) stybtang_func_bulk(x);
settings.closePointsMax     = 0;

settings.animateBO          = 0;
settings.animatePerformance = 0;
settings.finalStepMinfunc   = 0;   % perform minfunc after using a global method
settings.mcmc               = 0;
settings.standardized       = 0;
settings.abo                = 1;

settings.nit                = -500;
settings.streamlined        = 0;
settings.num_grid_points    = 1500;

settings.flex_acq           = 0; % flexible acquisition

%settings.streamlined       = 0;
h_                          = load('1_hyp.mat');
settings.streamlined_hyp    = h_.hyperparameters;
%settings.true_opts_flag    = 1;

settings.windowing          = 1;
settings.window             = 300;
settings.resetting          = 0;

settings.alg                = 'ABO';

model                       = settings;

end