% read images and get parameters
A = imread('relazione/im_buzz/buzz.jpg');
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
    % autoimmagine relativa al primo valore singolare
    [Ap, e_rel, compression] = svd_single_channel(A, 0, 1);
    figure
    imshow(Ap);

    % autoimmagine relativa al secondo valore singolare
    p = min(nRows, nCols);
    [Ap, e_rel, compression] = svd_single_channel(A, p-1, p);
    figure
    imshow(Ap);

    % altre immagini G^(k)
    [Ap, e_rel, compression] = svd_single_channel(A, 0, 20);
    figure
    imshow(Ap);

    [Ap, e_rel, compression] = svd_single_channel(A, 0, 60);
    figure
    imshow(Ap);

    [Ap, e_rel, compression] = svd_single_channel(A, 0, 100);
    figure
    imshow(Ap);

    % minimum dimension / 5
    [Ap, e_rel, compression] = svd_single_channel(A);
    figure
    imshow(Ap);

    % autoimmagine relativa ai valori singolari più piccoli
    [Ap, e_rel, compression] = svd_single_channel(A, 60, p);
    figure
    imshow(Ap);

end
