
%Version of LaTeX required
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{csmagazine}[May 15, 2018 IEEE Computer Society magazine LaTeX class]

%Based on extarticle class for extended font sizes
\LoadClass[9pt, letterpaper, twoside]{extarticle}

%============= Import Required Packages ==============

%set encoding of the output (fonts)
\usepackage[T5,TS1,T1]{fontenc} %T1 is deafulted. T5 & TS1 are also provided as options. 

%set encoding of the input (editor)
\RequirePackage[utf8]{inputenc}

%For math
\RequirePackage{amsmath}

%allow multi-line comments
\RequirePackage{comment}

%To customize figure/table/algorithm captions
\RequirePackage{caption}

%For References, using BibLaTeX and biber
%\RequirePackage[style=numeric, citestyle=ieee, sorting=none]{biblatex}

%Using BibTeX and natbib to style citations and references
\RequirePackage[sort, numbers, super]{natbib}

%Selects a font for this document
\RequirePackage{times}

%Added to import images/place external files as images
\RequirePackage{graphicx}

%To position figure and tables
\RequirePackage{float}

%To set custom colors
\RequirePackage{xcolor}
\RequirePackage{color}

%To create custom titles command
\RequirePackage{titling}

%Used for tables with multi-row cells
\RequirePackage{multirow}

%Use to wrap text around author colorbox
\RequirePackage{wrapfig}

%Used to adjust page size and margins
\RequirePackage{geometry}

%Remove 'Abstract' title from abstract
\RequirePackage{abstract}

%Adjust the color used in section titles
\RequirePackage{titlesec}

%To control the page headers
\RequirePackage{fancyhdr}

%For code blocks and algorithms
\RequirePackage{listings}

%To add a dashed rule under figure captions
\RequirePackage{dashrule}

%To set leading
\RequirePackage{leading}

%Changes scaling of \Huge
\RequirePackage[12pt]{moresize}

%Char­ac­ter pro­tru­sion and font ex­pan­sion, fur­ther­more the ad­just­ment of in­ter­word spac­ing and ad­di­tional kern­ing, as well as hy­phen­at­able let­terspac­ing
\RequirePackage{microtype}

%Used for logos (METAFONT and METAPOST)
\RequirePackage{hologo}

\RequirePackage{url}

%============= Colors ==============

%Define the blue used in our template
\definecolor{cs-blue}{RGB}{42,102,156}

%Grey used in section header
\definecolor{cs-grey}{RGB}{64,64,64}

%Define the green used for table titles
\definecolor{cs-green}{RGB}{57,130,73}


%============= Algorithms ==============

%Change default caption of 'Listing' to 'Algorithm'
\renewcommand{\lstlistingname}{Algorithm}% Listing -> Algorithm
\renewcommand{\lstlistlistingname}{List of \lstlistingname s}% List of Listings -> List of Algorithms

\lstset{frame=single} %set listings/algorithms to have a single line frame
\lstset{captionpos=b} %set listings/algorithms to have captions beneath
\lstnewenvironment{programCode}{
	\lstset{frame=none}}{} %create new program code env. without frames


%============= Page Setup (Margins, leading, and text width) ==============

%set the page dimensions
\paperheight=10.75in
\paperwidth=7.875in

%Set left margin and text width
\addtolength{\oddsidemargin}{.5in} %Use a smaller number to move text left (reduce L margin)

%adjust margin for even pages
\addtolength{\evensidemargin}{0.0in} %Use a smaller number to move text left (reduce L margin)

%Adjust legnth of text for all pages
\addtolength{\textwidth}{-1.05in} %Use a larger number to increase the length of the text (reduce R margin)

%Set top margin and tex height
\addtolength{\topmargin}{-.25 in} %Use a smaller number to move text up (reduce T margin)
\addtolength{\textheight}{1 in} %Use a larger number increase height of text (reduce B margin)
  
%Remove 'Abstract' title from abstract
\renewcommand{\abstractname}{}    % clear the title
\renewcommand{\absnamepos}{empty} % originally center

%Set leading for article
\leading{12pt}

%set spacing between paragraphs
\setlength{\parskip}{1em}

%Set lists style for lslistings environments
\lstset{basicstyle=\ttfamily,breaklines=true, escapeinside={(\%*}{\%*)},}



%============= First Page Header Graphic / Running page headers ==============

