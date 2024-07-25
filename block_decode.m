function bit_vec = block_decode(bit_vec_enc)
% Decode encoded bit vector according to a set H matrix
% The G and H matrix are linked by right submatrix of G
% and the top submatrix of H are the same, with an eye 
% matrix padding the left and bottom, respectively.

% % Debug inputs
% clear; clc;
% bit_vec_enc = [0,1,1,1,0,1,0];

% Make row vector if it isn't already
if size(bit_vec_enc,1) ~= 1
    bit_vec_enc = bit_vec_enc.';
end

H = [[1,0,1;1,1,1;1,1,0;0,1,1]; eye(3)];

s = mod(bit_vec_enc * H,2);

if sum(s,"all") ~= 0
    if s == [0,0,1]
        e = [0,0,0,0,0,0,1];
    elseif s == [0,1,0]
        e = [0,0,0,0,0,1,0];
    elseif s == [0,1,1]
        e = [0,0,0,1,0,0,0];
    elseif s == [1,0,0]
        e = [0,0,0,0,1,0,0];
        % rnd_num = rand;
        % if rnd_num < 0.5
        %     e = [0,0,0,0,1,0,0];
        % else
        %     e = [1,0,0,0,0,0,1];
        % end
    elseif s == [1,0,1]
        e = [1,0,0,0,0,0,0];
    elseif s == [1,1,0]
        e = [0,0,1,0,0,0,0];
    elseif s == [1,1,1]
        e = [0,1,0,0,0,0,0];
    end
else
    e = zeros(1,7);
end

bit_vec_cor = mod(bit_vec_enc + e,2);
bit_vec = bit_vec_cor(1:4);