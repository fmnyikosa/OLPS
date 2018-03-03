% this function initilaizes a Bayesian optimization model for
% Online Portfilio Selection
%
% (c) Copyright Favour M Nyikosa <favour@nyikosa.com> March 3rd 2018

function model = initBayesOptModelOLPS()

% We assume that data is 2D - {time, param}

% pre-data configurations
settings                   = getDefaultGPMetadataGPML();
settings.hyp_opt_mode      = 2;

% GP model 

gpModel                    = {{'infGaussLik'},{'meanZero'},{'covOLPS'},{'likGauss'}};                              
hyperparameters.mean       = [];
l                          = 3;
sf                         = 1;
hyperparameters.cov        = log([l; l; sf]);
sn                         = 0.1;
hyperparameters.lik        = log(sn);
settings.gpModel           = gpModel;
settings.hyp               = hyperparameters;

% Data settings

settings.hyp_opt_mode_nres = 50;
settings.hyp_bounds_set    = 1;
settings.hyp_lb            = log([0.1,   0.1,  0.1,  0.1]);
settings.hyp_ub            = log([10.0, 10.0, 350, 10]);

% ABO settings

max_t_train                = -4;
max_t_test                 =  5;

settings.abo               = 1;
settings.current_time_abo  = 1;

settings.initial_time_tag  = max_t_train;
settings.time_delta        = 0.1;
settings.final_time_tag    = max_t_test;

%settings                   = getDefaultBOSettingsEL_ABO(x0, iters, settings);
%settings                   = getDefaultBOSettingsEL(x0, iters, settings);
%settings                   = getDefaultBOSettingsLCB_ABO(x0, iters, settings);
settings                    = getDefaultBOSettingsLCB(x0, iters, settings);
%settings                   = getDefaultBOSettingsMinMean_ABO(x0, iters, settings);
%settings                   = getDefaultBOSettingsMinMean(x0, iters, settings);

settings.xt                 = xt;
settings.yt                 = yt;

% post data settings


model = settings;

end