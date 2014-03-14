\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{AGTI}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax
\LoadClass[
        12pt,
	a4paper,
%	pagesize,
	twoside,
	BCOR10.0mm,
	openright,
%	headinclude,
%	footexclude,
	parskip=half,
	cleardoublepage=empty,
	headings=small,
%  normalheadings,
	headsepline,
  numbers=noenddot,
        DIV12]{scrreprt}

\RequirePackage[ngerman]{babel}
\RequirePackage{bibgerm}
\RequirePackage[utf8]{inputenc}
%\RequirePackage{longtable}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage[T1]{fontenc}
\RequirePackage[komastyle,automark,autooneside,headsepline]{scrpage2}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\floatname{algorithm}{\textbf{Algorithmus}}
%\RequirePackage{url}
\RequirePackage{listings}
\RequirePackage{vmargin}          % Seitenränder einstellen leichtgemacht
\RequirePackage{hyperref}			%[plainpages=false, pdfpagelabels]
\RequirePackage{amsmath}	
\RequirePackage{amssymb}
\RequirePackage{algorithmicx}
\newcommand{\theHalgorithm}{\thealgorithm}
\pagestyle{scrheadings}
\clearscrheadfoot
\ohead{\pagemark}
\ihead{\headmark}

%% Hier kommen ein paar Fuschereien von Kalle
\lstset{basicstyle=\tiny}

%% Seitengröße mit vmargin-Paket einstellen
\setpapersize{A4}
% \setmarginsrb{randlinks}{randoben}{randrechts}{randunten}
%              {hoehekopf}{abstkopf}{hoehefuss}{abstfuss}
\setmarginsrb{3cm}{1.5cm}{2.4cm}{1.5cm}{6mm}{7mm}{5mm}{15mm}
%\setmarginsrb{3cm}{1.5cm}{3cm}{1.5cm}{6mm}{7mm}{5mm}{15mm}

%% \chapterheadstartvskip etc:
% \renewcommand*{\chapterheadstartvskip}{\vspace*{0cm}}
% \renewcommand{\chapterheadendvskip}{\vspace{\baselineskip}}
% \newcommand*{\sectionheadstartvskip}{\vspace*{4\baselineskip}}
% \newcommand*{\sectionheadendvskip}{\vspace*{1\baselineskip}}
% \newcommand*{\ssectionheadendvskip}{\vspace*{1\baselineskip}}
% \newcommand*{\sectionpagestyle}{plain}

%% Ausschalten der serifenlosen Überschriften:
\addtokomafont{sectioning}{\normalfont\bfseries}

%% Mehrere Bilder und weniger Text auf einer Seite erlauben
%% -> ergibt weniger Seiten mit Bild-only
\renewcommand{\floatpagefraction}{.9} % Default: .5
\renewcommand{\textfraction}{.15} % Default: .2

%% Bildunterschriften umdefinieren:
\setcapindent{1em}
\addtokomafont{captionlabel}{\bf}
\addtokomafont{caption}{\small}
\addto\captionsngerman{%
  \renewcommand{\figurename}{Abb.}  % Abb. statt Abbildung
%  \renewcommand{\tablename}{Tab.}   % Tab. statt Tabelle
}
% Vorsetzen der Variablen
\newcommand{\AGTItitel}{Noch kein Titel gesetzt}
\newcommand{\AGTIautor}{Noch kein Autor gesetzt}
\newcommand{\AGTItyp}{Noch kein Typ gesetzt}
\newcommand{\AGTIdate}{Noch kein Datum gesetzt}
\newcommand{\AGTIerstgutachter}{Noch kein Erstgutachter gesetzt}
\newcommand{\AGTIzweitgutachter}{Noch kein Zweitgutachter gesetzt}


