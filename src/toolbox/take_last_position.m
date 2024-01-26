function out = take_last_position(trajectory)
    x = trajectory(end,1);
    y = trajectory(end,2);
    z = trajectory(end,3);
    out(:) = [x,y,z];
end

