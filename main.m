%% Ū�J����
filename = 'demo1.jpg'; % �w�]���չϤ��� demo1.jpg or demo2.jpg
raw_img = imread(filename);

%% �v���Ƕ��� 
gray_img = raw_img(:,:,1) * 0.299 + raw_img(:,:,2) * 0.587 + raw_img(:,:,3) * 0.114; % Follow NTSC standard.
imshow(gray_img);figure;

%% Histogram Equalization
eqed_image = HistogramEqualization(gray_img,256); % �Ѩ� HistogramEqualization.m
imshow(uint8(eqed_image));figure;

%% Sobel Operator
sobeled = Sobel(eqed_image); % �Ѩ� Sobel.m
imshow(sobeled);