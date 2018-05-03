function xt = denoise_GJTF(x, y, sigma2, r, sigma_s, gamma_r)% sigma_s�ռ����˲��˵ĳߴ磬sigma_sԽ���Ӧ���˲��˵ĳߴ�Խ��gamma_rֵ���˹�˵ĳ߶�
%sigma_s = 7, sigma_r = 1.0; r = 30(61*61)
 
    [height, width,depth] = size(y);
    % ֵ���˹Ȩ��
    [dx,dy] = meshgrid(-r:r);
    h = exp(- (dx.^2 + dy.^2) / (2 * sigma_s^2));
    
    % ʹ�þ��淴��ķ�ʽ�������
    xp = padarray(x,[r,r],'symmetric');
    yp = padarray(y,[r,r],'symmetric');
    xt = zeros(size(y));
    for i = 1:height
        for j = 1:width
            g = xp(i:i+2*r,j:j+2*r,:);
            y = yp(i:i+2*r,j:j+2*r,:);
            % ����������У������������ؾ����������ص�Ĳ���
            d1 = bsxfun(@minus,g,g(1+r,1+r,:));
            d2 = bsxfun(@minus,y,y(1+r,1+r,:));
            % ���ݲ���ֵ���˹Ȩ��
            k1 = exp(-sum(d1.^2,3)./(gamma_r * sigma2)).*h;
            k2 = exp(-sum(d2.^2,3)./(gamma_r * sigma2)).*h;
            k = (3*k1+k2)/4;    
            % st ���ͼƽ�����
            st = sum(sum(bsxfun(@times, y, k))) / sum(k(:));
            xt(i, j, :) =st;
        end
    end
end