% read images and get parameters
A = imread('relazione/iss.jpg');
A = im2double(A);

nRows = size(A, 1);
nCols = size(A, 2);
n = floor(min(nRows, nCols) / 10);

if (size(A, 3) > 1)
    [Rr, Rg, Rb] = svd_all_channels(A);

    redOnly = zeros(nRows, nCols, 3);
    redOnly(:, :, 1) = Rr;
    greenOnly = zeros(nRows, nCols, 3);
    greenOnly(:, :, 2) = Rg;
    blueOnly = zeros(nRows, nCols, 3);
    blueOnly(:, :, 3) = Rb;

    % show each channel
    figure
    imshow(redOnly);
    figure
    imshow(greenOnly);
    figure
    imshow(blueOnly);

    % get rgb image approximation
    allChannels = redOnly + greenOnly + blueOnly;
    figure
    imshow(allChannels);
else
    Ap = svd_single_channel(A);

    figure
    imshow(Ap);
end
