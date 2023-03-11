function diffCircular(radiusToLength)
%DIFFCIRCULAR Generates visualization for the diffraction pattern of a single circular aperture
%   This function takes the radius of aperture to wavelength of light as argument
%   to generate diffraction pattern.
%   The ratio must be between 5 and 25.
%   Assumption: screen width and height = 5cm, distance to screen from slit = 10cm

% Checks the validity of input
if (class(radiusToLength) ~= "double")
    disp("Invalid input, ratio must be a double")
    return
elseif (radiusToLength < 5 || radiusToLength > 25)
    disp("Invalid input, ratio must be between 5 and 25.")
    return
end

% Generates possible diffraction angles (according to screen width and
% distance)
[x, y] = meshgrid(-2.5:0.01:2.5, -2.5:0.01:2.5);
theta = atan(sqrt(x.^2 + y.^2)/10);

% Defines intermediate variable to simplify expression
k = 2 * pi * radiusToLength * sin(theta);

% Let I_0 = 1 (Value = multiple of I_0)
I = (2 * besselj(1, k) ./ k).^2;

% Plots the diffraction pattern
xlim = [-2.5, 2.5];
ylim = [-2.5, 2.5];

% Enhance colour depending on different setups
if radiusToLength < 10
    clim = [0, 0.8];
elseif radiusToLength < 15
    clim = [0, 0.6];
elseif radiusToLength < 20
    clim = [0, 0.4];
else
    clim = [0, 0.2];
end

subplot(1, 2, 1)
imagesc(xlim, ylim, I, clim)
pbaspect([1, 1, 1])

% Adds titles and labels
titleText = "Diffraction through a circular slit (a/\lambda = " + radiusToLength + ")";
title(titleText)
xlabel("Horizontal distance (cm)")
ylabel("Vertical distance (cm)")
colorbar

% Plots the intensity distribution
subplot(1, 2, 2)
mesh(x, y, I)
pbaspect([1, 1, 1])
titleText = "Intensity distribution";
title(titleText)
xlabel("Horizontal distance (cm)")
ylabel("Vertical distance (cm)")
end



