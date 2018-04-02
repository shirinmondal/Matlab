clear all; 

% read in the cover object you want to use for embedding
cover_object=imread('lena512.bmp');
% read the message image you want to hide in the cover image
message=imread('moon_64.bmp');

Mc=size(cover_object,1);	%Height
Nc=size(cover_object,2);	%Width

Mm=size(message,1);	        %Height
Nm=size(message,2);	        %Width


  for ii = 1:Mm
      for jj = 1:Nm
          watermark1(ii,jj)=bitget(message(ii,jj),8);
          watermark2(ii,jj)=bitget(message(ii,jj),7);
          watermark3(ii,jj)=bitget(message(ii,jj),6);
          watermark4(ii,jj)=bitget(message(ii,jj),5);
          watermark5(ii,jj)=bitget(message(ii,jj),4);
          watermark6(ii,jj)=bitget(message(ii,jj),3);
          watermark7(ii,jj)=bitget(message(ii,jj),2);
          watermark8(ii,jj)=bitget(message(ii,jj),1);
      end
  end
% set the LSB of cover_object(ii,jj) to the value of the MSB of watermark(ii,jj)
watermarked_image=cover_object;
if(Mc>Mm)
for ii = 1:Mm
    for jj = 1:Nm
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),1,watermark1(ii,jj));
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),2,watermark2(ii,jj));
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),3,watermark3(ii,jj));
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),4,watermark4(ii,jj));
        watermarked_image(ii+Nm,jj)=bitset(watermarked_image(ii+Nm,jj),1,watermark5(ii,jj));
        watermarked_image(ii+Nm,jj)=bitset(watermarked_image(ii+Nm,jj),2,watermark6(ii,jj));
        watermarked_image(ii+Nm,jj)=bitset(watermarked_image(ii+Nm,jj),3,watermark7(ii,jj));
        watermarked_image(ii+Nm,jj)=bitset(watermarked_image(ii+Nm,jj),4,watermark8(ii,jj));
    end
end
else
    for ii = 1:Mm
    for jj = 1:Nm
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),1,watermark1(ii,jj));
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),2,watermark2(ii,jj));
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),3,watermark3(ii,jj));
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),4,watermark4(ii,jj));
        watermarked_image(ii,jj+Mm)=bitset(watermarked_image(ii,jj+Mm),1,watermark5(ii,jj));
        watermarked_image(ii,jj+Mm)=bitset(watermarked_image(ii,jj+Mm),2,watermark6(ii,jj));
        watermarked_image(ii,jj+Mm)=bitset(watermarked_image(ii,jj+Mm),3,watermark7(ii,jj));
        watermarked_image(ii,jj+Mm)=bitset(watermarked_image(ii,jj+Mm),4,watermark8(ii,jj));
    end
    end
end
display('hello');
imwrite(watermarked_image,'watermarked81.bmp','bmp');
figure(1)
imshow(watermarked_image,[])
title('Watermarked81 Image')