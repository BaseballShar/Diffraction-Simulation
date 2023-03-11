function diffRectangular(widthToLength)
%DIFFRECTANGULAR Generates visualization for the diffraction pattern of a single rectangular slit
%   This function takes the slit width to wavelength of light as argument
%   to generate diffraction pattern.
%   The ratio must be between 5 and 25.
%   Assumption: screen width = 5cm, distance to screen from slit = 10cm

% Checks the validity of input
if (class(widthToLength) ~= "double")
    disp("Invalid input, ratio must be a double")
    return
elseif (widthToLength < 5 || widthToLength > 25)
    disp("Invalid input, ratio must be between 5 and 25.")
    return
end

% Generates possible diffraction angles (according to screen width and
% distance)
thetaMax = atan(1/4);
theta = linspace(-thetaMax, thetaMax, 1000);

% Defines intermediate variable to simplify expression
k = pi * widthToLength * sin(theta);

% Let I_0 = 1 (Value = multiple of I_0)
I = (sin(k)./k).^2;

% Plots the diffraction pattern
xlim = [0, 1];
ylim = [-2.5, 2.5]; % screen width = 5cm
clim = [0, 0.75]; % enhance brightness of fringes
subplot(1, 2, 1)
imagesc(xlim, ylim, I', clim)

% Adds titles and labels
titleText = "Diffraction pattern through a rectangular slit (a/\lambda = " + widthToLength + ")";
title(titleText)
ylabel("Vertical distance (cm)")
colorbar

% Plots the intensity distribution
subplot(1, 2, 2)
plot(I, theta);
titleText = "Intensity distribution";
title(titleText)
ylabel("Vertical distance (cm)")
end

