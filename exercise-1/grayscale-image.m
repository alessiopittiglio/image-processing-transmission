% Read in the image.
A = imread('mare','jpg');

% Display the original color image.
subplot(2, 3, 1);
imshow(A);
title('Original image');

% Extract the individual red, green, and blue color channels.
redChannel = A(:, :, 1);
greenChannel = A(:, :, 2);
blueChannel = A(:, :, 3);

% Display the individual color channels.
subplot(2, 3, 2);
imshow(redChannel);
title('Red channel');
subplot(2, 3, 3);
imshow(greenChannel);
title('Green channel');
subplot(2, 3, 4);
imshow(blueChannel);
title('Blue channel');

% Generate a grayscale image using average method.
I = (redChannel + greenChannel + blueChannel) / 3;
subplot(2, 3, 5);
imshow(I);
title('Grayscale image (average method)');

% Generate a grayscale image using the NTSC formula.
I_NTSC = 0.299 * redChannel + 0.587 * greenChannel + 0.114 * blueChannel;
subplot(2, 3, 6);
imshow(I_NTSC);
title('Grayscale image (NTSC formula)');
