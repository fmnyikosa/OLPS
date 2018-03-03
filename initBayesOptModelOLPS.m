% this function initilaizes a Bayesian optimization model for
% Online Portfilio Selection
%
% (c) Copyright Favour M Nyikosa <favour@nyikosa.com> March 3rd 2018

function model = initBayesOptModelOLPS()

settings                   = getDefaultGPMetadataGPML();
settings.hyp_opt_mode      = 2;

settings.hyp_opt_mode_nres = 50;
settings.hyp_bounds_set    = 1;
settings.hyp_lb            = log([0.1,   0.1,  0.1,  0.1]);
settings.hyp_ub            = log([10.0, 10.0, 350, 10]);

covfunciso                 = {'covSum', {'covSEiso','covPeriodic_'}};
covfuncperard              = {'covPERard',{@covSEard}};
covfuncard                 = {'covSum', {'covSEard', covfuncperard}};
covOLPS                    = 

gpModel                    = { {'infGaussLik'},    {'meanZero'} ,...
                               covOLPS, {'likGauss'} };
hyperparameters.mean       = [];
l                          = 5;
p                          = 0.5;
sf                         = 250;
hyperparameters.cov        = log([l; l; sf]);
sn                         = 0.1;
hyperparameters.lik        = log(sn);

model = settings;

end