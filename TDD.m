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

%% test cal 1 a
% G_a = tf(1 * 10, [0.1 , 1, 0]);
% Phi_a = feedback(G_a, 1);
% A = tf(1, [0.01, 0.1, 1]);
% p = minreal(Phi_a);
% a = minreal(A);
% diff = minreal(p - a);
% disp(diff);

%% test cal 1 b
% G_a = tf(1 * 5, [0.1 , 1, 0]);
% Phi_a = feedback(G_a, 1);
% A = tf(50, [1, 10, 50]);
% p = minreal(Phi_a);
% a = minreal(A);
% diff = minreal(p - a);
% disp(diff);

%% test cal 1 c
% G_a = tf(1 * 20, [0.1 , 1, 0]);
% Phi_a = feedback(G_a, 1);
% A = tf(200, [1, 10, 200]);
% p = minreal(Phi_a);
% a = minreal(A);
% diff = minreal(p - a);
% disp(diff);

%% test cal 1 d
% G_a = tf(1 * 10, [0.2 , 1, 0]);
% Phi_a = feedback(G_a, 1);
% A = tf(50, [1, 5, 50]);
% p = minreal(Phi_a);
% a = minreal(A);
% diff = minreal(p - a);
% disp(diff);

%% test cal 1 e
% G_a = tf(1 * 10, [0.05 , 1, 0]);
% Phi_a = feedback(G_a, 1);
% A = tf(200, [1, 20, 200]);
% p = minreal(Phi_a);
% a = minreal(A);
% diff = minreal(p - a);
% disp(diff);