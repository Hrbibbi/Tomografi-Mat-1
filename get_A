function A = get_A(a,N,m)
% Computes the matrix A that we described (Radon transformation)
%
% inputs:
%   a - parameter describing the size of the region B
%   N - number of cells in a row of the region B
%   m - number of variations in both angle and distance from the origin of
%       the simulated rays

% Create two vectors, rho and theta, with m different values but of length
% m^2, such that taking an element from each with the same index always
% gives a different combination
rholinspace = linspace(-sqrt(2)*a,sqrt(2)*a,m+2);
rhom = rholinspace(2:m+1);
thetam = linspace(0,pi,m);

k = 1:m^2;
[kr,kt] = quorem(sym(k-1),sym(m));
rho(k) = rhom(kr+1);
theta(k) = thetam(kt+1);

% Run through the indexes i and j of the cells, and k of the simulated rays
A = zeros(m^2,N^2);
for i = 1:N
    for j = 1:N
        for k = 1:m^2
            if intersect_cell(i,j,a,N,rho(k),theta(k)) % only call the function get_length when the ray passes through the cell
                A(k,(i-1)*N+j) = get_length(i,j,a,N,rho(k),theta(k));
            end
        end
    end
end
