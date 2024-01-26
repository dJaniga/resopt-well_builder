classdef VerticalWell < Well
    properties(Access = private)
        vertical_md_in_m
    end
    
    methods(Access = public)
        function obj = VerticalWell(step_md_in_m, wellhead_z_in_m, vertical_md_in_m)
            obj = obj@Well(step_md_in_m, wellhead_z_in_m);

            obj.vertical_md_in_m = vertical_md_in_m;
            obj.well_type = WellType.Vertical;
        end

        function trajectory = build(obj)
            last_position = take_last_position(obj.trajectory);
            [t, a, st] = build_vertical_segment(last_position, ...
                obj.vertical_md_in_m, ...
                obj.step_md_in_m);
        end
    end
end

