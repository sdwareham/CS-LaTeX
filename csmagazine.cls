
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{csmagazine}[2017/12/19 IEEE Computer Society magazine LaTeX class]

%Based on article class
\LoadClass[9pt, letterpaper, twoside]{extarticle}



%============= Import Required Packages ==============


%set encoding
\RequirePackage[utf8]{inputenc}

%For math
\RequirePackage{amsmath}

%allow multi-line comments
\RequirePackage{comment}

%For References, using BibLaTeX and biber
\RequirePackage[style=numeric, sorting=none]{biblatex}

%Selects a font for this document
\RequirePackage{times}

%Added to import images/place external files as images
\RequirePackage{graphicx}

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

%To add a dashed rule under figure captions
\RequirePackage{dashrule}

%To set leading
\RequirePackage{leading}

%Changes scaling of \Huge
\RequirePackage[12pt]{moresize}


%============= Colors ==============

%Define the blue used in our template
\definecolor{cs-blue}{RGB}{42,102,156}

%Grey used in section header
\definecolor{cs-grey}{RGB}{64,64,64}

%Define the green used for table titles
\definecolor{cs-green}{RGB}{57,130,73}


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
		\centering
		\vspace*{-1.1in}
		\noindent\makebox[\textwidth]{\includegraphics[width=9in]{articleHeader.png}}		
	\end{figure}%
	
	%Add the article type and section title
	\vspace*{-1in}
	{\fontfamily{phv}\fontsize{10pt}{15pt}
		\selectfont
		\noindent\hspace{-1.5em}\fcolorbox{cs-grey}{cs-grey}{\makebox[\textwidth][l]{\color{white}#1}}
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

\titleformat{\section}{\fontfamily{phv}\selectfont\huge\color{cs-blue}}{}{0pt}{\includegraphics[height=1em]{sectionTitleGraphic.jpg}~}
\titleformat{\subsection}{\fontfamily{phv}\selectfont\Large\color{cs-blue}}{}{0pt}{}
\titleformat{\subsubsection}{\fontfamily{phv}\selectfont}{}{0pt}{}



%===== Table Titles =============

\newcommand{%
	\ieeecsTableTitle}[1]{%
{\color{cs-green}
	\textbf{	
	\caption{#1}}}
\vspace*{1em}
}


%===== Figure Captions =============

\newcommand{%
	\ieeecsFigureCaption}[1]{%
	\vspace*{-3em}
	{\color{cs-blue}
		\textbf{	
			\caption{#1}}}		
		\hdashrule{\textwidth}{1pt}{1pt}
	\vspace*{1em}
}

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
	
}


%============= About the Author  ==============

\newcommand{%
	\ieeecsAboutAuthor}[1]{%
	\vspace*{.5em}
	{\color{cs-blue}	
	\noindent\hdashrule{\textwidth}{1pt}{1pt}
	}
	\\	
	\vspace*{.25em}{\fontfamily{phv}\selectfont\Large\noindent #1 \normalsize}
	%\vspace*{-1em}
}



%============= Author Bios ==============

\newcommand{%
	\ieeecsAuthorBio}[2]{%
	\noindent
	{\fontfamily{ptm}\textbf{#1} #2}%
	\vspace*{1em}
}


%========= Custom bibliography without [] around labels ==========
	
	\defbibenvironment{bibliography}
	{\list
		{\hspace{1em}\printfield[labelnumberwidth]{prefixnumber}\printfield{labelnumber}.}
		{\setlength{\labelwidth}{\labelnumberwidth}%
			\setlength{\leftmargin}{\labelwidth}%
			\setlength{\labelsep}{\biblabelsep}%
			\addtolength{\leftmargin}{\labelsep}%
			\setlength{\itemsep}{\bibitemsep}%
			\setlength{\parsep}{\bibparsep}}%
		\renewcommand*{\makelabel}[1]{\hss##1}}
	{\endlist}
	{\item}

