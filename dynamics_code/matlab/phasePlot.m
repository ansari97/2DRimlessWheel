function phasePlot(ang, vel, collision_angle)
%% define range
range = collision_angle*0.0001;

% find indices where collision occurs
% can also be got from the event time vector
ind = find(abs(abs(ang) - collision_angle) <= range);

figure;
plot(ang(1), vel(1), 'ko', 'MarkerSize', 10);
hold on;

% delete collision angle and vel value from the vector for plotting and
% store in a different array
ang_collision = ang(ind);
vel_collision = vel(ind);
ang(ind) = [];
vel(ind) = [];

% plot swing as back dots and collision transfer as red dots
plot(ang, vel, "k.");

for i = 1:length(ang_collision)
    if mod(i, 2) == 0
        plot([ang_collision(i) ang_collision(i+1)], [vel_collision(i) vel_collision(i+1)], 'r:');
    end
end
% plot(ang_collision(2:end), vel_collision(2:end), 'r:');

xline([-collision_angle collision_angle], 'b-');

xlim([-collision_angle, collision_angle]);
% ylim([-2, 2]);
% grid on;
hold off;

end