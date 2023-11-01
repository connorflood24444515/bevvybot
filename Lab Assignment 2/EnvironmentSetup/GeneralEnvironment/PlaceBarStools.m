function PlaceBarStools

    translations = [
        0.75,0,0;
        0.75,-0.9,0
        0.75,0.9,0;
    ];

    % Plot and create the bricks based on their translations
    rotation = eye(3);   % Identity rotation matrix

    for i = 1:size(translations, 1)  % Iterate over each translation row
        transformation_matrix2 = [rotation, translations(i, :)'; 0, 0, 0, 1];  % Construct the transformation matrix
        BarStools(transformation_matrix2);  % Call function to place the beer glass at the specified location
    end

end

