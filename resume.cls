% vim: set ft=tex:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[20/9/2020 Custom resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[absolute, overlay]{textpos}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fontawesome5}
\RequirePackage{varwidth}
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{tabularx}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}

% Set required lengths
\newlength{\sidebarwidth}
\newlength{\sidebarmargin}
\setlength{\sidebarwidth}{0.27\paperwidth}
\setlength{\sidebarmargin}{5mm}
\setlength{\parindent}{0em}
\TPMargin{2mm}

\renewcommand{\familydefault}{\sfdefault}
\setsansfont{Roboto}[
  UprightFont = *-Regular,
  %-- Upright --%
  FontFace={ul}{n}{Font=*-Thin},
  FontFace={l}{n}{Font=*-Light},
  FontFace={m}{n}{Font=*-Regular},
  FontFace={mb}{n}{Font=*-Medium},
  FontFace={b}{n}{Font=*-Bold},
  FontFace={eb}{n}{Font=*-Black},
  % %-- Italic --%
  FontFace={ul}{it}{Font=*-ThinItalic},
  FontFace={l}{it}{Font=*-LightItalic},
  FontFace={m}{it}{Font=*-Italic},
  FontFace={mb}{it}{Font=*-MediumItalic},
  FontFace={b}{it}{Font=*-BoldItalic},
  FontFace={eb}{it}{Font=*-BlackItalic},
]


