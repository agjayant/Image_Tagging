%load('vgg_features.mat');
C = zeros(size(prepared_training_label,2),size(prepared_training_label,2));
for i=1:size(prepared_training_label,1)
	temp = zeros(1,291);
	count=0;
	for j=1:size(prepared_training_label,2)
		if prepared_training_label(i,j)==1
			count = count+1;
			temp(count)=j;
		end
	end
	for p = 1:count
		for q = 1:count
			C(temp(q),temp(p)) = C(temp(q),temp(p))+1;
			%C(temp(p),temp(q)) = C(temp(q),temp(p))+1;
		end
	end
end
save('cooccurence.mat','C');

