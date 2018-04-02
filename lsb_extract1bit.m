clear all;
watermarked_image=imread('watermarked1bit.bmp');

Mw=size(watermarked_image,1);	%Height
Nw=size(watermarked_image,2);	%Width

% use lsb of watermarked image to recover watermark
for ii = 1:Mw
    for jj = 1:Nw
        a=bitget(watermarked_image(ii,jj),1);
        watermark1(ii,jj)=a*127;
    end
end

% scale the recovered watermark
imwrite(watermark1,'watermarkextract1bit.bmp','bmp');

figure(1)
imshow(watermark1,[])

title('Recovered1.1 Watermark')

