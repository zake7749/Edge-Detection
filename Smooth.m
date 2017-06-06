function [ smoothed ] = Smooth( img ) 

    % �N��v�����Ƥ�

    % �����ҽk 3*3 �x�}, sigma = 1.5
    smooth_kernel = [
        0.0947416,0.118318,0.0947416;
        0.118318, 0.147761,0.118318;
        0.0947416,0.118318,0.0947416;
    ];

    [height,width] = size(img);
    fprintf(1,'[Smooth] : Get an image with size:(%d,%d)\n',height,width);

    % ���ϰ��@�h replicate padding, �����n�᪺�Ϥ����Ϥ@�ˤj
    padded = my_padding(img); % �Ѩ� my_padding.m
   
    smoothed = zeros(height,width);
    
    for i=2:height+1
        for j=2:width+1
            smooth_pixel = 0;
            for kx=-1:1
                for ky=-1:1
                    smooth_pixel = smooth_pixel + padded(i+kx,j+ky) * smooth_kernel(kx+2,ky+2);
                end
            end
            smoothed(i-1,j-1) = smooth_pixel;            
        end
    end
    smoothed = uint8(smoothed);
end

