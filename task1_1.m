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
set(legend(), "String", ...
    {"$\Phi_{A}$", "$\Phi_{B}$", "$\Phi_{C}$", ...
    "$\Phi_{D}$", "$\Phi_{E}$"}, "Interpreter", "latex");

%% task 1-2
Result_half   = stepinfo(Phi_b);
Result_normal = stepinfo(Phi_a);
Result_double = stepinfo(Phi_c);

fprintf("Kp = 0.5\n\t调整时间：%.3f\n\t超调量：%.3f%%\n\n", ...
    Result_half.SettlingTime, ...
    Result_half.Overshoot);
fprintf("Kp = 1\n\t调整时间：%.3f\n\t超调量：%.3f%%\n\n", ...
    Result_normal.SettlingTime, ...
    Result_normal.Overshoot);
fprintf("Kp = 2\n\t调整时间：%.3f\n\t超调量：%.3f%%\n\n", ...
    Result_double.SettlingTime, ...
    Result_double.Overshoot);

% deviation reason
figure();
hold on;
sp = stepplot(Phi_b, Phi_a, Phi_c);
sp.Characteristics.SettlingTime.Visible = true;
title("");
text(0.5, -0.1, '图 1-4-1 调整时间图示', ...
    'Units', 'normalized', ...
    'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'top', ...
    'FontSize', 12);
grid on;
xlabel("t", "Interpreter", "latex");
ylabel("$\theta(t)$", "Interpreter", "latex");
set(legend(), "String", ...
    {"$\Phi_{1}$", "$\Phi_{2}$", "$\Phi_{3}$"}, ...
    "Interpreter", "latex");
% plot([Result_half.SettlingTime Result_half.SettlingTime], ...
%     [0 1], 'r--', 'LineWidth', 0.5, 'DisplayName', ...
%     ['t_s = ' num2str(Result_half.SettlingTime, '%.3f') 's']);

%% task 1-3
% Method 1
[y1, t1] = step(Phi_b);
ess1 = 1 - y1(end);

[y2, t2] = step(Phi_a);
ess2 = 1 - y2(end);

[y3, t3] = step(Phi_c);
ess3 = 1 - y3(end);

fprintf("方法一：\n\tKp = 0.5\n\t\t稳态误差：%f\n", ess1);
fprintf("方法一：\n\tKp = 1\n\t\t稳态误差：%f\n", ess2);
fprintf("方法一：\n\tKp = 2\n\t\t稳态误差：%f\n", ess3);

% deviation reason
% Method 2
K_1 = dcgain(G_b);
ess1 = 1 / (1 + K_1);

K_2 = dcgain(G_a);
ess2 = 1 / (1 + K_2);

K_3 = dcgain(G_c);
ess3 = 1 / (1 + K_3);

fprintf("方法二：\n\tKp = 0.5\n\t\t稳态误差：%f\n", ess1);
fprintf("方法二：\n\tKp = 1\n\t\t稳态误差：%f\n", ess2);
fprintf("方法二：\n\tKp = 2\n\t\t稳态误差：%f\n", ess3);