%---------------------------------------
% Font / style configuration
%----------------------------------------
\definecolor{white}{HTML}{FFFFFF}
\definecolor{lowcontrastwhite}{rgb}{0.8,0.8,0.8}
\definecolor{lightgray}{HTML}{999999}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{darkgray}{HTML}{333333}
\definecolor{black}{HTML}{000000}
\definecolor{lightblue}{rgb}{0.3, 0.3, 0.5}
\definecolor{darkblue}{HTML}{171e4f}
\colorlet{skillempty}{lightblue}
\colorlet{skillfilled}{lowcontrastwhite}
\colorlet{sidebartext}{lowcontrastwhite}
\colorlet{text}{gray}
\colorlet{entrytitle}{darkgray}
\colorlet{section}{darkgray}
\colorlet{sidebar}{darkblue}
\colorlet{sidebarsection}{white}
\definecolor{accent}{HTML}{004bc4}
\newcommand{\@sectioncolor}[3]{
	\textcolor{accent}{#1#2#3}%
}
\newcommand{\sectioncolor}[1]{
	\@sectioncolor #1
}

\newcommand{\firstnamestyle}[1]{{\fontseries{l}\selectfont\color{lowcontrastwhite}#1}}
\newcommand{\lastnamestyle}[1]{{\fontseries{mb}\selectfont\color{white}#1}}
\newcommand{\datestyle}[1]{{\color{accent}#1}}
\newcommand{\entrypositionstyle}[1]{\begingroup\fontseries{mb}\textcolor{text}{#1}\endgroup}
\newcommand{\entrydatestyle}[1]{{\fontseries{m}\selectfont\color{accent}#1}}
\newcommand{\entrylocationstyle}[1]{\textbf{\textcolor{entrytitle}{#1}}}
\newcommand{\entryplacestyle}[1]{\begingroup\fontseries{l}\textit{\textcolor{text}{#1}}\endgroup}
\newcommand{\entrydescriptionstyle}[1]{\begingroup\fontseries{l}\selectfont\color{text}#1\endgroup}
\newcommand{\skillstyle}[1]{{\color{lowcontrastwhite} #1}}


%---------------------------------------
% Custom formatting commands
%----------------------------------------
\newcommand{\icontext}[2] {
	\iconstyle{#1}\hspace{2mm}#2
}
\newcommand{\iconlink}[3] {
	\href{#3}{\iconstyle{#1}\hspace{2mm}#2}
}
\newcommand{\githublink}[2] {
	\iconlink{\faGithubSquare}{#2}{https://github.com/\thegithub/#1}
}

% No page number
\pagestyle{empty}
\geometry{margin=0pt, right=\sidebarmargin, left=\sidebarwidth+\sidebarmargin, nohead, nofoot}


\newcommand*{\name}[2]{\newcommand*{\firstname}{#1}\newcommand*{\lastname}{#2}}
\newcommand*{\phone}[1]{\newcommand*{\thephone}{#1}}
\newcommand*{\mail}[1]{\newcommand*{\themail}{#1}}
\newcommand*{\github}[1]{\newcommand*{\thegithub}{#1}}
\newcommand*{\linkedin}[1]{\newcommand*{\thelinkedin}{#1}}

\newcommand{\headersep}{\\[0.5em]}
\newcommand{\makesidebar}{%
  \newcommand{\iconstyle}[1]{{\color{white}##1}}
  \titleformat{\section}
  {\normalfont\raggedright\bfseries\Large\color{sidebarsection}}{\thesection}{1em}{}[{\color{lightgray}\titlerule[0.8pt]}]
	\begin{textblock*}{0.27\paperwidth}(0pt,0.5cm)
		\begin{center}
			\color{skillempty}
			\setlength{\fboxrule}{2pt}
			\setlength{\fboxsep}{0pt}
			\fbox{\includegraphics[trim=5mm 17mm 0mm 2mm, clip, width=0.8\sidebarwidth]{portrait.jpg}}%

			\vspace{1em}
			\color{sidebartext}
      {\Huge \firstnamestyle{\firstname{}} \lastnamestyle{\lastname}}

			\vspace{1em}
			\begin{varwidth}{\textwidth}
				\raggedright
        \icontext{\faPhone*}{\thephone}\headersep{}
        \iconlink{\faEnvelope}{\themail}{mailto:\themail}\headersep{}
        \iconlink{\faGithub}{github.com/\thegithub}{https://github.com/\thegithub}\headersep{}
        \iconlink{\faLinkedin}{linkedin.com/in/\thelinkedin}{https://www.linkedin.com/in/\thelinkedin}
			\end{varwidth}

			\input{skills}
		\end{center}
	\end{textblock*}

	\begin{tikzpicture}[remember picture,overlay]
		\fill[sidebar] (current page.south west) rectangle ++(0.27\paperwidth,\paperheight);
	\end{tikzpicture}

  \renewcommand{\iconstyle}[1]{{\color{darkgray}##1}}
  \titleformat{\section}
  {\normalfont\raggedright\bfseries\Large\color{section}}{\thesection}{1em}{}[{\color{lightgray}\titlerule[0.8pt]}]

}

\newcommand{\cventry}[5]{%
	\item\begin{tabularx}{\textwidth}{@{}Xr@{}}
		\entrylocationstyle{#2} & \entrydatestyle{#3} \\
		\entrypositionstyle{#1} & \null
	\end{tabularx}

	\entrydescriptionstyle{#5}
}
\newcommand{\cvproject}[3]{%
	\item\begin{tabularx}{\textwidth}{@{}Xr@{}}
		\entrylocationstyle{#1} & \entrydatestyle{#2}
	\end{tabularx}

	\entrydescriptionstyle{#3}
}

\newcommand{\cvlanguage}[1]{\begingroup\fontseries{m}\selectfont{}#1\endgroup}
\renewcommand\tabularxcolumn[1]{m{#1}}
\newenvironment{skills}{%
	\begin{tabular}{l}
}{
	\end{tabular}
	\vspace{-0.8em}
}

\newcommand{\skill}[2]{
	{\skillstyle{#1}}\\[0.1mm]
	\begin{tikzpicture}[x=1.5em]
		\foreach \n in {1,...,#2}{
			\fill[color=skillfilled, xslant=0.5] (\n, 0) rectangle ++(1.2em, 0.74em);
		}
		\ifnum #2<8
			\foreach \n in {#2,...,7}{
				\fill[color=skillempty, shift={(1,0)}, xslant=0.5] (\n, 0) rectangle ++(1.2em, 0.74em);
			}
		\fi
	\end{tikzpicture}\\[0.8em]
}

\newenvironment{cventries}{
	\begin{enumerate}[align=parleft, left=0em..0em, label={}, itemsep=0.4em]
}{
	\end{enumerate}
}

\newenvironment{cvitems}{
  \vspace{-0.3em}
	\begin{itemize}[align=parleft, left=1em..2em, itemsep=0.1em, topsep=0pt, partopsep=0pt]
}{
	\end{itemize}
}
