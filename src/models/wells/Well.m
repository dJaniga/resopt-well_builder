classdef (Abstract) Well < handle
    properties(Access = public)
        
        wellhead_position = [NaN, NaN, NaN] % X, Y, Z [m]
        trajectory = [NaN, NaN, NaN]
        rotate_azimuth = 0.0

        segments_type = [SegmentType.Wellhead]  
        deviation = [NaN]
        
        step_md_in_m  
        well_type

    end

    methods(Access = public)
        function obj = Well(wellhead_xyz_in_m, step_md_in_m)
            
            obj.step_md_in_m = step_md_in_m;
            
            if not(size(wellhead_xyz_in_m, 2) == 3)
                error("wellhead_xyz_in_m must be matrix[1x3]")
            end
            obj.wellhead_position(1) =  wellhead_xyz_in_m(1);
            obj.wellhead_position(2) =  wellhead_xyz_in_m(2);
            obj.wellhead_position(3) = wellhead_xyz_in_m(3);
            
            obj.trajectory = [0, 0, obj.wellhead_position(3)];
        end

        function export(obj)
            obj.build()
            obj.rotate()
            obj.move()
        end

    end

    methods(Access=protected)
        function obj = append(obj, trajectory, deviation, segments_type)
            obj.trajectory = cat(1, obj.trajectory, trajectory);
            obj.deviation = cat(1, obj.deviation, deviation);
            obj.segments_type = cat(1, obj.segments_type, segments_type);
        end

        function obj = move(obj)
            x_wellhead = obj.wellhead_position(1);
            y_wellhead = obj.wellhead_position(2);

            obj.trajectory = move_well(obj.trajectory, x_wellhead, y_wellhead);
        end

        function obj = rotate(obj)
            obj.trajectory = rotate_well(obj.trajectory, obj.rotate_azimuth);
        end
    end

    methods(Abstract, Access=protected)
        build(obj)
    end
end

