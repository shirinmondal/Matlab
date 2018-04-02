clear all; 

% read in the cover object you want to use for embedding
cover_object=imread('lena512.bmp');
% read the message image you want to hide in the cover image
message=imread('Baboon.bmp');

Mc=size(cover_object,1);	%Height
Nc=size(cover_object,2);	%Width

Mm=size(message,1);	        %Height
Nm=size(message,2);	        %Width
display(cover_object);

  for ii = 1:Mm
      for jj = 1:Nm
          watermark1(ii,jj)=bitget(message(ii,jj),8);
          watermark2(ii,jj)=bitget(message(ii,jj),7);
      end
  end

% set the LSB of cover_object(ii,jj) to the value of the MSB of watermark(ii,jj)
watermarked_image=cover_object;
for ii = 1:Mm
    for jj = 1:Nm
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),1,watermark1(ii,jj));
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),2,watermark2(ii,jj));
    end
end
display('hello');
display(watermarked_image);

imwrite(watermarked_image,'watermarked2bit.bmp','bmp');
figure(1)
imshow(watermarked_image,[])
title('Watermarked2 Image')