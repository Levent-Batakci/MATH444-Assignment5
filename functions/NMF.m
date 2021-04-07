function [W, H] = NMF(X, r, tol)
% X approx= WH

[n,p] = size(X);

t = 0;

Wo = rand(n,r);
Ho = rand(r,p);
W = Wo;
H = Ho;

while t==0 || (norm(W - Wo, 'fro')/norm(Wo, 'fro') + norm(H - Ho, 'fro')/norm(Ho, 'fro') > tol)
    %Move forward!
    Wo = W;
    Ho = H;
    
    %Wo is W^(t), same for Ho
    %W is W^(t+1), same for H
    
    %Update W
    Xc = Wo * Ho; %approximation of X
    W = ((X*Ho') ./  (Xc * Ho')) .* Wo;
    
    Xc = W * Ho; %approximation of X
    H = ((W'*X) ./ (W'*Xc)) .* Ho;
    
    t=t+1;
end

end

