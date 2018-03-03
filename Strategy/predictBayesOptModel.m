% This function makes a prediction from the BayesOpt model
%
% Copyright (c) Favour Mandanji Nyikosa <favour@nyikosa.com> 3-MAR-2018

function [ mean_, var_ ] = predictBayesOptModel( xs , model )

x              = model.x;
y              = model.y;
[mean_, var_]  = getGPResponse( xs, x, y, model.training_hyp, model.gpModel, model);

end