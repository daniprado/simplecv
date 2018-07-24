%% start of file 'argallarcv.cls'.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{argallarcv}[2017/09/18 initial version.]
\ProcessOptions\relax

\RequirePackage{ifthen}
\RequirePackage{xcolor}
\RequirePackage[T1]{fontenc}
\RequirePackage{calc}
\RequirePackage{suffix}

\newcommand\@ptsize{0}
\input{size1\@ptsize.clo}
\pagenumbering{arabic}
\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}
\usepackage[top=12mm, bottom=12mm, left=18mm, right=18mm]{geometry}
\usepackage{amssymb}
\usepackage{fontawesome}
\setlength{\parindent}{0\p@}

\definecolor{color0}{rgb}{0,0,0}
\definecolor{color1}{rgb}{0.40,0.25,0.25}
\definecolor{color2}{rgb}{0.35,0.35,0.35}
\definecolor{color3}{rgb}{0.20,0.20,0.20}

\AtBeginDocument{\renewcommand{\familydefault}{\sfdefault}}
\AtBeginDocument{\normalfont\color{color0}}

\newcommand*{\name}[2]{\def\@firstname{#1}\def\@familyname{#2}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\skype}[1]{\def\@skype{#1}}
\newcommand*{\labelitemi}{\strut\textcolor{color1}{$\rightarrow$}}
\newcommand*{\labelitemii}{\strut\textcolor{color1}{\checkmark}}
\newcommand*{\labelitemiii}{\strut\textcolor{color1}{$\star$}}

\newcommand*{\mobilesymbol}{\faPhone~}
\newcommand*{\emailsymbol}{\faEnvelope~}
\newcommand*{\linkedinsymbol}{\faLinkedin~}
\newcommand*{\homepagesymbol}{\faGlobe~}
\newcommand*{\skypesymbol}{\faSkype~}
\newcommand*{\listitemsymboli}{\labelitemi~}
\newcommand*{\listitemsymbolii}{\labelitemii~}
\newcommand*{\listitemsymboliii}{\labelitemiii~}

\newcommand\customfont[1]{{\usefont{T1}{custom}{m}{n} #1 }}
\newcommand*{\titlefont}{\fontfamily{custom}\fontsize{34}{36}\mdseries\upshape}
\newcommand*{\pdatafont}{\normalsize\mdseries\upshape}
\newcommand*{\introfont}{\normalsize\mdseries\upshape}
\newcommand*{\sectionfont}{\Large\mdseries\upshape}
\newcommand*{\subsectionfont}{\large\mdseries\upshape}
\newcommand*{\tailsubsectionfont}{\large\mdseries\upshape}
\newcommand*{\textitemfont}{\normalsize\mdseries\upshape}
\newcommand*{\tailitemfont}{\normalsize\mdseries\upshape}
\newcommand*{\detailfont}{\normalsize\mdseries\upshape}

\newcommand*{\namestyle}[1]{{\titlefont\textcolor{color0}{#1}}}
\newcommand*{\surnamestyle}[1]{{\titlefont\textcolor{color2}{#1}}}
\newcommand*{\pdatastyle}[1]{{\pdatafont\textcolor{color0}{\textit{#1}}}}
\newcommand*{\introstyle}[1]{{\introfont\textcolor{color0}{#1}}}
\newcommand*{\sectionstyle}[1]{{\sectionfont\textcolor{color1}{\textbf{#1}}}}
\newcommand*{\subsectionstyle}[1]{{\subsectionfont\textcolor{color1}{\textbf{#1}}}}
\newcommand*{\tailsubsectionstyle}[1]{{\tailsubsectionfont\textcolor{color3}{#1}}}
\newcommand*{\textitemstyle}[1]{{\textitemfont\textcolor{color0}{#1}}}
\newcommand*{\tailitemstyle}[1]{{\tailitemfont\textcolor{color3}{#1}}}
\newcommand*{\detailstyle}[1]{{\detailfont\textcolor{color2}{\textit{#1}}}}
\newcommand*{\detailsinitemstyle}[1]{{\detailfont\textcolor{color2}{\textit{#1}}}}

\newlength{\introwidth}
\setlength{\introwidth}{0.165\textwidth}
\newlength{\separatorwidth}
\setlength{\separatorwidth}{0.015\textwidth}
\newlength{\textwidth}

\newlength{\baseletterheight}
\settoheight{\baseletterheight}{\sectionstyle{o}}
\setlength{\baseletterheight}{\baseletterheight-0.55ex}

\newif\if@firstdetailselement\@firstdetailselementtrue
\newcommand*{\makenewline}{
  \if@firstdetailselement
    \strut
  \else
    \\\fi
  \@firstdetailselementfalse}

\newcommand*{\calculatelengths}{
  \setlength{\textwidth}{\textwidth-\separatorwidth-\introwidth}
  \setlength{\parskip}{0\p@}}
\AtBeginDocument{\calculatelengths{}}
\newcommand*{\@initializelength}[1]{
  \ifdefined#1\else\newlength{#1}\fi}

\newcommand*{\createtitle}{
  \newbox{\title}
  \savebox{\title}{
    \begin{tabular}[b]{@{}r@{}}
      \ifthenelse{\isundefined{\@mobile}}{}{\makenewline\mobilesymbol\pdatastyle{\@mobile}}
      \ifthenelse{\isundefined{\@email}}{}{\makenewline\emailsymbol\pdatastyle{\@email}}
      \ifthenelse{\isundefined{\@linkedin}}{}{\makenewline\linkedinsymbol\pdatastyle{\@linkedin}}
      \ifthenelse{\isundefined{\@homepage}}{}{\makenewline\homepagesymbol\pdatastyle{\@homepage}}
      \ifthenelse{\isundefined{\@skype}}{}{\makenewline\skypesymbol\pdatastyle{\@skype}}
    \end{tabular}
  }
  \newgeometry{top=12mm, bottom=12mm, left=18mm, right=10mm}
  \namestyle{\@firstname} \surnametyle{\@familyname}
  \hfill
  \llap{\usebox{\title}}
  \par\addvspace{10mm}
}

\AtBeginDocument{\WithSuffix\newcommand\section*{\section}}
\newcommand*{\section}[1]{
  \par\addvspace{5mm}
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separatorwidth}}p{\textwidth}@{}}
    \parbox[t]{\introwidth}{\raisebox{\baseletterheight}{\color{color1}\rule{\introwidth}{0.55ex}}} &{\parbox[t]{\textwidth}{\strut\sectionstyle{#1}}}
  \end{tabular}
  \par\addvspace{2mm}
}

\AtBeginDocument{\WithSuffix\newcommand\subsection*{\subsection}}
\newcommand*{\subsection}[3]{
  \par\addvspace{4mm}
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separatorwidth}}p{\textwidth}@{}}
    \parbox[t]{\introwidth}{} &{\parbox[t]{\textwidth}{\strut\subsectionstyle{#1}{\ifthenelse{\equal{#3}{}}{}{ \strut\tailsubsectionstyle{#2} \strut\tailsubsectionstyle{#3}}}}}
  \end{tabular}
  \par\addvspace{1mm}
}

\AtBeginDocument{\WithSuffix\newcommand\subsectionWithDate*{\subsectionWithDate}}
\newcommand*{\subsectionWithDate}[4]{
  \par\addvspace{4mm}
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separatorwidth}}p{\textwidth}@{}}
    \parbox[t]{\introwidth}{\raggedleft\introstyle{#1}} &{\parbox[t]{\textwidth}{\strut\subsectionstyle{#2}{\ifthenelse{\equal{#3}{}}{}{ \strut\tailsubsectionstyle{#3} \strut\tailsubsectionstyle{#4}}}}}
  \end{tabular}
  \par\addvspace{1mm}
}

\newcommand*{\item}[3]{
  \par\addvspace{2mm}
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separatorwidth}}p{\textwidth}@{}}
    \parbox[t]{\introwidth}{\raggedleft\introstyle{#1}} &{\parbox[t]{\textwidth}{\strut\textitemstyle{#2}{\ifthenelse{\equal{#3}{}}{}{\strut\textitemstyle{, }\strut\tailitemstyle{#3}}}}}
  \end{tabular}
  \par\addvspace{1mm}
}

\newcommand*{\itemnodetail}[3]{
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separatorwidth}}p{\textwidth}@{}}
    \parbox[t]{\introwidth}{\raggedleft\introstyle{#1}} &{\parbox[t]{\textwidth}{\strut\textitemstyle{#2}{\ifthenelse{\equal{#3}{}}{}{\strut\textitemstyle{, }\strut\tailitemstyle{#3}}}}}
  \end{tabular}
}

\newcommand*{\detail}[2][\listitemsymboli]{
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separatorwidth}}p{\textwidth}@{}}
    \parbox[t]{\introwidth}{} &{\strut\detailstyle{#1} \parbox[t]{\textwidth}{\strut\detailstyle{#2}}} 
  \end{tabular}
  \par\addvspace{1mm}
}

\newcommand*{\detailnoitem}[2][\listitemsymbolii]{
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separatorwidth}}p{\textwidth}@{}}
    \parbox[t]{\introwidth}{} &{\strut\detailsinitemstyle{#1} \parbox[t]{\textwidth}{\strut\detailsinitemstyle{#2}}}
  \end{tabular}
  \par\addvspace{1mm}
}

\newcommand*{\detailsimple}[2][\listitemsymboliii]{
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separatorwidth}}p{\textwidth}@{}}
    \parbox[t]{\introwidth}{} &{\strut\detailstyle{#1} \parbox[t]{\textwidth}{\strut\detailstyle{#2}}} 
  \end{tabular}
  \par\addvspace{1mm}
}

\endinput

%% end of file `argallarcv.cls'.
