%% MATLAB Fundamentals
%  Review Project 1: Women's 200m Backstroke

clear % clear workspace variables
clc % clear command window

%% Load the data

load backstroke

%% Horizontally concatenate column of zeros to time

time = [zeros(8,1) time];

%% Create plot of time vs distance

distance = 0:50:200;
plot(distance,time,'*-')

%% Add legend with swimmers' names

legend(name)

%% Subtract time from fastest time at each distance

time_diff = time - min(time);

%% Plot time differences vs distance in a new figure

figure
plot(distance, time_diff, '*-')

%% Add legend with country codes

legend(country)