function gz_vals= compute_likelihood_tg(model,z,X)

% compute likelihood vector g= [ log_g(z|x_1), ... , log_g(z|x_M) ] -
% this is for bearings and range case with additive Gaussian noise

M= size(X,2);
P= X([2 4],:);
Phi= zeros(2,M);
Phi(1,:)= atan2(P(1,:),P(2,:));
Phi(2,:)= sqrt(sum(P.^2));
%增添
z_r(1,:)= atan2(z(1),z(2)); z_r(2,:)= sqrt(sum(z.^2)); 
e_sq= sum((diag(1./diag(model.D_r))*(repmat(z_r,[1 M])- Phi)).^2 );%此处有改动 
gz_vals=exp(-e_sq/2 - log(2*pi*prod(diag(model.D_r))));%此处有改动model.D_r
% e_sq= sum( (diag(1./diag(model.D))*(repmat(z,[1 M])- Phi)).^2 );
% gz_vals= exp(-e_sq/2 - log(2*pi*prod(diag(model.D))));
