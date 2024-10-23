% This file contains the main code for defining the dynamics of a 
% 2D rimless wheel moving on a slope
% The normal vector to the slope defines the reference axis
% positive angles are defined anticlockwise from the slope normal

close all
clear
clc

slope_angle = 10; % degrees
l = 0.5;   % spoke length in m
m = 0.5;  % mass in kg
I = 0.01;  % moment of inertia about center of mass/center of wheel in kgm^2
n = 7; % spokes

init_ang = pi/n; % initial angle
init_vel = -1.5; % initial angular velocity
init_con = [init_ang, init_vel];

stop_vel = 0.00001; % stop simulation if wheel angular velocity is less than this value

time_interval = [0 5]; % time interval for the ODE solution

% Solver setup
solver_type = 'ode45';
solver_max_step = 0.01;

% Plotting options
phase_plot = true;
fig_plot = true;
make_movie = true

% Run solver and plot
[y_sol, sol, event_sol, frame] = wheelSimulation(slope_angle, l, m, I, n, init_con, stop_vel, time_interval, solver_type, solver_max_step, phase_plot, fig_plot);

% make a video
t = sol(1,:);
len = length(t);
time_max = max(t); % end time for the solution
time_min = min(t); % start time of the solution (should be 0)

t_movie = time_min:solver_max_step*10:time_max; % time for the movie frame
% t_ind = zeros(length(t_movie))
for i = 1:length(t_movie)
    ind = find(abs(t - t_movie(i)) < solver_max_step/10);

    if length(ind) > 0
        if length(ind)>1
            ind = round(mean(ind));
        end
        t_ind(i) = ind;
    elseif isempty(ind)
        % do nothing
    end   
end

if fig_plot && make_movie
    frame = frame(t_ind);
    movie(frame, 1, 20);
end






