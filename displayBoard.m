%% Function to display a chess board
%   
%   Inspired from:
%   https://github.com/saliknadeem/N-Queens-Matlab/blob/master/displayBoard.m
%

function displayBoard(N,Queens)
    close;
    rows = [];
    cols = [];
    for i=1:N
        cols = [cols i];
        rows = [rows Queens(i)];
    end

    dark_square_color = .2;
    light_square_color = .9;

    pixel_size = 100;

    color_range = light_square_color - dark_square_color;
    f = (-1).^((1:N)' + (1:N));
    f = (f + 1) * color_range / 2;
    f = f + dark_square_color;

    f = repelem(f,pixel_size,pixel_size);
    f = repmat(f,1,1,3);
    h = imshow(f,'InitialMagnification',100);

    axis on

    h.XData = [0.5 N+0.5];
    h.YData = [0.5 N+0.5];
    axis([0.5 N+0.5 0.5 N+0.5])
    queen = char(9819);
    ax=axis;

    txt = texlabel(char(9819));
    text(cols,rows,'Q','FontSize',3.2*pixel_size/(ax(4)-ax(3)),'HorizontalAlignment', 'center','Color','red')
end