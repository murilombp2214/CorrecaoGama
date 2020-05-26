function y = FiltragemEspacial2(img, mask)
	tam = size(img);
	tamMask = size(mask);
	y = double(ones(size(img)));
	img = double(img);
	for i = 1 : tam(1) - tamMask(1)
		for j = 1 : tam(2) - tamMask(2)
			kernel = img(i : i + tamMask(1) - 1, j : j + tamMask(2) - 1);
			alue = kernel .* mask;
			y(i,j) = sum(sum(value));
			for k = 1 : 3
				kernel = img(i : i + tamMask(1) - 1, j : j + tamMask(2) - 1,k);
				value = kernel .* mask;
				y(i,j,k) = sum(sum(value));
			end
		end
	end
	y = uint8(y);
end