\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[20/9/2020 Custom CV class]
\LoadClass[a4paper, 11pt]{article}

\RequirePackage[absolute, overlay]{textpos}
\RequirePackage{calc}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage[sfdefault, light]{roboto}
\RequirePackage{fontspec}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}

% Set required lengths
\newlength{\sidebarwidth}
\newlength{\sidebarmargin}
\setlength{\sidebarwidth}{0.25\paperwidth}
\setlength{\sidebarmargin}{0.2cm}

% No page number
\pagestyle{empty}
\geometry{margin=0cm, left=\sidebarwidth+3\sidebarmargin, nohead, nofoot}

%---------------------------------------
% Font configuration
%----------------------------------------


\newcommand*{\name}[2]{\newcommand*{\firstname}{#1}\newcommand*{\lastname}{#2}}

\newcommand{\makeprofile}{%
	\begin{tikzpicture}
  \end{tikzpicture}%
}

\newcommand{\makesidebar}{%
\begin{tikzpicture}[remember picture,overlay]
	\node[draw=none, right=\sidebarwidth / 2 of current page.north west] (center) {};
    \fill[gray] (current page.north west) rectangle ++(\sidebarwidth+2\sidebarmargin,-\paperheight);
		\node [below=1em of center] (portrait) {%
			\setlength{\fboxrule}{2pt}
			\setlength{\fboxsep}{0pt}
			\fbox{\includegraphics[trim=10cm 2cm 10cm 2cm, clip, width=0.8\sidebarwidth]{portrait.jpg}}%
		};
		\node [align=center, below=1em of portrait] {%
			\Huge \firstname{} \textbf{\lastname}%
		};
\end{tikzpicture}
}

% vim: set ft=tex:
