function [ padded ] = my_padding( arr )

    % 對輸入的陣列做一層 replicate padding, 讓卷積後的圖片一樣大
    % 換句話說, 把一張 size:(h,w) 的圖片變成 size(h+2,w+2)
    % 填補示意: For a=[1,2;3,4] 進行 padding 可得 padded
    % 1 1 2 2
    % 1 1 2 2
    % 3 3 4 4 
    % 3 3 4 4
    
    [height,width] = size(arr);
    padded = zeros(height+2,width+2);
    
    for i=2:height+1
       % padding 同原本的邊緣值
       padded(i,1) = arr(i-1,1);
       padded(i,width+2) = arr(i-1,width);
       
       % 內部值不變
       padded(i,2:width+1) = arr(i-1,1:width);
    end
    
    % replicated 的 row1 and row height+2 等同 row2 與 height+1
    padded(1,:) = padded(2,:);
    padded(height+2,:) = padded(height+1,:);    
end

