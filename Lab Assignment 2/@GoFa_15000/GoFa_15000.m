classdef GoFa_15000 < RobotBaseClass
  
    %% LinearUR3 UR5 on a non-standard linear rail created by a student
    
    properties(Access = public)              
        plyFileNameStem = 'GoFa_15000';
    end
    
    methods
%% Define robot Function 
        function self = GoFa_15000(baseTr)
			self.CreateModel();
            if nargin < 1			
				baseTr = eye(4);				
            end
            self.model.base = self.model.base.T * baseTr * trotx(pi) * troty(pi);
            
            self.PlotAndColourRobot();
        end

%% Create the robot model
        function CreateModel(self)   
            % 
            link(1) = Link('d',0.4,'a',0.15,'alpha',pi/2,'qlim',deg2rad([-360 360]), 'offset',pi/2);
            link(2) = Link('d',0,'a',0.707,'alpha',0,'qlim', deg2rad([-360 360]), 'offset',pi/2);
            link(3) = Link('d',0,'a',-0.1,'alpha',pi/2,'qlim', deg2rad([-360 360]), 'offset', 0);
            link(4) = Link('d',-0.63,'a',0,'alpha',pi/2,'qlim',deg2rad([-360 360]),'offset', pi/2);
            link(5) = Link('d',0,'a',-0.07,'alpha',pi/2,'qlim',deg2rad([-360,360]), 'offset',0);
            link(6) = Link('d',0.06,'a',0,'alpha',0,'qlim',deg2rad([-360,360]), 'offset', 0);
            link(7) = Link('d',0.1,'a',0,'alpha',0,'qlim',deg2rad([-360,360]), 'offset', 0);
  
	            
            % % Incorporate joint limits
            link(1).qlim = [-180 180];
            link(2).qlim = [-180 180]*pi/180;
            link(3).qlim = [-225 85]*pi/180;
            link(4).qlim = [-180 180]*pi/180;
            link(5).qlim = [-180 180]*pi/180;
            link(6).qlim = [-270 270]*pi/180;

            %link(2).offset = pi/2;
            % link(3).offset = -pi/2;
            % link(5).offset = -pi/2;

            self.model = SerialLink(link,'name',self.name);
        end
     
    end
end