%%=============================================================================
%%  ml4d.cls
%%  Document class for the First Workshop on Machine Learning for Defense
%%
%%
%%  Class options
%%  -------------
%%    review        anonymised authors, line numbers, page numbers, banner
%%    preprint      named authors, page numbers, conference banner
%%    final         camera-ready (default): named authors, no page numbers
%%    a4paper       A4 geometry instead of US Letter
%%    pagenumbers   force page numbers on in any mode
%%    nolinenumbers suppress line numbers in review mode
%%
%%  Note for maintainers: internal macros are prefixed \mlfourd@, not
%%  \ml4d@, because TeX control sequence names cannot contain digits.
%%
%%  Released for use by ML4D authors. Modify freely.
%%=============================================================================
\NeedsTeXFormat{LaTeX2e}[1996/06/01]
\ProvidesClass{ml4d}[2026/08/26 v1.0 ML4D workshop paper class]

%%------------------------------------------------------------------ options --
\newif\ifmlfourd@review    \mlfourd@reviewfalse
\newif\ifmlfourd@preprint  \mlfourd@preprintfalse
\newif\ifmlfourd@afour        \mlfourd@afourfalse
\newif\ifmlfourd@pagenum   \mlfourd@pagenumfalse
\newif\ifmlfourd@lineno    \mlfourd@linenotrue

\DeclareOption{review}{\mlfourd@reviewtrue\mlfourd@pagenumtrue}
\DeclareOption{preprint}{\mlfourd@preprinttrue\mlfourd@pagenumtrue}
\DeclareOption{final}{\mlfourd@reviewfalse\mlfourd@preprintfalse}
\DeclareOption{camera}{\mlfourd@reviewfalse\mlfourd@preprintfalse}
\DeclareOption{a4paper}{\mlfourd@afourtrue}
\DeclareOption{letterpaper}{\mlfourd@afourfalse}
\DeclareOption{pagenumbers}{\mlfourd@pagenumtrue}
\DeclareOption{nolinenumbers}{\mlfourd@linenofalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[10pt,twocolumn,oneside]{article}

%%----------------------------------------------------------------- geometry --
%% Letter: 7.25in text width, two 3.5in columns with a 0.25in gutter, matching

\RequirePackage{geometry}
\ifmlfourd@afour
  \geometry{a4paper,top=19mm,bottom=25mm,left=14.5mm,right=14.5mm,
            columnsep=6.35mm,footskip=12mm,headsep=6mm}
\else
  \geometry{letterpaper,top=0.75in,bottom=1.0in,left=0.625in,right=0.625in,
            columnsep=0.25in,footskip=0.5in,headsep=0.25in}
\fi

%%-------------------------------------------------------------------- fonts --
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
%% Prefer newtx (better Times clone); fall back to mathptmx everywhere else.
\IfFileExists{newtxtext.sty}{%
  \RequirePackage{newtxtext}%
  \RequirePackage{newtxmath}%
}{%
  \RequirePackage{mathptmx}%
}
\IfFileExists{microtype.sty}{\RequirePackage{microtype}}{}

%%----------------------------------------------------------------- packages --
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{xcolor}
\RequirePackage{caption}
\IfFileExists{cite.sty}{\RequirePackage{cite}}{}          % sorted [1]-[3] refs
\IfFileExists{stfloats.sty}{\RequirePackage{stfloats}}{}  % bottom 2-col floats
\IfFileExists{balance.sty}{\RequirePackage{balance}}{\providecommand{\balance}{}}

\definecolor{ml4dlink}{RGB}{0,60,130}

%%------------------------------------------------------------- housekeeping --
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}
\widowpenalty=10000
\clubpenalty=10000
\setlength{\textfloatsep}{10pt plus 3pt minus 3pt}
\setlength{\floatsep}{10pt plus 3pt minus 3pt}
\setlength{\intextsep}{10pt plus 3pt minus 3pt}
\setlength{\dblfloatsep}{10pt plus 3pt minus 3pt}
\setlength{\dbltextfloatsep}{12pt plus 3pt minus 3pt}
\renewcommand{\topfraction}{0.95}
\renewcommand{\dbltopfraction}{0.95}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\textfraction}{0.07}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{0.75}

%%--------------------------------------------------------- sectioning style --
%%  I. Section Title      (centred, small caps)
%%  A. Subsection Title   (flush left, italic)
%%  1) Subsubsection      (flush left, italic)
%%  a) Paragraph          (run-in, italic)
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\Alph{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
\renewcommand{\theparagraph}{\alph{paragraph}}

\def\@seccntformat#1{\csname mlfourd@seccnt@#1\endcsname}
\def\mlfourd@seccnt@section{\thesection.\hskip 0.6em}
\def\mlfourd@seccnt@subsection{\thesubsection.\hskip 0.5em}
\def\mlfourd@seccnt@subsubsection{\thesubsubsection)\hskip 0.5em}
\def\mlfourd@seccnt@paragraph{\theparagraph)\hskip 0.5em}

\renewcommand{\section}{\@startsection{section}{1}{\z@}%
  {2.4ex \@plus 0.8ex \@minus 0.4ex}%
  {1.0ex \@plus 0.3ex}%
  {\normalfont\normalsize\scshape\centering}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {1.8ex \@plus 0.6ex \@minus 0.3ex}%
  {0.7ex \@plus 0.2ex}%
  {\normalfont\normalsize\itshape\raggedright}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
  {1.4ex \@plus 0.5ex \@minus 0.2ex}%
  {0.6ex \@plus 0.2ex}%
  {\normalfont\normalsize\itshape\raggedright}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\parindent}%
  {1.2ex \@plus 0.4ex \@minus 0.2ex}%
  {-0.6em}%
  {\normalfont\normalsize\itshape}}