% Internen Titel setzen
\newcommand{\titel}[1]{\renewcommand{\AGTItitel}{#1}}
% Internen Autor setzen
\newcommand{\autor}[1]{\renewcommand{\AGTIautor}{#1}}
% Internen Typ der Arbeit setzen
\newcommand{\typ}[1]{\renewcommand{\AGTItyp}{#1}}
% Internes Datum der Arbeit setzen
\newcommand{\datum}[1]{\renewcommand{\AGTIdate}{#1}}
% Internen Erstgutachter der Arbeit setzen
\newcommand{\erstgutachter}[1]{\renewcommand{\AGTIerstgutachter}{#1}}
% Internen Zweitgutachter der Arbeit setzen
\newcommand{\zweitgutachter}[1]{\renewcommand{\AGTIzweitgutachter}{#1}}

\title{\AGTItitel}
\author{\AGTIautor}
\subject{\AGTItyp}
\date{\AGTIdate}



%% -------- Extra-Titelblatt für schöne Frontseite mit Bild ----------
\newcommand{\HRule}{\rule{\linewidth}{0.8mm}}
\newcommand{\extraTitelblatt}[1]{
%\extratitle{
\thispagestyle{empty}
\begin{center}
   \includegraphics[width=8cm]{bilder/unilogo}\\
   \Large{AG Technische Informatik}
\end{center}
\begin{center}
\protect{\vspace{.3cm}}
\protect{\HRule\vspace{0.3cm}}
\protect{\vbox{\centerline{\LARGE \bf \@subject}}}
\protect{
  \vspace{0.15cm}
  \HRule
  \vspace{0.3mm}
}
\end{center}
\begin{center}
 \vspace{0.3cm}
  \vbox{ #1 }
  \vfill
  \vspace{0.7cm}
%  \vbox{ \huge \textbf{\textsf{\@title}}}
  \vbox{ \huge \textbf{\@title}}
  \vspace{1cm}
  \vbox{\Large \@author}
  \vspace{1.0cm}
  \protect{ \HRule \vspace{0.3cm}}
  \protect{\vbox{ \Large \@date}\vspace{0.1cm}}
  \protect{ \HRule }
\end{center}
%}
\hypersetup{pdftitle=\@title,pdfauthor=\@author}
}

%% -------- Standard-Titelblatt ----------
\newcommand{\standardTitelblatt}{
%\extratitle{
\thispagestyle{empty}
\begin{center}
   \includegraphics[width=8cm]{bilder/unilogo}\\
   \Large{AG Technische Informatik}
\end{center}
\begin{center}
 \protect{\vspace{1cm}}
% \protect{\HRule\vspace{0.3cm}}
\protect{\vbox{\centerline{\Large \bf \@subject}}}
% \protect{
%   \vspace{0.15cm}
%   \HRule
%   \vspace{0.3mm}
% }
\end{center}
\begin{center}
 \vspace{0.3cm}
%   \vbox{ #1 }
  \vspace{0.7cm}
%  \vbox{ \huge \textbf{\textsf{\@title}}}
  \vbox{ \huge \textbf{\@title}}
  \vspace{1.5cm}
  \vbox{\Large \@author}
 
  \vspace{1.2cm}
%  \protect{ \HRule \vspace{0.3cm}}
  \protect{\vbox{ \Large \@date}\vspace{0.1cm}}
%  \protect{ \HRule }
 \vfill

\begin{minipage}{10 cm}
\begin{tabbing}
  \large Erstgutachter: \quad \= \large \AGTIerstgutachter\\ 
  \raisebox{-2.5mm}{\large Zweitgutachter:}\> \raisebox{-2.5mm}{\large \AGTIzweitgutachter}
\end{tabbing}
\end{minipage}

\end{center}
\vspace{3.3cm}
%}
\hypersetup{pdftitle=\@title,pdfauthor=\@author}
}

\def\firstSupervisor#1{\gdef\@firstSupervisor{#1}}
\def\secondSupervisor#1{\gdef\@secondSupervisor{#1}}

% %%%%%%%%% Please uncomment the following lines %%%%%
\publishers{
\begin{center}
\begin{tabular}{ll}
  \large
  Erstgutachter:
  & \large \@firstSupervisor\\
  \large
  Zweitgutachter:
  & \large \@secondSupervisor
\end{tabular}
\end{center}}

\newenvironment{prefacesection}[1]
{\thispagestyle{empty}\centerline{\Large{\textbf{#1}}}\medskip}{}

% \newenvironment{prefacesection}[1]
% {\thispagestyle{empty}\centerline{\Large{\textbf{{\textsf{#1}}}}}\medskip}{}


\def\signline#1{\gdef\@signline{#1}}
\def\signcity#1{\gdef\@signcity{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
% \def\@title{}
% \def\@author{}
\def\@signcity{Osnabr\"uck}


\def\@submitdate{\ifcase\the\month\or
  Jannuar\or Februar\or M\"arz\or April\or Mai\or Juni\or
  Juli\or August\or September\or Oktober\or November\or Dezember\fi
  \space \number\the\year}

\def\@signline{\@signcity, \@submitdate}



\def\erklaerung{ %the clause that you did not cheat

  \vspace*{15cm}

  %%\chapter*{Erkl\"arung}

  \thispagestyle{empty}

  Hiermit versichere ich, dass ich die vorliegende Arbeit
  selbst\"andig verfasst und keine anderen als die angegebenen
  Quellen und Hilfsmittel benutzt sowie Zitate kenntlich gemacht
  habe.
  
  \bigskip\bigskip

\begin{flushright}
%%\@signline
Osnabrück, den \AGTIdate
\end{flushright}
\vskip 0.5 cm

 %% \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_  \\
 \underline{\qquad\qquad\qquad\qquad\qquad\qquad\qquad}\\
 
 (\AGTIautor)

}
