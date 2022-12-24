% ------------------------------------
% MAIN
% EXAMEN SEGUNDO PARCIAL
% SERGIO GARCIA - A01634768 - MAYO 1 2021
% ------------------------------------
addpath("./MASK")
im_rgb=imread("./img/fire_forest.jpg");

[fil,col,ch]=size(im_rgb);
all_masks = size(fil,col);
im_out = double(zeros(fil,col,ch));

% EJERCICIO 1
% OBTENEMOS CADA MASCARA 

mask_1 = MASK_1(im_rgb);
mask_2 = MASK_2(im_rgb);
mask_3 = MASK_3(im_rgb);
mask_4 = MASK_4(im_rgb);
mask_5 = MASK_5(im_rgb);
mask_6 = MASK_6(im_rgb);
mask_7 = MASK_7(im_rgb);

for x=1:fil
    for y=1:col
        all_masks(x,y) = (mask_1(x,y) && mask_2(x,y) && mask_3(x,y) && mask_4(x,y) && mask_5(x,y) && mask_6(x,y) && mask_7(x,y));
    end
end

for x=1:fil
    for y=1:col
        if (all_masks(x,y) == 1)
            im_out(x,y,1) = 0;
            im_out(x,y,3) = 0;
            im_out(x,y,2) = 255;
        else
            im_out(x,y,1) = im_rgb(x,y,1);
            im_out(x,y,3) = im_rgb(x,y,3);
            im_out(x,y,2) = im_rgb(x,y,2);
        end
    end
end

im_out = uint8(im_out);

% EJERCICO 2
% IMAGEN ORIGINAL VS ALL_MASKS
figure;
subplot(1,2,1), imshow(im_rgb);
subplot(1,2,2), imshow(all_masks);

% EJERCICO 3
% IMAGEN DE SALIDA
figure;
imshow(im_out);
