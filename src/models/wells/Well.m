classdef (Abstract) Well    
    properties(Access = protected)
        trajectory
        well_type
    end

    properties(Access=protected)
        wellhead_position = [NaN, NaN, NaN] % X, Y, Z [m]
        segments = [SegmentType.Wellhead]    
        step_md_in_m = NaN                  
    end
    
    methods(Access = public)
        function obj = Well(step_md_in_m, wellhead_z_in_m)
            obj.step_md_in_m = step_md_in_m;
            obj.wellhead_position(3) = wellhead_z_in_m;
            obj.trajectory = [0, 0, wellhead_z_in_m];
        end
    end

    methods(Abstract)
        build(obj)
    end
end

