function [U V] = embeddings(K, lambda, lambda_join)

load('cooccurence.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X = C; 
[N M] = size(X);
train_mask = ones(size(X));
% randomly initialize the user and movie latent factor matrices
U = randn(N,K);
V = randn(M,K);

lambda = 10; % l2 regularization constant for each latent factor (same for U and V). keep it fixed (should do reasonably)
lambda_join = 1000;
num_iters = 100; % number of iteratation of the alternating optimization procedure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for iter=1:num_iters
    for n=1:N
        U(n,:) = inv(V'*V + (lambda+lambda_join)*eye(K))*(V'*X(n,:)'+lambda_join*V(n,:)');
    end
    for m=1:M
        V(m,:) = inv(U'*U + (lambda+lambda_join)*eye(K))*(U'*X(:,m)+lambda_join*U(m,:)');
    end

end
E = (U+V)/2;

sum(sum(C.^2))/(291*291)
sum(sum((C-U*V').^2))/(291*291)
sum(sum((U-V).^2))/(291*5)
sum(sum(U.^2))/(291*291)

