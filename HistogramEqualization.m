function [ eqed ] = HistogramEqualization(img,L)
% �N��Ϫ��Ƕ��Ȥ��G�����ƨöǦ^���ƫ᪺�s��

    [height,width] = size(img);
    MN = height * width;
    
    % �έp��Ϫ��Ƕ��Ȥ���
    counts = zeros(256,1);
    img = double(img);
    
    for i=1:height
        for j=1:width
            gray_value_idx = img(i,j) + 1; % [0,255] -> [1,256]
            counts(gray_value_idx) = counts(gray_value_idx) + 1;
        end
    end
    %plot(counts);title('count');figure;
    
    % �N�p���ഫ���K�׭�
    density = zeros(256,1);
    for i=1:256
        density(i) = counts(i) / MN;
    end
    plot(density);title('pdf');figure;
    
    % �p�� weighted CDF 
    cdf = zeros(256,1);
    cdf(1) = density(1);
    for i=2:256
        cdf(i) = cdf(i-1) + density(i);
    end
    cdf = round(cdf * L-1);
    plot(cdf);title('cdf');figure;
    
    % ���ª��Ƕ��� apply �s���Ƕ��Ȥ��G
    eqed = zeros(height,width);
    for i=1:height
        for j=1:width
            eqed(i,j) = cdf(img(i,j)+1);
        end
    end
    
    imhist(uint8(eqed));title('new pdf');figure;
    
end

