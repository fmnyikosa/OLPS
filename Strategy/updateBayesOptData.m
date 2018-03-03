% This function updates the data of a BayesOpt model
%
% Copyright (c) Favour Mandanji Nyikosa <favour@nyikosa.com> 3-MAR-2018

function model = updateBayesOptData( x, y, model )

xt             = [ model.xt;  x ];
yt             = [ model.yt;  y ];

model.xt       = xt;
model.yt       = yt;

end