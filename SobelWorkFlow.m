function [ ] = SobelWorkFlow( input_filename, output_filename, threshold )

    %% Ū�J����
    raw_img = imread(input_filename);

    %% �v���Ƕ��� 
    gray_img = raw_img(:,:,1) * 0.299 + raw_img(:,:,2) * 0.587 + raw_img(:,:,3) * 0.114; % Follow NTSC standard.
    %imshow(gray_img);figure;

    %% �v�����Ƥ�
    gray_img = Smooth(gray_img); % �Ѩ� Smooth.m

    %% Histogram Equalization
    eqed_image = HistogramEqualization(gray_img,256); % �Ѩ� HistogramEqualization.m
    %imshow(uint8(eqed_image));figure;

    %% Sobel Operator
    sobeled = Sobel(eqed_image, threshold); % �Ѩ� Sobel.m, �ĤG�ӰѼƬO Edge ���֭�
    imshow(sobeled);
    imwrite(sobeled,output_filename)

end

