function bit_vec_enc = block_encode(bit_vec)
% Encode a bit vector according to a set G matrix
% The G and H matrix are linked by right submatrix of G
% and the top submatrix of H are the same, with an eye 
% matrix padding the left and bottom, respectively.

% % Debug inputs
% clear; clc;
% bit_vec = [0,1,1,1];

% Make row vector if it isn't already
if size(bit_vec,1) ~= 1
    bit_vec = bit_vec.';
end

G = [eye(4) [1,0,1;1,1,1;1,1,0;0,1,1]];

bit_vec_enc = mod(bit_vec * G,2);