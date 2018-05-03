function [grad U] = gradient_pca(x1,win)
[rows cols] = size(x1);
x1pad = padarray(x1,[win win],'symmetric');
Cxx = zeros(rows,cols,(2*win+1)^2);
for i=1:2*win+1
    for j=1:2*win+1
        k = sub2ind([2*win+1 2*win+1], i, j);
        Cxx(:,:,k) = x1pad(i:i+rows-1, j:j+cols-1);
    end
end
X = reshape(shiftdim(Cxx,2),(2*win+1)^2, rows*cols);
Cxx = X*X';
[U, ~, ~] = svd(Cxx);

Corr = sum(abs(U(:,2:16)'*X),1);
grad = reshape(Corr(:),rows,cols);
grad = grad/max(grad(:));