\setcounter{secnumdepth}{4}

%%----------------------------------------------------------------- captions --
%% Fig. 1. Sentence-case caption, 8pt, centred when it fits on one line.
\renewcommand{\figurename}{Fig.}
\renewcommand{\thetable}{\Roman{table}}
\captionsetup{font=footnotesize,labelsep=period,justification=raggedright,
              singlelinecheck=true,skip=6pt}
\captionsetup[table]{position=top,labelsep=newline,justification=centering,
                     labelfont={footnotesize,sc},textfont={footnotesize,sc},
                     skip=4pt}

%%---------------------------------------------------------------- theorems ---
\newtheoremstyle{ml4d}%
  {1.0ex plus 0.3ex}{1.0ex plus 0.3ex}{\itshape}{}%
  {\scshape}{.}{0.5em}{}
\theoremstyle{ml4d}
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{remark}[theorem]{Remark}

%%--------------------------------------------------- abstract & index terms --
\renewenvironment{abstract}{%
  \vspace{0.2\baselineskip}%
  \small\bfseries\itshape\noindent Abstract---\ignorespaces
}{%
  \par\normalfont\normalsize\vspace{0.4\baselineskip}%
}

\newcommand{\keywords}[1]{%
  \par\noindent{\small\bfseries\itshape Index Terms---#1}%
  \par\normalfont\normalsize\vspace{0.6\baselineskip}%
}
\let\indexterms\keywords

%%--------------------------------------------------------------- title page --
\def\mlfourd@conference{First Workshop on Machine Learning for Defense (ML4D)}
\newcommand{\conference}[1]{\gdef\mlfourd@conference{#1}}

\def\mlfourd@distribution{}
\newcommand{\distributionstatement}[1]{\gdef\mlfourd@distribution{#1}}

\def\mlfourd@anonauthor{%
  Anonymous Author(s)\\[2pt]
  \itshape Affiliation withheld for double-blind review\\
  \upshape \texttt{paper-ID@ml4d-workshop.org}}

%% Unnumbered first-page footnote, used for the distribution statement.
\newcommand{\mlfourd@blfootnote}[1]{%
  \begingroup
    \renewcommand{\thefootnote}{}%
    \footnotetext{#1}%
  \endgroup
}

\renewcommand{\maketitle}{%
  \twocolumn[{%
    \vspace*{-0.4\baselineskip}%
    \begin{center}%
      {\fontsize{20}{24}\selectfont\@title\par}%
      \vspace{1.4\baselineskip}%
      {\normalsize
        \ifmlfourd@review \mlfourd@anonauthor \else \@author \fi
        \par}%
      \vspace{2.0\baselineskip}%
    \end{center}%
  }]%
  \thispagestyle{mlfourd@first}%
  \ifx\mlfourd@distribution\@empty\else
    \mlfourd@blfootnote{\mlfourd@distribution}%
  \fi
  \@afterindentfalse\@afterheading
}

\newcommand{\authorblock}[2]{%
  \begin{tabular}[t]{@{}c@{}}%
    \normalsize #1\\[3pt]%
    \small\itshape #2%
  \end{tabular}%
}
\newcommand{\authorsep}{\hspace{2.5em}}
\newcommand{\email}[1]{\upshape\texttt{\small #1}}

%%-------------------------------------------------------------- page styles --
\def\ps@mlfourd@main{%
  \let\@mkboth\@gobbletwo
  \def\@oddhead{}\def\@evenhead{}%
  \ifmlfourd@pagenum
    \def\@oddfoot{\hfil\normalfont\small\thepage\hfil}%
  \else
    \def\@oddfoot{}%
  \fi
  \let\@evenfoot\@oddfoot
}
\def\ps@mlfourd@first{%
  \let\@mkboth\@gobbletwo
  \ifmlfourd@review
    \def\@oddhead{\normalfont\footnotesize\itshape\hfil
      Under review for \mlfourd@conference. Please do not distribute.\hfil}%
  \else\ifmlfourd@preprint
    \def\@oddhead{\normalfont\footnotesize\itshape\hfil
      Preprint. \mlfourd@conference.\hfil}%
  \else
    \def\@oddhead{}%
  \fi\fi
  \def\@evenhead{}%
  \ifmlfourd@pagenum
    \def\@oddfoot{\hfil\normalfont\small\thepage\hfil}%
  \else
    \def\@oddfoot{}%
  \fi
  \let\@evenfoot\@oddfoot
}
\pagestyle{mlfourd@main}

%%------------------------------------------------------------ bibliography ---
\renewcommand{\refname}{References}
\let\mlfourd@thebibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \mlfourd@thebibliography{#1}%
  \footnotesize
  \setlength{\itemsep}{0.3ex \@plus 0.15ex}%
  \setlength{\parsep}{0pt}%
  \setlength{\labelsep}{0.5em}%
}

%%------------------------------------------------------- review mode extras --
\ifmlfourd@review
  \ifmlfourd@lineno
    \IfFileExists{lineno.sty}{%
      \RequirePackage[mathlines,switch]{lineno}%
      \renewcommand{\linenumberfont}{\normalfont\tiny\sffamily\color{gray}}%
      \AtBeginDocument{\linenumbers}%
    }{}%
  \fi
\fi

%%--------------------------------------------------------------- hyperlinks --
\RequirePackage{url}
\RequirePackage[bookmarks=false,breaklinks=true,pdfstartview=FitH]{hyperref}
\ifmlfourd@review
  \hypersetup{colorlinks=true,allcolors=ml4dlink}
\else\ifmlfourd@preprint
  \hypersetup{colorlinks=true,allcolors=ml4dlink}
\else
  \hypersetup{hidelinks}
\fi\fi
\urlstyle{same}

\endinput
%%=============================================================================
