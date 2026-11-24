% This file is part of PrinciplesOfAutomaticControlC-project.
% Copyright (C) 2026 周诣成（Yicheng Zhou）XINICOM@outlook.com
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program. If not, see <https://www.gnu.org/licenses/

clear; clc; close all;

%% task 1-1
G_a = tf(10, [0.1 , 1, 0]);
G_b = tf(5 , [0.1 , 1, 0]);
G_c = tf(20, [0.1 , 1, 0]);
G_d = tf(10, [0.2 , 1, 0]);
G_e = tf(10, [0.05, 1, 0]);

Phi_a = feedback(G_a, 1);
Phi_b = feedback(G_b, 1);
Phi_c = feedback(G_c, 1);
Phi_d = feedback(G_d, 1);
Phi_e = feedback(G_e, 1);

figure();
step(Phi_a, Phi_b, Phi_c, Phi_d, Phi_e);
title("");
text(0.5, -0.1, '图 1-1 五组阶跃响应叠加图', ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'top', ...
    'FontSize', 12);
grid on;
xlabel("t", "Interpreter", "latex");
ylabel("$\theta(t)$", "Interpreter", "latex");
set(legend(), "String", {"$\Phi_{A}$", "$\Phi_{B}$", "$\Phi_{C}$", "$\Phi_{D}$", "$\Phi_{E}$"}, "Interpreter", "latex");

%% task 1-2
Result_half   = stepinfo(Phi_b);
Result_normal = stepinfo(Phi_a);
Result_double = stepinfo(Phi_c);

fprintf("KP = 0.5 调整时间：%f\n", Result_half.SettlingTime  );
fprintf("KP = 1   调整时间：%f\n", Result_normal.SettlingTime);
fprintf("KP = 2   调整时间：%f\n", Result_double.SettlingTime);