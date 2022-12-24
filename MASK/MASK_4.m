%MASK_4 (YCbCR)

function  mask_4 = MASK_4(im_rgb)

[fil,col,ch] = size(im_rgb);
mask_4 = zeros(fil,col);

im_RED = double(im_rgb(:,:,1));
im_GREEN = double(im_rgb(:,:,2)); 
im_BLUE = double(im_rgb(:,:,3)); 

T = [0.2568 0.5041 0.0979; -0.1482 -0.2910 0.4392; 0.4392 -0.3678 -0.0714];
s = [16; 128; 128];

im_YCBCR = zeros(fil,col,ch);

for i=1:1:fil
    for j=1:1:col
        RGB = [im_RED(i,j);im_GREEN(i,j);im_BLUE(i,j)];
        im_YCBCR(i,j,1) = T(1,:)*RGB+s(1); 
        im_YCBCR(i,j,2) = T(2,:)*RGB+s(2); 
        im_YCBCR(i,j,3) = T(3,:)*RGB+s(3); 
    end
end
 
im_YCBCR = uint8(im_YCBCR);
im_YCBCR = double(im_YCBCR);

Y = im_YCBCR(:,:,1);
Cb = im_YCBCR(:,:,2);
Cr = im_YCBCR(:,:,3);

for i=1:1:fil
    for j=1:1:col
        if Cr(i,j)>=Cb(i,j)
            mask_4(i,j) = 1;
        else
            mask_4(i,j) = 0;
        end
    end
end

figure();
imshow(mask_4);

end