\newcommand{%
	\ieeecsPageHeaders}[2]{%
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[LO]{\includegraphics[width=2em]{pageHeader.jpg}{\fontfamily{phv}\small\color{cs-grey} ~~#1}}% Odd page header and number to left top
	\fancyhead[LE]{\includegraphics[width=2em]{pageHeader.jpg}{\fontfamily{phv}\small\color{cs-grey} ~~#2}}% Even page header and number at left top
	\renewcommand{\headrulewidth}{0pt}% disable the underline of the header part
	
	%Add the header image
	\begin{figure}
		%\centering
		\vspace*{-1.1in}
		\noindent\makebox[\textwidth]{\includegraphics[width=9in]{articleHeader.png}}		
	\end{figure}%
	
	%Add the article type and section title
	\vspace*{-1in}
	{\fontfamily{phv}\fontsize{10pt}{15pt}
		\selectfont
		\noindent\hspace{-1.5em}\fcolorbox{cs-grey}{cs-grey}{\makebox[\textwidth + .75in][l]{\color{white}#1}}
	}
	\vspace*{.5in}
	
	%Added to fix \headheight warnings
	\setlength{\headheight}{14pt}
}



%============= Article title ==============

\newcommand{%
	\ieeecsArticleTitle}[1]{%
	\color{cs-blue} 
	\Huge
	\begin{flushleft}
		{\fontfamily{phv}			
			\selectfont	
			\thetitle
		}
	\end{flushleft}
	\color{black}
	
	\normalsize	
	\vspace*{1em}
}


%============= Author Box ==============

\newcommand{%
\ieeecsInsertAuthor}{%
\begin{wrapfigure}{l}{0.45\textwidth}
	\fcolorbox{gray!15}{gray!15}{%
		\begin{minipage}[t]{0.4\textwidth}
			\begin{flushleft}			
				\vspace*{.5em}
				\small 
				\textbf{\theauthor}
				\normalsize
			\end{flushleft}
	\end{minipage}}%
\end{wrapfigure}%
} 


%======= Author Box Wide (More than 15 authors) =========




%============= Introduction Section (unused)  ==============

\newcommand{%
	\ieeecsStartIntro}{%
\color{cs-blue}	
\section*{} %An asterisk is used here to suppress adding a section number	
\color{black}\
}

%============= Abstract  ==============

%Set the abstract to used a sans-serif font
\newcommand{%
	\ieeecsAbstract}[1]{%
	\raggedright\textsf{{\small #1}}
}

%Command to use if the article has no abstract. Moves intro. paragraphs higher on the page.
\newcommand{%
	\ieeecsNoAbstract}{%
	\textsf{}
	\vspace*{-2.5em}	
}

%============= New Introduction Section  ==============

%The Introduction

\newcommand{%
	\ieeecsIntroduction}[1]{%
	#1
}

%============= Author Affiliations ==============

\newcommand{%
	\ieeecsAffiliation}[1]{%
	\textnormal{#1}%
	\vspace*{.25em}
}

\newcommand{%
	\ieeecsnoAffiliation}{%
	\vspace*{.25em}
}


%============= Update Section Titles to use CS blue ==============

\titleformat{\section}{\fontfamily{phv}\selectfont\huge\raggedright\color{cs-blue}}{}{0pt}{\includegraphics[height=1em]{sectionTitleGraphic.jpg}~}
\titleformat{\subsection}{\fontfamily{phv}\selectfont\Large\raggedright\color{cs-blue}}{}{0pt}{}
\titleformat{\subsubsection}{\fontfamily{phv}\selectfont\raggedright}{}{0pt}{}


%============= Custom captions ==============

%Setup Algorithm captions
\DeclareCaptionFormat{myAlgorithmCapformat}{%
	\vspace{1em}
	
	{\fontfamily{phv}\selectfont{\color{cs-blue}#1#2#3}}
	\noindent\hdashrule{\textwidth}{1pt}{1pt}
} 
\captionsetup[lstlisting]{format=myAlgorithmCapformat}

%Setup figure captions
\DeclareCaptionFormat{myFigureCapformat}{%
	{\fontfamily{phv}\selectfont{\color{cs-blue}#1#2#3}}
	\noindent\hdashrule{\textwidth}{1pt}{1pt}
} 
\captionsetup[figure]{format=myFigureCapformat}

%Setup table captions
\DeclareCaptionFormat{myTableCapformat}{%
	{\fontfamily{phv}\selectfont{\color{cs-green}#1#2#3}}
} 
\captionsetup[table]{format=myTableCapformat}


%===== Boxed Text =============

%\newcommand{%
%	\ieeecsBoxedText}[1]{%
%	\setlength{\fboxsep}{1em}
%	\fbox{\parbox{\textwidth - 3em}{#1}}
%}

\newenvironment{ieeecsBoxedText}[1]
{\setlength{\fboxsep}{1em}\fbox{\parbox{\textwidth - 3em}{#1}}}{}


%============= References Header  ==============

\newcommand{%
	\ieeecsReferences}[1]{%
	
	\vspace*{.5em}
	{\color{cs-blue}
	\noindent\hdashrule{\textwidth}{1pt}{1pt}
	}
	\\
	\vspace*{.25em}
	{\fontfamily{phv}\selectfont\Large\noindent #1 \normalsize }
	\vspace*{-1em}
	
	%to remove references title created by bibtex
	\renewcommand{\refname}{\textsc{}}
	\titleformat{\section}{}{}{}{}
	\vspace*{-4em}
	
}

%============= Make citations superscript  ==============
%\newcommand{%
%	\cscite}[1]{
%	\textsuperscript{\citealt{#1}}
%}



%============= Acknowledgments header ==============

\newcommand{%
	\ieeecsAcknowledgmentsHeader}[1]{%
	\vspace*{.5em}
	{\color{cs-blue}	
		\noindent\hdashrule{\textwidth}{1pt}{1pt}
	}
	\\	
	\vspace*{.25em}{\fontfamily{phv}\selectfont\Large\noindent #1 \normalsize}
}


%============= Portraits ==============

\newcommand{%
	\ieeecsPortrait}[3]{%
	\begin{minipage}{0.9\textwidth}		
		\begin{wrapfigure}{l}{0.25\textwidth}%
			\vspace{-1.25em}
			\includegraphics[width=#2]{#1}
		\end{wrapfigure}			
		#3 
	\end{minipage}
}

%============= Acknowlegment Environment  ==============

\newenvironment{ieeeCSAcknowledgment}
{\noindent}{\vspace*{1em}}


%============= About the Author  ==============

\newcommand{%
	\ieeecsAboutAuthor}[1]{%
	\vspace*{.5em}
	{\color{cs-blue}	
	\noindent\hdashrule{\textwidth}{1pt}{1pt}
	}
	\\	
	\vspace*{.25em}{\fontfamily{phv}\selectfont\Large\noindent #1 \normalsize}
}



%============= Author Bios ==============

%\newcommand{%
%	\ieeecsAuthorBio}[2]{%
%	\noindent
%	{\fontfamily{ptm}\textbf{#1} #2}%
%	\vspace*{1em}
%}

\newenvironment{ieeeCSAuthorBio}
{\noindent}{\vspace*{1em}}


%========= Custom bibliography without [] around labels ==========
	
%	\defbibenvironment{bibliography}
%	{\list
%		{\printfield[labelnumberwidth]{prefixnumber}\printfield{labelnumber}.}
%		{\setlength{\labelwidth}{\labelnumberwidth}%
%			\setlength{\leftmargin}{\labelwidth}%
%			\setlength{\labelsep}{\biblabelsep}%
%			\addtolength{\leftmargin}{\labelsep}%
%			\setlength{\itemsep}{\bibitemsep}%
%			\setlength{\parsep}{\bibparsep}}%
%		\renewcommand*{\makelabel}[1]{\hss##1}}
%	{\endlist}
%	{\item}


%============= Change style of reference numbers ==============
\renewcommand\@biblabel[1]{#1.}

%=========== Macros for creating TeX/LaTeX and related logos ===========
%=========== Thanks to TUG for proving these macros ====================

\DeclareRobustCommand{\AllTeX}{(La\kern-.075em)\kern-.075em\TeX}

\def\Bib{%
	\ifdim \fontdimen1\font>0pt
	B{\SMC\SMC IB}% \SMC\SMC = two font sizes smaller
	\else
	B\textsc{ib}%
	\fi
}

\def\BibLaTeX{\Bib\kern.02em \LaTeX}
\def\BibTeX{\Bib\kern-.08em \TeX}

%C++
\def\Cplusplus{C\plusplus}
\def\plusplus{\raisebox{.7ex}{$_{++}$}}

%eTeX
\DeclareRobustCommand{\eTeX}{\ensuremath{\varepsilon}-\kern-.125em\TeX}

%KomaScript
\DeclareRobustCommand{\KOMAScript}{\textsf{K\kern.05em O\kern.05em%
		M\kern.05em A\kern.1em-\kern.1em Script}}

%LaTeX	
\DeclareRobustCommand{\La}%
{L\kern-.36em
	{\setbox0\hbox{T}%
		\vbox to\ht0{\hbox{$\m@th$%
				\csname S@\f@size\endcsname
				\fontsize\sf@size\z@
				\math@fontsfalse\selectfont
				A}%
			\vss}%
}}
\DeclareRobustCommand{\TeX}{T\kern-.1667em\lower.424ex\hbox{E}\kern-.125emX\@}

%TikZ
\def\TikZ{Ti{\em k}Z}

%XeTeX
\def\ieeecsreflect#1{%
	\@ifundefined{reflectbox}{%
		\errmessage{A graphics package must be loaded for \string\XeTeX}%
	}{%
		\ifdim \fontdimen1\font>0pt
		\raise 1.75ex \hbox{\kern.1em\rotatebox{180}{#1}}\kern-.1em
		\else
		\reflectbox{#1}%
		\fi
	}%
}
\def\ieeecshideheight#1{\setbox0=\hbox{#1}\ht0=0pt \dp0=0pt \box0 }
\def\XekernbeforeE{-.125em}
\def\XekernafterE{-.1667em}
\DeclareRobustCommand{\Xe}{\leavevmode
	\ieeecshideheight{\hbox{X%
			\setbox0=\hbox{\TeX}\setbox1=\hbox{E}%
			\lower\dp0\hbox{\raise\dp1\hbox{\kern\XekernbeforeE\ieeecsreflect{E}}}%
			\kern\XekernafterE}}}
\def\XeTeX{\Xe\TeX}
\def\XeLaTeX{\Xe{\kern.11em \LaTeX}}
