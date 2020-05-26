function y = MonteHist(img)
	histograma = zeros(256,1);
	tam = size(img);
	for i = 1 : tam(1)
		for j = 1 : tam(2)
			histograma(img(i,j) + 1) = histograma(img(i,j) + 1) + 1;
		end
	end
	y = histograma;
end