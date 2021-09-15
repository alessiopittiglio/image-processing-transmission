function [C,MSE] = jpeg_compression(A)
%% Quantization matrix for a quality of 50% (as specified in the original JPEG Standard).
Q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 78 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];
%% JPEG compression
% Subtract 128 from each pixel value.
M = A - 128;

% Perform the DCT.
D = dct2(M);

% Compression by quantization.
C = round(D./ Q);
%% JPEG decompression
% Do the entry-for-entry product with the quantization matrix.
R = C.* Q;

% Perform the two-dimensional inverse DCT, round the output to integer values
% and add 128 to each entry.
N = round(idct2(R)) + 128;
%% Comparison of matrices
E = A - N;

% Mean squared error
D =  abs(E./A).^2;
MSE = sum(D(:))/numel(A);
end