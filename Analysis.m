%Levent Batakci
%4/6/2021
%Assignment 5 - NMF and blind signal separation

%Load the data
load SoundSourceData.mat
X = X'; %Transpose to get in in the form we need

%Plot the actual signals
figure(1)
sgtitle("Actual Signals");
subplot(2,2,1);
plot(F(1,:));
subplot(2,2,2);
plot(F(2,:));
subplot(2,2,3);
plot(F(3,:));
subplot(2,2,4);
plot(F(4,:));
%These are what we are hoping to find through the NMF


%Use NMF to try to find the signals
%Initially, we will try r=4 (a correct "guess")
r=4;
tol=0.00001;

[W, H] = NMF(X, r, tol);
[W, H] = Rescale(W,H); %Scale the rows of H

figure(2)
sgtitle("Approximate Signals");
subplot(2,2,1);
plot(W(:,1));
subplot(2,2,2);
plot(W(:,2));
subplot(2,2,3);
plot(W(:,3));
subplot(2,2,4);
plot(W(:,4));

%Size of error
err4 = norm(X - W*H, "fro")

%r too small
r=3;
[W, H] = NMF(X, r, tol);
[W, H] = Rescale(W,H); %Scale the rows of H
err3 = norm(X - W*H, "fro")

%r too big
r=10;
tol=0.001;
[W, H] = NMF(X, r, tol);
[W, H] = Rescale(W,H); %Scale the rows of H
err5 = norm(X - W*H, "fro")

