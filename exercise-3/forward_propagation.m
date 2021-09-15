function out = forward_propagation(A)
%% Settings the hyperparameters
num_hidden_layers = 2;
num_nodes = 2; 
% weights initializations
W1 = [0.49 0.2; 0.09 0.2]; 
W2 = [0.29 -0.1; 0.19 0.1];
W3 = [0.07 -0.17; 0.1 0.2];
W = {W1, W2, W3};
% bias initializations
b1 = [0.1, 0.1]; 
b2 = [0.18, -0.1]; 
b3 = [0.04, 0.06];
B = {b1, b2, b3};
%% Forward propagation
% input layer
in = A;
% hidden layers
for i = 1 : num_hidden_layers
    out = zeros(num_nodes, 1);
    for j = 1 : num_nodes
        z = dot(W{i}(:,j),in) + B{i}(j);
        out(j) = relu(z);
    end
    in = out;
end
% output layer
out = zeros(num_nodes, 1);
for i = 1 : num_nodes
    z = dot(W{num_hidden_layers+1}(:,i),in) + B{num_hidden_layers+1}(i);
    out(i) = z;
end
out = softmax(out);
end
%% Activation functions
% ReLU
function R = relu(z)
R = max(0, z);
end
% softmax
function R = softmax(Z)
z_exp = exp(Z);
partition = sum(z_exp);
R = z_exp./ partition;
end