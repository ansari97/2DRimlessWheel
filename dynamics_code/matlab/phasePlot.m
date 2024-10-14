function phasePlot(ang, vel, collision_angle)
%% define range
range = collision_angle*0.0001;

% find indices where collision occurs
% can also be got from the event time vector
ind = find(abs(abs(ang) - collision_angle) <= range);

% delete collision angle and vel value from the vector for plotting and
% store in a different array
ang_collision = ang(ind);
vel_collision = vel(ind);
ang(ind) = [];
vel(ind) = [];

% plot swing as back dots and collision transfer as red dots
figure;
plot(ang, vel, "k.");
hold on;
plot(ang_collision, vel_collision, 'r:');

xline([-collision_angle collision_angle], 'b-');

xlim([-collision_angle, collision_angle]);
% ylim([-2, 2]);
% grid on;
hold off;

end