%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Yue M. Lu and Minh N. Do
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	rcos.m
%	
%   First Created: 08-26-05
%	Last Revision: 07-13-09
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function theta = rcos(x)

%   The raised cosine function

theta = 0.5 * (1 - cos(pi*x));

theta(x <= 0) = 0;
theta(x >= 1) = 1;