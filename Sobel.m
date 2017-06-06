function [ sobeled ] = Sobel(img, threshold)

% Ū�J�@�i�Ƕ��Ϥ�(channel �� 1), ���i�� Sobel �B��
    
    % �w�q�a�V�P�����V�� Sobel ���n��
    x_kernel = [
        -1,0,1;
        -2,0,2;
        -1,0,1
        ];
    y_kernel = [
        -1,-2,-1;
        0,0,0;
        1,2,1
        ];

    [height,width] = size(img);
    fprintf(1,'[Sobel] : Get an image with size:(%d,%d)\n',height,width);
    
    % ���ϰ��@�h replicate padding, �����n�᪺�Ϥ����Ϥ@�ˤj
    padded = my_padding(img); % �Ѩ� my_padding.m
    
    % �i�� x ��V�P y ��V�� sobel ���n�B��, �X�֤覡������ۥ[�������
    sobeled = zeros(height,width);
    
    for i=2:height+1
        for j=2:width+1
            
            gx = 0;
            gy = 0;
            
            for kx=-1:1
                for ky=-1:1
                    gx = gx + padded(i+kx,j+ky) * x_kernel(kx+2,ky+2);
                    gy = gy + padded(i+kx,j+ky) * y_kernel(kx+2,ky+2);
                end
            end
            
            g = sqrt(gx^2 + gy^2);
            if g > threshold 
                sobeled(i-1,j-1) = g; % �M�z�C�j�ת����T,�W�V�֭Ȥ~������
            end
        end
    end
    
    sobeled = uint8(sobeled);
end

