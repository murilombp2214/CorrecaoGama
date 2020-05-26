%Exemplo de chamada:
% Butterworth(img);
% onde img é sua imagem a ser processada
function Butterworth(img)
	[posicaoX,posicaoY] = size(img);
	%Salva as posições
	posX = posicaoX;
	posY = posicaoY;
	%floor para a mask
	posicaoY = floor(posicaoY/2);
	posicaoX = floor(posicaoX/2);
	%Crinado a mascara do Butterworth
	n = 2;
	[X,Y] = meshgrid(-posicaoY:posicaoY,-posicaoX:posicaoX);
	D = sqrt(X.^2 + Y.^2);
	D0 = 150;
	mask = 1./(1 + (D./D0).^(2*n));
	mask = mask(1:posX,1:posY);
	%aplicando o filtro
	imagef = fftshift(fft2(img));
	imgResult = ifft2(ifftshift(imagef.*mask));

	subplot(2,1,1); imshow(log(abs(imagef)),[]); title('Mascara direto da magnitude
	Butterworth');
	subplot(2,2,3); imshow(mask); title('Mascara Butterworth');
	subplot(2,2,4); imshow(log(abs(imgResult)),[]); title('Resultante Butterworth');
	y = imgResult;
end