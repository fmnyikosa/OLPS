% This function makes a prediction from the BayesOpt model
%
% Copyright (c) Favour Mandanji Nyikosa <favour@nyikosa.com> 3-MAR-2018

function [mean, var, model] = predictBayesOptModel(xs, model)

xt        = model.xt;
yt        = model.yt;

if isfield(model,'windowing') && model.windowing==1 && (size(xt,1)>model.window)
                                                       
    x     = xt( end - (model.window - 1): end, : );
    y     = yt( end - (model.window - 1): end, : );

end




end