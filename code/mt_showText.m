function mt_showText(rootdir, text, window, varargin)
% ** function mt_showText(rootdir, text, window, varargin)
% This function writes text to the window opened by Psychtoolbox via
% mt_window
%
% USAGE:
%       mt_showText(rootdir, text, window, textSize)
%
% >>> INPUT VARIABLES >>>
% NAME              TYPE        DESCRIPTION
% rootdir           char        path to root working directory
% text              char/cell   text to be displayed
% window            double      current display window
% varargin          double      optional; font size of the text
%
% AUTHOR: Marco R�th, contact@marcorueth.com

%% Load parameters specified in mt_setup.m
load(fullfile(rootdir,'setup','mt_params.mat'))     % load workspace information and properties

if length(varargin) == 1
    textSize = varargin{1};
else
    textSize = defTextSize;
end

Screen('FillRect', window, textBgColor);            % set background color
Screen('TextSize', window, textSize);               % set text size

% Set specific format if text is a cell array
if iscell(text)
    for line = 1: size(text,1)-1
        DrawFormattedText(window, text{line}, sx, sy+line*textSize*vspacing);
    end
    DrawFormattedText(window, text{end}, sx, windowSize(2)-2*textSize);
else
    DrawFormattedText(window, text, 'center', 'center');
end

% Display the text
Screen('Flip', window); 

end