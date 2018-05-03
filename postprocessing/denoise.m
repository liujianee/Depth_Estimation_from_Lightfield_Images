function xt = denoise_GJTF(x, y, sigma2, r, sigma_s, gamma_r)% sigma_s空间域滤波核的尺寸，sigma_s越大对应的滤波核的尺寸越大，gamma_r值域高斯核的尺度
%sigma_s = 7, sigma_r = 1.0; r = 30(61*61)
 
    [height, width,depth] = size(y);
    % 值域高斯权重
    [dx,dy] = meshgrid(-r:r);
    h = exp(- (dx.^2 + dy.^2) / (2 * sigma_s^2));
    
    % 使用镜面反射的方式进行填充
    xp = padarray(x,[r,r],'symmetric');
    yp = padarray(y,[r,r],'symmetric');
    xt = zeros(size(y));
    for i = 1:height
        for j = 1:width
            g = xp(i:i+2*r,j:j+2*r,:);
            y = yp(i:i+2*r,j:j+2*r,:);
            % 计算邻域块中，所有其他像素距离中心像素点的差异
            d1 = bsxfun(@minus,g,g(1+r,1+r,:));
            d2 = bsxfun(@minus,y,y(1+r,1+r,:));
            % 根据差异值求高斯权重
            k1 = exp(-sum(d1.^2,3)./(gamma_r * sigma2)).*h;
            k2 = exp(-sum(d2.^2,3)./(gamma_r * sigma2)).*h;
            k = (3*k1+k2)/4;    
            % st 深度图平滑结果
            st = sum(sum(bsxfun(@times, y, k))) / sum(k(:));
            xt(i, j, :) =st;
        end
    end
end