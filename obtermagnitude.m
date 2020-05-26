function y = obtermagnitude(img)
	y = log(abs(fftshift(fft2(rgb2gray(img)))));
	imshow(y,[]);
end