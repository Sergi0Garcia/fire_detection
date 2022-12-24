%MASK_2 (R > 190 && G > 100 && B < 140)

function  mask_2 = MASK_2(im_rgb)

[fil,col,ch]=size(im_rgb);
mask_2 = zeros(fil,col);

im_RED = im_rgb(:,:,1);
im_GREEN = im_rgb(:,:,2); 
im_BLUE = im_rgb(:,:,3); 
 
 for x=1:fil
     for y=1:col
        if ((im_RED(x,y) > 190) && (im_GREEN(x,y) > 100) && (im_BLUE(x,y) < 140))
            mask_2(x,y) = 1;
        else
            mask_2(x,y) = 0;
        end
     end
 end
 
figure();
imshow(mask_2);
 
end

