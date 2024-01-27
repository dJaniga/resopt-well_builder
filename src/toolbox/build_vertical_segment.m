function [trajectory, deviation, segment_type] = build_vertical_segment(last_position, ...
    segment_length_md_in_m, ...
    segment_step_in_m)

VERTICAL_DEVIAITION = 90.0;
VERTICAL_SEGMENT_TYPE = SegmentType.Vertical;

if not(size(last_position, 2) == 3)
    error("start_position must be matrix[1x3]")
end

    x_last = last_position(1);
    y_last = last_position(2);
    z_last = last_position(3);
    
    path = segment_divider(segment_length_md_in_m, segment_step_in_m);

    trajectory = [x_last*ones(length(path),1),...
                  y_last*ones(length(path),1),...
                  (path+z_last).'];

    deviation = VERTICAL_DEVIAITION * ones(length(path),1); 

    segment_type = repmat(VERTICAL_SEGMENT_TYPE, [length(path), 1]);
end

