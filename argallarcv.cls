%% start of file 'argallarcv.cls'.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{argallarcv}[2017/09/18 version inicial.]
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
\newcommand*{\titulofont}{\fontfamily{custom}\fontsize{34}{36}\mdseries\upshape}
\newcommand*{\pdatafont}{\normalsize\mdseries\upshape}
\newcommand*{\introfont}{\normalsize\mdseries\upshape}
\newcommand*{\seccionfont}{\Large\mdseries\upshape}
\newcommand*{\subseccionfont}{\large\mdseries\upshape}
\newcommand*{\coletillasubseccionfont}{\large\mdseries\upshape}
\newcommand*{\textoentradafont}{\normalsize\mdseries\upshape}
\newcommand*{\coletillaentradafont}{\normalsize\mdseries\upshape}
\newcommand*{\detallefont}{\normalsize\mdseries\upshape}

\newcommand*{\nombrestyle}[1]{{\titulofont\textcolor{color0}{#1}}}
\newcommand*{\apellidostyle}[1]{{\titulofont\textcolor{color2}{#1}}}
\newcommand*{\pdatastyle}[1]{{\pdatafont\textcolor{color0}{\textit{#1}}}}
\newcommand*{\introstyle}[1]{{\introfont\textcolor{color0}{#1}}}
\newcommand*{\seccionstyle}[1]{{\seccionfont\textcolor{color1}{\textbf{#1}}}}
\newcommand*{\subseccionstyle}[1]{{\subseccionfont\textcolor{color1}{\textbf{#1}}}}
\newcommand*{\coletillasubseccionstyle}[1]{{\coletillasubseccionfont\textcolor{color3}{#1}}}
\newcommand*{\textoentradastyle}[1]{{\textoentradafont\textcolor{color0}{#1}}}
\newcommand*{\coletillaentradastyle}[1]{{\coletillaentradafont\textcolor{color3}{#1}}}
\newcommand*{\detallestyle}[1]{{\detallefont\textcolor{color2}{\textit{#1}}}}
\newcommand*{\detallesinentradastyle}[1]{{\detallefont\textcolor{color2}{\textit{#1}}}}

\newlength{\introwidth}
\setlength{\introwidth}{0.165\textwidth}
\newlength{\separadorwidth}
\setlength{\separadorwidth}{0.015\textwidth}
\newlength{\textowidth}

\newlength{\baseletterheight}
\settoheight{\baseletterheight}{\seccionstyle{o}}
\setlength{\baseletterheight}{\baseletterheight-0.55ex}

\newif\if@firstdetailselement\@firstdetailselementtrue
\newcommand*{\makenewline}{
  \if@firstdetailselement
    \strut
  \else
    \\\fi
  \@firstdetailselementfalse}

\newcommand*{\calculalongitudes}{
  \setlength{\textowidth}{\textwidth-\separadorwidth-\introwidth}
  \setlength{\parskip}{0\p@}}
\AtBeginDocument{\calculalongitudes{}}
\newcommand*{\@initializelength}[1]{
  \ifdefined#1\else\newlength{#1}\fi}

\newcommand*{\creatitulo}{
  \newbox{\titulo}
  \savebox{\titulo}{
    \begin{tabular}[b]{@{}r@{}}
      \ifthenelse{\isundefined{\@mobile}}{}{\makenewline\mobilesymbol\pdatastyle{\@mobile}}
      \ifthenelse{\isundefined{\@email}}{}{\makenewline\emailsymbol\pdatastyle{\@email}}
      \ifthenelse{\isundefined{\@linkedin}}{}{\makenewline\linkedinsymbol\pdatastyle{\@linkedin}}
      \ifthenelse{\isundefined{\@homepage}}{}{\makenewline\homepagesymbol\pdatastyle{\@homepage}}
      \ifthenelse{\isundefined{\@skype}}{}{\makenewline\skypesymbol\pdatastyle{\@skype}}
    \end{tabular}
  }
  \newgeometry{top=12mm, bottom=12mm, left=18mm, right=10mm}
  \nombrestyle{\@firstname} \apellidostyle{\@familyname}
  \hfill
  \llap{\usebox{\titulo}}
  \par\addvspace{10mm}
}

\AtBeginDocument{\WithSuffix\newcommand\seccion*{\seccion}}
\newcommand*{\seccion}[1]{
  \par\addvspace{5mm}
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separadorwidth}}p{\textowidth}@{}}
    \parbox[t]{\introwidth}{\raisebox{\baseletterheight}{\color{color1}\rule{\introwidth}{0.55ex}}} &{\parbox[t]{\textowidth}{\strut\seccionstyle{#1}}}
  \end{tabular}
  \par\addvspace{2mm}
}

\AtBeginDocument{\WithSuffix\newcommand\subseccion*{\subseccion}}
\newcommand*{\subseccion}[3]{
  \par\addvspace{4mm}
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separadorwidth}}p{\textowidth}@{}}
    \parbox[t]{\introwidth}{} &{\parbox[t]{\textowidth}{\strut\subseccionstyle{#1}{\ifthenelse{\equal{#3}{}}{}{ \strut\coletillasubseccionstyle{#2} \strut\coletillasubseccionstyle{#3}}}}}
  \end{tabular}
  \par\addvspace{1mm}
}

\AtBeginDocument{\WithSuffix\newcommand\subseccionConFecha*{\subseccionConFecha}}
\newcommand*{\subseccionConFecha}[4]{
  \par\addvspace{4mm}
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separadorwidth}}p{\textowidth}@{}}
    \parbox[t]{\introwidth}{\raggedleft\introstyle{#1}} &{\parbox[t]{\textowidth}{\strut\subseccionstyle{#2}{\ifthenelse{\equal{#3}{}}{}{ \strut\coletillasubseccionstyle{#3} \strut\coletillasubseccionstyle{#4}}}}}
  \end{tabular}
  \par\addvspace{1mm}
}

\newcommand*{\entrada}[3]{
  \par\addvspace{2mm}
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separadorwidth}}p{\textowidth}@{}}
    \parbox[t]{\introwidth}{\raggedleft\introstyle{#1}} &{\parbox[t]{\textowidth}{\strut\textoentradastyle{#2}{\ifthenelse{\equal{#3}{}}{}{\strut\textoentradastyle{, }\strut\coletillaentradastyle{#3}}}}}
  \end{tabular}
  \par\addvspace{1mm}
}

\newcommand*{\entradasindetalle}[3]{
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separadorwidth}}p{\textowidth}@{}}
    \parbox[t]{\introwidth}{\raggedleft\introstyle{#1}} &{\parbox[t]{\textowidth}{\strut\textoentradastyle{#2}{\ifthenelse{\equal{#3}{}}{}{\strut\textoentradastyle{, }\strut\coletillaentradastyle{#3}}}}}
  \end{tabular}
}

\newcommand*{\detalle}[2][\listitemsymboli]{
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separadorwidth}}p{\textowidth}@{}}
    \parbox[t]{\introwidth}{} &{\strut\detallestyle{#1} \parbox[t]{\textowidth}{\strut\detallestyle{#2}}} 
  \end{tabular}
  \par\addvspace{1mm}
}

\newcommand*{\detallesinentrada}[2][\listitemsymbolii]{
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separadorwidth}}p{\textowidth}@{}}
    \parbox[t]{\introwidth}{} &{\strut\detallesinentradastyle{#1} \parbox[t]{\textowidth}{\strut\detallesinentradastyle{#2}}}
  \end{tabular}
  \par\addvspace{1mm}
}

\newcommand*{\detallesimple}[2][\listitemsymboliii]{
  \begin{tabular}{@{}p{\introwidth}@{\hspace{\separadorwidth}}p{\textowidth}@{}}
    \parbox[t]{\introwidth}{} &{\strut\detallestyle{#1} \parbox[t]{\textowidth}{\strut\detallestyle{#2}}} 
  \end{tabular}
  \par\addvspace{1mm}
}

\endinput

%% end of file `argallarcv.cls'.
