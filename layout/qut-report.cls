% This class is based on an unofficial alternative to the original TU Delft
% template for reports.
%
% Adapted for QUT by Andrew Gibson (https://github.com/andrewresearch)
% derived from...
% Rewritten template by Daan Zwaneveld (dzwaneveld.github.io). Original
% template by TU Delft (https://www.tudelft.nl/huisstijl/downloads/).
%
% This template is available under CC BY-NC 4.0. For more information,
% see https://creativecommons.org/licenses/by-nc/4.0/. No attribution
% is required in reports created using this template.

%% Class is based on the default book class and options will be passed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{layout/qut-report}[21-09-06 v0.1 QUT Report Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,oneside]{book}

%% Main packages in the document
\RequirePackage{parskip}    % Space between paras, no indents
\RequirePackage{amsmath}    % Mathematics
\RequirePackage{amssymb}    % Symbols
\RequirePackage{siunitx}    % Various functions, e.g. \num{}

\RequirePackage{enumitem}   % Customise the list spacing

\RequirePackage{geometry}   % Document geometry
\RequirePackage{titlesec}   % Custom titles
\RequirePackage{titletoc}   % Custom table of contents
\RequirePackage{fancyhdr}   % Custom header/footer

% \usepackage{tocloft} % Custom table of contents typography
% \setlength{\cftbeforesecskip}{6pt}

% Setup tablestyles
\RequirePackage{tabularx}   % Additional functions to tables
\RequirePackage{booktabs}   % Adds more line functionality to tables
\RequirePackage{longtable}  % Lets tables break over page
\RequirePackage{multirow}   % Counterpart of multi columns
%% Table formatting
\RequirePackage[table]{xcolor}
\RequirePackage{colortbl}
\RequirePackage{tablestyles}
\RequirePackage[]{caption}

%\DeclareCaptionLabelFormat{qutlabel}{\color{qut-blue}#1~#2}
\DeclareCaptionStyle{qutcaptions}%
            [singlelinecheck=true,justification=centerlast]%
            {labelfont=sc,labelfont={color=qut-blue,bf}, textfont={color=qut-navy},margin={10mm},font={footnotesize,sl}}
\captionsetup{style=qutcaptions}

%% QUT Table Style: qutsansbold

\setuptablestyle{qutsansbold}{%
  \resettablestyle
  \setuptablecolor{body}{white!100}
  \setuptablecolor{row}{qut-cyan!5}
  \setuptablecolor{head}{qut-blue!100}
  \setuptablecolor{subhead}{qut-blue!15}
%
\renewcommand{\arraystretch}{1.4}
  \centering
  \sffamily
  \upshape%
  \tablefontsize{body}
  \tablealtcolored%
  \renewcommand{\thead}{%
\leavevmode\color{white}
\tablefontsize{head}%
\bfseries
\ignorespaces%
  }
  \renewcommand{\tsubhead}{%
  \leavevmode\color{qut-navy}
\tablefontsize{head}%
%\bfseries
\slshape
\ignorespaces%
} }
%
% \renewcommand{\tbegin}{\coloredhline{qut-cyan}}
% \renewcommand{\tbody}{\coloredhline{\color{qut-blue}}}
% \renewcommand{\tend}{\coloredhline{\color{qut-blue}}}


\RequirePackage[hidelinks]{hyperref} % Improved referencing/links

\RequirePackage{graphicx}   % Adding images
\RequirePackage{float}      % Additional float parameters

\RequirePackage{subcaption} % Subfigures and subcaptions

\RequirePackage{tikz}       % Create graphic elements

\RequirePackage{framed}     % Boxes and shades around text

%  Quotes to have shaded bar and coloured text
% \renewenvironment{leftbar}[2][0.95\hsize]{
%     \def\FrameCommand{{\color{#2}\vrule width 4pt}\hspace{10pt}}\MakeFramed{\hsize#1\advance\hsize-\width\FrameRestore}}
% {\endMakeFramed}

% \newenvironment{colourquote}{\begin{leftbar}{qut-cyan!40}\bgroup\color{qut-blue}}{\egroup\end{leftbar}\vspace{0.5\baselineskip}}

\renewenvironment{leftbar}[1][0.95\hsize]{
    \def\FrameCommand{{\color{qut-cyan!40}\vrule width 4pt}\hspace{10pt}}\MakeFramed{\hsize#1\advance\hsize-\width\FrameRestore}\color{qut-blue}}
{\vspace{0.5\baselineskip}\color{black}\endMakeFramed}

\newenvironment{colourquote}{\begin{leftbar}}{\end{leftbar}}


% -> BibLaTeX moved to report.tex ->
\RequirePackage{datetime}   % Used in preface for monthname
\RequirePackage{microtype}  % Refinements towards typographical perfection
\RequirePackage[nottoc]{tocbibind} % Add the lists to the table of contents
\RequirePackage{xspace}     % Ensures correct spacing after macros like \deg
\RequirePackage{etoolbox}   % General toolbox (e.g. \ifdefvoid)

%%%%% 1. General Definitions for the Document and Bibliography %%%%%

%% Commands to define the title, author, etc
\renewcommand{\title}[1]{%
    \def\@title{#1}%
    \hypersetup{pdftitle=#1}} % Adding to metadata

\renewcommand*{\author}[2][]{%
    \def\@author{#2}%
    \def\@author@short{#1}%
    \hypersetup{pdfauthor=\ifdefvoid{\@author@short}{#2}{#1}}} % Adding to metadata

\newcommand*\subtitle[1]{\def\@subtitle{#1}}
\newcommand*\reportdate[1]{\def\@reportdate{#1}}
\newcommand*\coverimage[1]{\def\@cover@image{#1}}
%\newcommand\subject[1]{\def\@subject{#1}}

%% Some of the TU Delft house style colours
%\definecolor{tudelft-cyan}{cmyk}{1,0,0,0}
\definecolor{qut-navy}{cmyk}{0.95,0.8,0.4,0.5}
\definecolor{qut-blue}{cmyk}{1,0.57,0,0.38}
\definecolor{qut-cyan}{cmyk}{1,0.2,0,0.1}
\definecolor{qut-black}{cmyk}{0,0,0,1}
\definecolor{qut-white}{cmyk}{0,0,0,0}

%% Scaling the margins to be slightly smaller than default (.7)
\geometry{a4paper,hscale=0.75,vscale=0.8}

%% Reducing white space in lists slightly (both enumerate and itemize)
\setlist{itemsep=-2pt}

%% Setting up \autoref to use uppercase
\def\sectionautorefname{Section}
\def\chapterautorefname{Chapter}
\let\subsectionautorefname\sectionautorefname
\let\subsubsectionautorefname\sectionautorefname

%%%%% 2. Loading all the Fonts (Supports pdfLaTeX, XeLaTeX and LuaLaTeX) %%%%%

\RequirePackage{iftex} % Adds if-else statements to support multiple compilers

\ifPDFTeX
    %% pdfLaTeX is only available for compatibility, but not recommended.
    \RequirePackage[T1]{fontenc} % Fixes possible encoding issues

    %% Defining commands to be used in layout
    \renewcommand{\rmdefault}{phv}
    \renewcommand{\sfdefault}{phv}
    \def\largetitlestyle{}
    \def\titlestyle{}

    %% Warning when using pdfLaTeX
    \@latex@warning@no@line{You are using pdfLaTeX as compiler. Consider changing the compiler to XeLaTeX or LuaLaTeX to adhere to the QUT house style}
\else
    %% If XeLaTeX or LuaLaTeX is set as the compiler, the TU Delft house style fonts are used
    \RequirePackage{fontspec} % Custom fonts

    %% Adding the various fonts
    \setmainfont{Arial}
    \setmathsf{Arial}
    \setmathtt{Arial}

    %\newfontfamily\tudtitlefamily[Path=layout/tudelft/]{TUDelft-UltraLight.ttf}
    \newfontfamily\quttitlefamily{Arial}
    \newfontfamily\quotefont{Georgia}

    %% Defining commands to be used in layout
    \def\largetitlestyle{\quttitlefamily}
    \def\titlestyle{\normalfont}

    %% Changing the quote environment to use Georgia
    \AtBeginEnvironment{quote}{\quotefont}
\fi

%%%%% 3. Adjusting the Titles in Text and Table of Contents %%%%%

%% Formatting chapter titles and spacing
\titleformat{\chapter}[display]
    {\flushright}
    {\color{qut-cyan}\fontsize{48}{48}\selectfont\largetitlestyle\thechapter}
    {0pt}
    {\Huge\titlestyle\color{qut-blue}}
\titlespacing*{\chapter}{0pt}{0pt}{2\baselineskip}

%% Formatting section titles and spacing
\titleformat{\section}
    {\color{qut-navy!80}\Large\titlestyle\bfseries}
    {\thesection.}
    {10pt}
    {\color{qut-navy!90}}
\titlespacing*{\section}{0pt}{2\baselineskip}{20pt}

%% Formatting subsections titles and spacing
\titleformat{\subsection}
    {\color{qut-blue!80}\large\titlestyle\bfseries}
    {\thesubsection.}
    {5pt}
    {\color{qut-blue!80}}
\titlespacing*{\subsection}{0pt}{1.5\baselineskip}{15pt}

%% Formatting subsubsections titles and spacing
\titleformat{\subsubsection}
    {\color{qut-cyan}\titlestyle\bfseries}
    {}
    {0pt}
    {\color{qut-cyan}}
\titlespacing*{\subsubsection}{10pt}{1.2\baselineskip}{10pt}

%% Changing font and spacing in the table of contents
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlestyle\bfseries}{1.5em}{0pc}
\dottedcontents{section}[3.8em]{\titlestyle}{2.3em}{8pt}
\dottedcontents{subsection}[7em]{\titlestyle}{3.2em}{8pt}

%%%%% 4. Adjusting the Header and Footer %%%%%

%% Adding a head rule to pages
\renewcommand*\headrule{%
    {\color{qut-blue}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth}

%% Page style for title pages
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \fancyfoot[C]{\thepage}}

%% Fancy style for the main matter, depends on oneside/twoside option
\if@twoside%
    \fancyhf{}
    \fancyhead[LE,RO]{\titlestyle\thepage}
    \fancyhead[RE]{\titlestyle\nouppercase{\leftmark}}
    \fancyhead[LO]{\titlestyle\nouppercase{\rightmark}}
    \RequirePackage{emptypage} % Clears empty pages
\else%
    \fancyhf{}
    \fancyhead[R]{\titlestyle\thepage}
    \fancyhead[L]{\titlestyle\nouppercase{\rightmark}}
\fi

\pagestyle{fancy} % Setting it to default

%%%%% 5. Cover Page %%%%%

\newcommand*\makecover{
    % Clearing the page and removing page number
    \clearpage
    \thispagestyle{empty}

    %% Use the Tikz library positioning
    \usetikzlibrary{positioning}

    % Defining where everything needs to go
    \begin{tikzpicture}[overlay,remember picture]

    \node[above=0,inner sep=0] at (current page.south) {\includegraphics[width=\paperwidth]{\@cover@image}};

    %\node[rotate=90,below right=4cm and .3cm] at (current page.west) {%
     %   \titlestyle\color{white} Queensland University of Technology};

    % \node[above right=0.2cm and 0.6cm] at (current page.south west) {%
    %     \includegraphics[width=0.35\linewidth]{layout/qut/logo-white.pdf}};

    \node[below=1.5cm,fill=qut-white,minimum width={\paperwidth},inner ysep=25pt,opacity=0.95,text opacity=1] at (current page.north) {%
        \begin{minipage}{0.9\paperwidth}
            \largetitlestyle\fontsize{36}{36}\selectfont\color{qut-navy}\@title \\[0.5ex]
            \ifdefvoid{\@subtitle}{}{\titlestyle\fontsize{20}{20}\selectfont\color{qut-navy}\@subtitle \\[2.5ex]}
            \ifdefvoid{\@author}{}{\titlestyle\fontsize{18}{18}\selectfont\color{qut-navy}\@author \\[2.5ex]}
            % \ifdefvoid{\@subject}{}{\titlestyle\fontsize{22}{22}\selectfont\color{white}\@subject \\[0.5ex]}
            % \largetitlestyle\fontsize{24}{24}\selectfont\color{white}\@author
        \end{minipage}};
        
        \node[above=2.5cm,minimum width={0.05\paperwidth},text opacity=1, anchor=east] at (current page.south) {%
        \begin{flushleft}
        \begin{minipage}{0.45\paperwidth}
        \raggedright
        %\color{qut-cyan}\fontsize{14}{14}\textbf{\@author} \\
            \largetitlestyle\fontsize{12}{12}\selectfont\color{white}\@reportdate
        \end{minipage}
        \end{flushleft}
        };

    \end{tikzpicture}
    \newpage
}

\widowpenalty=10000
\clubpenalty=10000