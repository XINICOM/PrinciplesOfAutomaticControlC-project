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

clear; clc;

K_p = 1;

G_a = tf(K_p * 10, [0.1 , 1, 0]);
G_b = tf(K_p * 5 , [0.1 , 1, 0]);
G_c = tf(K_p * 20, [0.1 , 1, 0]);
G_d = tf(K_p * 10, [0.2 , 1, 0]);
G_e = tf(K_p * 10, [0.05, 1, 0]);

Phi_a = feedback(G_a, 1);
Phi_b = feedback(G_b, 1);
Phi_c = feedback(G_c, 1);
Phi_d = feedback(G_d, 1);
Phi_e = feedback(G_e, 1);

figure();
step(Phi_a, Phi_b, Phi_c, Phi_d, Phi_e);
xlabel("t");
ylabel("X(t)");
legend('\Phi_A', '\Phi_B', '\Phi_C', '\Phi_D', '\Phi_E');
