% read images and get parameters
A = imread('relazione/venice.jpg');
A = im2double(A);

nRows = size(A, 1);
nCols = size(A, 2);
n = floor(min(nRows, nCols) / 10);

if (size(A, 3) > 1)
    [Rr, Rg, Rb] = svd_all_channels(A, 1);

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
    err = 0;
    c = 0;
    interval = 1:min(nRows, nCols);

    for i = interval
        disp(i);
        [Ap, e_rel, compression] = svd_single_channel(A, 0, i);
        
        err(i) = e_rel * 100;
        c(i) = compression;
        %figure
        %imshow(Ap);
    end
end
