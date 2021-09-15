# Exercise 4

Write a MATLAB function that implements the following block diagram where the input is an 8x8 block of an image with 256-level gray components. Then reconstruct an estimate of F through JPEG decompression and evaluate the mean square error between F and its reconstructed version.

<img width="600" alt="block-diagram" src="https://user-images.githubusercontent.com/72530555/119264713-89934600-bbe4-11eb-9975-cb687f5dbf93.png">

I suppose I have the following matrix as input.

<img width="580" alt="Immagine 2021-05-20 235238" src="https://user-images.githubusercontent.com/72530555/119264766-bd6e6b80-bbe4-11eb-9abd-14e7bc1035de.png">

## JPEG compression

By shift the pixels in the range [-128,127] we get

<img alt="1" src="https://user-images.githubusercontent.com/72530555/119266850-b77c8880-bbec-11eb-8acb-e3848964d382.png">

By calculating the DCT we get

<img alt="2 - Copia" src="https://user-images.githubusercontent.com/72530555/119266930-032f3200-bbed-11eb-8f22-8ef328befc0d.png">

from which we get

<img alt="2" src="https://user-images.githubusercontent.com/72530555/119266996-49849100-bbed-11eb-8aab-3e4e521e1944.png">

## JPEG decompression

Assuming there were no errors on the channel, the receiver can reconstruct in the following manner

<img alt="3" src="https://user-images.githubusercontent.com/72530555/119267088-8e102c80-bbed-11eb-878b-2d0b8bd3d03c.png">

Doing the inverse transform, rounding each component to the nearest integer, and adding 128 to compensate for the shift we get

<img alt="4" src="https://user-images.githubusercontent.com/72530555/119267246-f5c67780-bbed-11eb-98e0-b1e851889618.png">

from which MSE = 0.0075.
