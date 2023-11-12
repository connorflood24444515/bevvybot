function Table()
    %place bar
    
    mesh_h = PlaceObject('bardesign.PLY');
    vertices = get(mesh_h, 'Vertices');

    transformedVertices = [vertices,ones(size(vertices,1),1)]';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    scale = 0.0015;  %since object was too large upon import, scale of extinguisher was reduced.
    vertices = vertices * scale;

    transformedVertices = [vertices,ones(size(vertices,1),1)] * transl(0,0,0.75)' * trotx(3*(pi/2))' * troty(pi)' *trotz(-pi/2);
    set(mesh_h,'Vertices',transformedVertices(:,1:3));


    timberColor = [139/255, 69/255, 19/255];  % RGB for a type of timber brown
    set(mesh_h, 'FaceColor', timberColor); 

    

    
    





end

