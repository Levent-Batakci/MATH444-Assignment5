%Levent Batakci
%4/6/2021
%Assignment 5 - NMF and blind signal separation

%Load the data
load SoundSourceData.mat
%X = X'; %Transpose to get in in the form we need

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
sgtitle("Approximate Signals", "FontSize", 30);

subplot(2,2,1);
plot(H(1,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(2,2,2);
plot(H(2,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(2,2,3);
plot(H(3,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(2,2,4);
plot(H(4,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

%Size of error
err4 = norm(X - W*H, "fro")

%r too small
r=3;
[W, H] = NMF(X, r, tol);
[W, H] = Rescale(W,H); %Scale the rows of H
err3 = norm(X - W*H, "fro")
figure(3)

subplot(1,3,1);
plot(H(1,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(1,3,2);
plot(H(2,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(1,3,3);
plot(H(3,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

%r too big
figure(4)
r=6;
tol=0.0001;
[W, H] = NMF(X, r, tol);
[W, H] = Rescale(W,H); %Scale the rows of H
err5 = norm(X - W*H, "fro")
subplot(2,3,1);
plot(H(1,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(2,3,2);
plot(H(2,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(2,3,3);
plot(H(3,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(2,3,4);
plot(H(4,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(2,3,5);
plot(H(5,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);

subplot(2,3,6);
plot(H(6,:));
xlim([0 1000]);
ylim([0 1.1]);
xlabel("Time Step");
ylabel("Sound Recorded");
set(gca,"FontSize", 20);


