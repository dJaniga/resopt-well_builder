classdef VerticalWell < Well
    properties(Access = private)
        vertical_md_in_m
    end
    
    methods(Access = public)
        function obj = VerticalWell(wellhead_xyz_in_m, step_md_in_m, vertical_md_in_m)
            obj = obj@Well(wellhead_xyz_in_m, step_md_in_m);

            obj.vertical_md_in_m = vertical_md_in_m;
            obj.well_type = WellType.Vertical;
        end
    end

    methods(Access = protected)
        function obj = build(obj)
            last_position = take_last_position(obj.trajectory);
            [t, d, st] = build_vertical_segment(last_position, ...
                obj.vertical_md_in_m, ...
                obj.step_md_in_m);

            obj = obj.append(t,d,st);
        end
    end
end

