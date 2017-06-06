function [ sobeled ] = Sobel(img, threshold)

% 讀入一張灰階圖片(channel 為 1), 對其進行 Sobel 運算
    
    % 定義縱向與水平向的 Sobel 捲積元
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
    
    % 對原圖做一層 replicate padding, 讓卷積後的圖片跟原圖一樣大
    padded = my_padding(img); % 參見 my_padding.m
    
    % 進行 x 方向與 y 方向的 sobel 捲積運算, 合併方式為平方相加取絕對值
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
                sobeled(i-1,j-1) = g; % 清理低強度的雜訊,超越閥值才視為邊
            end
        end
    end
    
    sobeled = uint8(sobeled);
end

