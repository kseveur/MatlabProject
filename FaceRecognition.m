

%% Feature Extraction Section
% Split existing data into Training and Testing Sets
[training, test] = partition(faceDatabase, [0.8, 0.2]);



%% Extract HOG Features for a Single Face for Presentation and Explanation
person = 2;
[hogFeature, visualization] = extractHOGFeatures(read(training(person), 1));
figure;
subplot(2,1,1);
imshow(read(training(person),1));
title('Input Face');
subplot(2,1,2);
plot(visualization);
title('HOG Features');


%% Extract HOG Features for Training Set
% 4680 is used as the output from the HOG is 1 X 4680
trainingFeatures = zeros(size(training,1) * training(1).Count,4680);
featureCount = 1;
for i = 1:size(training,2)
    for j = 1:training(i).count
        trainingFeatures(featureCount, :) = extractHOGFeatures(read(training(i), 1));
        trainingLabel{featureCount} = training(i).Description;
        featureCount = featureCount+1;
    end
    personIndex{i} = training(i).Description;
end



%% Create classifier
faceClassifier = fitcecoc(trainingFeatures, trainingLable);


%% Test One Image from Test Set
person = 1;
queryImage = read(test(person),1);  %This is where we need to insert our new image
queryFeatures = extractHOGFeatures(queryImage);
personLabel = predict(faceClassifier, queryFeatures);
% Go back to training set to find a match
booleanIndex = strcmp(personalLabel, personIndex);
integerIndex = find(booleanIndex);
subplot(1,2,1);
imshow(queryImage);
title('Student Picture');

subplot(1,2,2);
imshow(read(training(integerIndex), 1));
title('Matched Student');


%% Test Five Images from Test Set
figure;
figureNum = 1;
for person = 1:5
    for j = 1:test(person).Count
        queryImage = read(test(person),j); 
        queryFeatures = extractHOGFeatures(queryImage);
        personLabel = predict(faceClassifier, queryFeatures);
        % Go back to training set to find a match
        booleanIndex = strcmp(personalLabel, personIndex);
        integerIndex = find(booleanIndex);
        subplot(2,2,figureNum);
        imshow(imresize(queryImage,3));
        title('Query Face');
        
        subplot(2,2,figureNum + 1);
        imshow(imresize(read(training(integerIndex)), 3));
        title('Matched Class');
    end
end



