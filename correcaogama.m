function y = CorrecaoGama(img,x)
	saida = zeros(size(img));
	saida = im2double(img);
	saida = saida.^x;
	saida = uint8(saida * 255);
	y = saida;
end