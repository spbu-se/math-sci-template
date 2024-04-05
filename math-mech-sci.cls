\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math-mech-sci}[2024/04/05 v0.0.1 Dmitry Luciv]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[10pt,a5paper]{article}

\RequirePackage{ifxetex}

% AMS packages want to be first...
\RequirePackage{amsmath}

\ifxetex
  \RequirePackage{mathspec}
  \RequirePackage{fontspec}
  \RequirePackage{xltxtra}
  %\RequirePackage{xecyr}
  \defaultfontfeatures{Mapping=tex-text,Ligatures={TeX},Kerning=On}

  % Windows fonts
  \iffalse
      \def\MyRomanFont#1{\expandafter#1[]{Times New Roman}}
      \def\MyMonoFont#1{\expandafter#1[]{Courier New}}
      \def\MySansFont#1{\expandafter#1{Arial}}
  \else

      \def\MyRomanFont#1{\expandafter#1{Tempora}[
        Mapping=tex-text,
        Extension=.otf,
        UprightFont=*-Regular,
        ItalicFont=*-Italic,
        BoldFont=*-Bold,
        BoldItalicFont=*-BoldItalic,
      ]}
      \iffalse
      \def\MyMonoFont#1{\expandafter#1
          [
            Path=fonts/,
            BoldFont=texgyrecursor-bold,
            ItalicFont=texgyrecursor-italic,
            BoldItalicFont=texgyrecursor-bolditalic
          ]{texgyrecursor-regular}
      }
      \fi
      \def\MyMonoFont#1{\expandafter#1
          [
            Scale=0.85
          ]{Liberation Mono}
      }
      \def\MySansFont#1{\expandafter#1{Liberation Sans}}
  \fi
  \MyRomanFont{\setmainfont}
  \MyRomanFont{\setromanfont}
  \MyRomanFont{\newfontfamily{\cyrillicfont}}
  \MyMonoFont{\setmonofont}
  \MyMonoFont{\newfontfamily{\cyrillicfonttt}}
  \MySansFont{\setsansfont}
  \MySansFont{\newfontfamily{\cyrillicfontsf}}

  \RequirePackage{polyglossia}
  \setdefaultlanguage{russian}
  \setotherlanguages{english}
\else
  \RequirePackage{mmap}
  \RequirePackage[T2A]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[english,russian]{babel}
  \selectlanguage{russian}
\fi

\RequirePackage[unicode]{hyperref}
\RequirePackage{authblk}
\RequirePackage{booktabs}
\RequirePackage{indentfirst}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage[table,xcdraw]{xcolor}
\RequirePackage{listings}
%\RequirePackage{minted}
\RequirePackage{makecell}
\RequirePackage{longtable}
\RequirePackage{amscd}
\RequirePackage{amssymb}
\RequirePackage{accents}

\RequirePackage[top=23mm,left=17mm,right=17mm,bottom=17mm]{geometry}

\RequirePackage[font=small,skip=0pt]{caption}

\pagestyle{empty}

\renewenvironment{abstract}
 {\normalsize
  \begin{center}
  \bfseries\large \abstractname \normalsize\vspace{-.5em}
  \end{center}
  \list{}{
    \setlength{\leftmargin}{10mm}%
    \setlength{\rightmargin}{\leftmargin}%
    \setlength{\listparindent}{\parindent}%
  }%
  \item\relax}
 {\endlist}

\renewcommand\maketitle{
  \begin{center}%
    \vspace*{-12mm}
    {\Large\bfseries\scshape \@title \par\vspace{3mm}}%
    {\@author}
  \end{center}\par
}

% remove numbering
\setcounter{secnumdepth}{-1}

\titleformat{\section}
  {\center\normalfont\fontsize{12}{17}\bfseries}
  {\thesection}
  {2pt}
  {}

\titleformat{\subsection}
  {\center\normalfont\fontsize{11}{17}\bfseries\itshape}
  {\thesubsection}
  {2pt}
  {}

\renewcommand{\thanks}[1]{\normalfont\mdseries\footnote{\footnotesize\textup{#1}}}

\lstset{ %
basicstyle=\normalsize\ttfamily,  % the size of the fonts that are used for the code
showstringspaces=false,         % underline spaces within strings
tabsize=2,                      % sets default tabsize to 2 spaces
breaklines=true,                % sets automatic line breaking
breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
escapeinside={\%*}{*)},          % if you want to add a comment within your code
extendedchars=\true,
inputencoding=utf8,
keywordstyle=\color{blue}\bfseries\ttfamily,
stringstyle=\color{red},
commentstyle=\color{brown},
xleftmargin=5mm
}

\newcommand{\thd}[1]{\thead[c]{\normalsize\bfseries #1}}

% http://tex.stackexchange.com/a/232874
\setlength{\tabcolsep}{0.5em} % for the horizontal padding
{\renewcommand{\arraystretch}{1.2}% for the vertical padding

\sloppy

\endinput
