function h = myimhist(A)
% Create a frequency array of size 256
h = zeros(256,1);

% Iterate over grayscale image matrix 
% for every possible intensity value
% and count them
for i = 1 : 256
    h(i) = sum(A(:) == i-1);
end

% Display histogram
n = 0 : 255;
stem(n,h,'Marker','none');
axis([0 256 0 15000]),
end
