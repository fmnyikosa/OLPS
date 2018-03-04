% This function trains the BayesOpt model
%
% Copyright (c) Favour Mandanji Nyikosa <favour@nyikosa.com> 3-MAR-2018


function model = trainBayesOptModel(model)

xt        = model.xt;
yt        = model.yt;

if isfield(model,'windowing') && model.windowing==1 && (size(xt,1)>model.window)
                                                       
    xt     = xt( end - (model.window - 1): end, : );
    yt     = yt( end - (model.window - 1): end, : );

end

model.x   =  xt;
model.y   =  yt;

if model.streamlined == 1 

    model.gpDef           = gpModel;
    hyperparams_          = model.streamlined_hyp;
    model.training_hyp    = hyperparams_;

else
    
    %model.hyp
    %model.gpModel{3}

    [hyperparams_, model] = trainGP( model.x , model.y , model.hyp , model.gpModel , model );
    model.training_hyp    = hyperparams_;
    model.streamlined_hyp = hyperparams_;
    
    hyperparams_.cov
    hyperparams_.lik

end

end