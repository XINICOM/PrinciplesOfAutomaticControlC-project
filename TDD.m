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

%% test cal 1 a
G_a = tf(1 * 10, [0.1 , 1, 0]);
Phi_a = feedback(G_a, 1);
A = tf(1, [0.01, 0.1, 1]);
p = minreal(Phi_a);
a = minreal(A);
diff = minreal(p - a);
disp(diff);