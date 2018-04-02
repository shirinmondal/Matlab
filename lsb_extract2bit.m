clear all;
watermarked_image=imread('watermarked2bit.bmp');

Mw=size(watermarked_image,1);	%Height
Nw=size(watermarked_image,2);	%Width

% use lsb of watermarked image to recover watermark
for ii = 1:Mw
    for jj = 1:Nw
        a=bitget(watermarked_image(ii,jj),1);
        b=bitget(watermarked_image(ii,jj),2);
        watermark1(ii,jj)=a*127+b*63;
    end
end

% scale the recovered watermark
imwrite(watermark1,'watermarkextract2bit.bmp','bmp');

figure(1)
imshow(watermark1,[])

title('Recovered2.1 Watermark')

