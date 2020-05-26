function y = equalizar(imgMara)
	imgCinza = CorrecaoGama(rgb2gray(imgMara),5);
	figure;imshow(uint8(imgCinza));
	figure;bar(MonteHist(imgCinza));
	histograma = [0 : 256];
	tamImgCinza = size(imgCinza);
	%PMF - Função massa probabilidade
	for i = 1 : max(max(imgCinza))
		histograma(i) = histograma(i) / double(tamImgCinza(1) * tamImgCinza(2));
	end

	%Função de Distribuição acumulada
	for i = 2 : 255
		histograma(i) = histograma(i) + histograma(i - 1);
	end
	%Normalizacao
	histograma = histograma * ( tamImgCinza(1) * tamImgCinza(2) );
	for i = 1 : tamImgCinza(1)
		for j = 1 : tamImgCinza(2)
			valor = imgCinza(i,j);
			if valor ~= 0
				imgCinza(i,j) = histograma(valor);
			else
				imgCinza(i,j) = histograma(1);
			end
		end
	end
	figure;imshow(uint8(imgCinza));
	figure;bar(MonteHist(imgCinza));
end