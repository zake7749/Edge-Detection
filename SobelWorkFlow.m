function [ ] = SobelWorkFlow( input_filename, output_filename, threshold )

    %% 讀入圖檔
    raw_img = imread(input_filename);

    %% 影像灰階化 
    gray_img = raw_img(:,:,1) * 0.299 + raw_img(:,:,2) * 0.587 + raw_img(:,:,3) * 0.114; % Follow NTSC standard.
    %imshow(gray_img);figure;

    %% 影像平滑化
    gray_img = Smooth(gray_img); % 參見 Smooth.m

    %% Histogram Equalization
    eqed_image = HistogramEqualization(gray_img,256); % 參見 HistogramEqualization.m
    %imshow(uint8(eqed_image));figure;

    %% Sobel Operator
    sobeled = Sobel(eqed_image, threshold); % 參見 Sobel.m, 第二個參數是 Edge 的閥值
    imshow(sobeled);
    imwrite(sobeled,output_filename)

end

