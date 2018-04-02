clear all;
watermarked_image=imread('watermarked81.bmp');

Mw=size(watermarked_image,1);	%Height
Nw=size(watermarked_image,2);	%Width
msg=imread('moon_64.bmp');
Mm=size(msg,1);
Nm=size(msg,2);
watermark1=zeros(Mm,Nm);

% use lsb of watermarked image to recover watermark
if(Mw>Mm)
for ii = 1:Mm
    for jj = 1:Nm
        a=bitget(watermarked_image(ii,jj),1);
        b=bitget(watermarked_image(ii,jj),2);
        c=bitget(watermarked_image(ii,jj),3);
        d=bitget(watermarked_image(ii,jj),4);
        e=bitget(watermarked_image(ii+Nm,jj),1);
        f=bitget(watermarked_image(ii+Nm,jj),2);
        g=bitget(watermarked_image(ii+Nm,jj),3);
        h=bitget(watermarked_image(ii+Nm,jj),4);
        watermark1(ii,jj)=a*127+b*63+c*31+d*15+e*7+f*3+g*1+h*0;
    end
end
else
    for ii = 1:Mm
    for jj = 1:Nm
        a=bitget(watermarked_image(ii,jj),1);
        b=bitget(watermarked_image(ii,jj),2);
        c=bitget(watermarked_image(ii,jj),3);
        d=bitget(watermarked_image(ii,jj),4);
        e=bitget(watermarked_image(ii,jj+Mm),1);
        f=bitget(watermarked_image(ii,jj+Mm),2);
        g=bitget(watermarked_image(ii,jj+Mm),3);
        h=bitget(watermarked_image(ii,jj+Mm),4);
        watermark1(ii,jj)=a*127+b*63+c*31+d*15+e*7+f*3+g*1+h*0;
    end
end
end
% scale the recovered watermark
imwrite(watermark1,'watermarkextract8bit.bmp','bmp');
I=imread('watermarkextract8bit.bmp');
%J=imcrop(I,[1,1,64,64]);

figure(1)
imshow(watermark1,[])
%subplot(1,2,2)
%imshow(J)

title('Recovered8.1 Watermark')



