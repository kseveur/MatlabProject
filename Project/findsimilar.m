function n = findsimilar(img)
clc

%% Feature Extraction Section
% Split existing data into Training and Testing Sets
[training, test] = partition(faceDatabase, [0.8, 0.2]);

% Load Training Data From file
trainingLabel = load('features.mat', 'trainingLabel');
trainingFeatures = load('features.mat', 'trainingFeatures');
featureCount = load('features.mat', 'featureCount');
personIndex = load('features.mat', 'personIndex');

%% Load classifier
faceClassifier = load('features.mat', 'faceClassifier');


%% Test One Image from Test Set
person = img;
queryImage = read(test(person),1);  %This is where we need to insert our new image
queryFeatures = extractHOGFeatures(queryImage);
personLabel = predict(faceClassifier, queryFeatures);
% Go back to training set to find a match
booleanIndex = strcmp(personLabel, personIndex);
integerIndex = find(booleanIndex);
% subplot(1,2,1);
% imshow(queryImage);
% title('Student Picture');

% subplot(1,2,2);
% imshow(read(training(integerIndex), 1));
% title('Matched Student');
n = read(training(integerIndex), 1);

% similarities = [];
% load features
% [csd128 ,edge] = calcfeatures(img);
% for k = 1:size(names, 1)
%     b = pdist([csd128; csd128hist(k, :)]);
%     d = ehddist(edge, edges(k, :), 1, 1, 5);
%     similarities = [similarities; b d];
% end
% for k = 1:size(similarities, 2)
%     m = mean(similarities(:, k));
%     s = std(similarities(:, k));
%     similarities(:, k) = (similarities(:, k) - m) ./ s;   
% end
% similarities(:, 2) = 0.8*similarities(:, 2);
% sims = sum(similarities');
% [~, I] = sort(sims);
% n = names(I(1), :);
end
