function gz_vals= compute_likelihood_clt(model,z,X)

% compute likelihood vector g= [ log_g(z|x_1), ... , log_g(z|x_M) ] -
% this is for bearings and range case with additive Gaussian noise

M= size(X,2);
P= X([2 4],:);
Phi= zeros(2,M);
Phi(1,:)= atan2(P(1,:),P(2,:));
Phi(2,:)= sqrt(sum(P.^2));
%增加
z_r(1,:)= atan2(z(1),z(2));
z_r(2,:)= sqrt(sum(z.^2));
e_sq= sum( (diag(1./diag(model.D_clt))*(repmat(z_r,[1 M])- Phi)).^2 );%有改动
gz_vals= exp(-e_sq/2 - log(2*pi*prod(diag(model.D_clt))));
% e_sq= sum( (diag(1./diag(model.D_clt))*(repmat(z,[1 M])- Phi)).^2 );
% gz_vals= exp(-e_sq/2 - log(2*pi*prod(diag(model.D_clt))));

