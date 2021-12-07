% lin alg test %
% define problem environment %
clf; close all;
rng(101);

% define problem to be solved %
ndata = 3; 
nbasis = ndata;
% define function to be interpolated %
f = @(x) cos(x);
% plot the function, not the interpolant %
xbeg = -1; xend = 1; nxplot = 11;
xplot = linspace(xbeg, xend, nxplot);
yplot = f(xplot); % this calls function above f(x) = 1 + 2*x

% generate the random data %

xdata = xbeg + (xend-xbeg)*rand(1,ndata);
ydata = f(xdata);

% plot function %

plot(xplot, yplot, 'b'); hold on % hold on keeps figures ontop of each other%
scatter(xdata, ydata, 100, 'k', 'filled')
title('Linear Algebra')

% make matrix % 

nrow = ndata;
ncol = nbasis;

Adata = NaN(nrow,ncol); % NaN is not a number %

for ic = 1:ncol
    for ir = 1:nrow
        Adata(ir,ic) = xdata(ir)^(ic-1);
    end
end

% solve lin system %

coef = linsolve(Adata,ydata'); % this gives coeffs of anon function%

% finally plot anon through data %
yhat = coef(1)*ones(size(xplot));
for ib = 2:nbasis
    yhat = yhat + coef(ib)*xplot.^(ib-1);
end
hold on;
plot(xplot,yhat,'r')