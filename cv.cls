% vim: set ft=tex:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[20/9/2020 Custom CV class]

\newcommand{\githublinkformat}[1]{%
	#1\hspace{0.15cm}\faGithubSquare
}

\DeclareOption{print}{\renewcommand{\githublinkformat}[2]{#1}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[absolute, overlay]{textpos}
\RequirePackage[sfdefault, light]{roboto}
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
\RequirePackage{parskip}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}

% Set required lengths
\newlength{\sidebarwidth}
\newlength{\sidebarmargin}
\setlength{\sidebarwidth}{0.27\paperwidth}
\setlength{\sidebarmargin}{5mm}
\TPMargin{1.5mm}

%---------------------------------------
% Font / style configuration
%----------------------------------------
\definecolor{accent}{HTML}{004bc4}
\definecolor{sidebarbg}{HTML}{171e4f}
\definecolor{sidebarfg}{rgb}{1.0,1.0,1.0}
\definecolor{sidebarlowcontrastfg}{rgb}{0.8, 0.8, 0.8}
\definecolor{skillfilled}{rgb}{0.8, 0.8, 0.8}
\definecolor{skillempty}{rgb}{0.3, 0.3, 0.5}
\definecolor{textfg}{rgb}{0.2,0.2,0.2}
\definecolor{unimportantfg}{rgb}{0.8,0.8,0.8}
\definecolor{lowcontrastfg}{rgb}{0.2,0.2,0.2}

\newcommand{\datestyle}[1]{{\color{accent} #1}}
\newcommand{\descriptionstyle}[1]{{\color{lowcontrastfg} #1}}

% No page number
\pagestyle{empty}
\geometry{margin=0pt, right=\sidebarmargin, left=\sidebarwidth+\sidebarmargin, nohead, nofoot}


\titleformat{\section}
{\normalfont\Large\bfseries}{\thesection}{1em}{}[{\color{unimportantfg}\titlerule[0.8pt]}]

\newcommand*{\name}[2]{\newcommand*{\firstname}{#1}\newcommand*{\lastname}{#2}}
\newcommand*{\phone}[1]{\newcommand*{\thephone}{#1}}
\newcommand*{\mail}[1]{\newcommand*{\themail}{#1}}
\newcommand*{\github}[1]{\newcommand*{\thegithub}{#1}}
\newcommand*{\linkedin}[1]{\newcommand*{\thelinkedin}{#1}}

\newcommand*{\githublink}[2]{%
	\href{https://github.com/\thegithub/#1}{\githublinkformat{#2}}
}

\renewcommand\tabularxcolumn[1]{m{#1}}
\newenvironment{skills}{%
	\begin{tabular}{l}
}{
	\end{tabular}
}

\newcommand{\skill}[2]{
	{\color{sidebarlowcontrastfg}#1}\\[0.1mm]
	\begin{tikzpicture}[x=1.5em]
		\foreach \n in {1,...,#2}{
			\fill[color=skillfilled, xslant=0.5] (\n, 0) rectangle ++(1.2em, 0.74em);
		}
		\ifnum #2<8
			\foreach \n in {#2,...,7}{
				\fill[color=skillempty, shift={(1,0)}, xslant=0.5] (\n, 0) rectangle ++(1.2em, 0.74em);
			}
		\fi
	\end{tikzpicture}\\[1em]
}

\newcommand{\makesidebar}{%
	\begin{textblock*}{0.27\paperwidth}(0pt,0.5cm)
		\begin{center}
			\color{skillempty}
			\setlength{\fboxrule}{2pt}
			\setlength{\fboxsep}{0pt}
			\fbox{\includegraphics[trim=10cm 2cm 10cm 2cm, clip, width=0.8\sidebarwidth]{portrait.jpg}}%

			\color{sidebarfg}
			{\Huge \firstname{} \textbf{\lastname}}

			\vspace{1.2em}
			\begin{varwidth}{\textwidth}
				\raggedright
				\faPhone*\hspace{0.2cm}\thephone\\[0.5em]
				\href{mailto:\themail}{\faEnvelope\hspace{0.2cm}\themail}\\[0.5em]
				\href{https://www.linkedin.com/in/\thelinkedin}{\faLinkedin\hspace{0.2cm}linkedin.com/in/\thelinkedin}\\[0.5em]
				\href{https://github.com/\thegithub}{\faGithub\hspace{0.2cm}github.com/\thegithub}\\[0.5em]
			\end{varwidth}

			\vspace{1em}
			\input{skills}
		\end{center}
	\end{textblock*}

	\begin{tikzpicture}[remember picture,overlay]
		\fill[sidebarbg] (current page.south west) rectangle ++(0.27\paperwidth,\paperheight);
	\end{tikzpicture}
}

\newcommand{\datedentry}[5]{%
	\begin{tabularx}{\textwidth}{@{}Xr@{}}
		\textbf{#1} & \datestyle{#3} \\
		\textsc{#2} & \null \\[0.2em]
	\end{tabularx}
	\descriptionstyle{#5}
}
