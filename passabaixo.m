%Exemplo de chamada:
% passabaixo(img,1);
% onde img é sua imagem a ser processada
function y = passabaixo(img,plot)
	clc;
	%img = rgb2gray(imgMara);
	[posicaoY,posicaoX] = size(img);
	%criando a máscara
	mask = zeros(posicaoY,posicaoX);
	mask(round(posicaoY/2),round(posicaoX/2)) = 1;
	mask(bwdist(mask) <= 60) = 1;
	%calcula fourier
	fourier = fftshift(fft2(img));
	%aplica máscara
	fourierAplicado = fourier .* mask;
	%pega a magnitude
	magnitude = fourierAplicado;
	%calcula inversa fourier
	imgResult = ifft2(ifftshift(fourierAplicado));

	%exibe imagens
	if plot == 1
	subplot(2,1,1); imshow(log(abs(magnitude)),[]); title('Mascara direto na magnitude -
	passa baixo ideal');
	subplot(2,2,3); imshow(mask); title('Máscara passa baixo ideal');
	subplot(2,2,4); imshow(uint8(imgResult)); title('Resultante passa baixo ideal');
	end
	y = imgResult;
end