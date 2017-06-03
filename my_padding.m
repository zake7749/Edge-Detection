function [ padded ] = my_padding( arr )

    % ���J���}�C���@�h replicate padding, �����n�᪺�Ϥ��@�ˤj
    % ���y�ܻ�, ��@�i size:(h,w) ���Ϥ��ܦ� size(h+2,w+2)
    % ��ɥܷN: For a=[1,2;3,4] �i�� padding �i�o padded
    % 1 1 2 2
    % 1 1 2 2
    % 3 3 4 4 
    % 3 3 4 4
    
    [height,width] = size(arr);
    padded = zeros(height+2,width+2);
    
    for i=2:height+1
       % padding �P�쥻����t��
       padded(i,1) = arr(i-1,1);
       padded(i,width+2) = arr(i-1,width);
       
       % �����Ȥ���
       padded(i,2:width+1) = arr(i-1,1:width);
    end
    
    % replicated �� row1 and row height+2 ���P row2 �P height+1
    padded(1,:) = padded(2,:);
    padded(height+2,:) = padded(height+1,:);    
end

