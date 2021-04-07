function [Wnew, Hnew] = Rescale(W,H)
%Rescales the NMF so that the maximum of each row of H is 1.

hMaxes = max(H');
Hnew = H ./ hMaxes';

Wnew = W .* hMaxes;
end

