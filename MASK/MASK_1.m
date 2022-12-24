%MASK_1 (R > G > B) 

function  mask_1 = MASK_1(im_rgb)

[fil,col,ch]=size(im_rgb);
mask_1 = zeros(fil,col);

im_RED = im_rgb(:,:,1);
im_GREEN = im_rgb(:,:,2); 
im_BLUE = im_rgb(:,:,3); 
 
 for x=1:fil
     for y=1:col
        if (im_RED(x,y) > im_GREEN(x,y))&& (im_GREEN(x,y) > im_BLUE(x,y))
            mask_1(x,y) = 1;
        else
            mask_1(x,y) = 0;
        end
     end
 end
 
figure();
imshow(mask_1);
 
end

