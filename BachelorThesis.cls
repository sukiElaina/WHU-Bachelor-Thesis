\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BachelorThesis}[2019/11/11 v0.1 Book Template for Self Use]

\LoadClass{ctexart}

%=================设置章节标题格式==================
\ctexset{
	section={
		%format用于设置章节标题全局格式，作用域为标题和编号
		%字号为小三，字体为黑体，左对齐
		%+号表示在原有格式下附加格式命令
		format = \zihao{-2} \heiti \centering,
		%name用于设置章节编号前后的词语
		%前、后词语用英文状态下,分开
		%如果没有前或后词语可以不填
		name = {,},
		%number用于设置章节编号数字输出格式
		%输出section编号为中文
		%beforeskip用于设置章节标题前的垂直间距
		%ex为当前字号下字母x的高度
		%基础高度为1.0ex，可以伸展到1.2ex，也可以收缩到0.8ex
		beforeskip = 1.0ex plus 0.2ex minus .2ex,
		%afterskip用于设置章节标题后的垂直间距
		afterskip = 1.0ex plus 0.2ex minus .2ex,
		%aftername用于控制编号和标题之间的格式
		%\hspace用于增加水平间距
		aftername = \hspace{18pt}
	},
	subsection={
		format = \zihao{4} \heiti,
		%仅输出subsection编号且为中文
		%number = \chinese{subsection},
		name = {,},
		beforeskip = 1.0ex plus 0.2ex minus .2ex,
		afterskip = 1.0ex plus 0.2ex minus .2ex,
		aftername = \hspace{12pt}
	},
	subsubsection={
		%设置对齐方式为居中对齐
		format = \zihao{-4} \heiti,
		%仅输出subsubsection编号，格式为阿拉伯数字，打字机字体
		%number = \ttfamily\arabic{subsubsection},
		name = {,},
		beforeskip = 1.0ex plus 0.2ex minus .2ex,
		afterskip = 1.0ex plus 0.2ex minus .2ex,
		aftername = \hspace{12pt}
	}
}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage[a4paper, top=2.5cm, bottom=2.5cm, left=3cm, right=3cm]{geometry}
\RequirePackage{expl3 , xparse , l3keys2e}
\RequirePackage{xcolor}
\RequirePackage{datetime}
\RequirePackage{zhnumber}
\RequirePackage{fancyhdr}
\RequirePackage{indentfirst}
\RequirePackage{zhlipsum}
\RequirePackage{lipsum}
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage{booktabs}
\RequirePackage{fontspec}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{pifont}
\RequirePackage[perpage,symbol*]{footmisc}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=black,
}

% 自定义脚注
\renewcommand{\footnotelayout}{\quad  \songti \zihao{5}} % 设置脚注字体为小号
\setlength{\footnotesep}{1.5em} % 设置脚注之间的间距

\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}

% 自定义图表公式编号
\numberwithin{table}{section}%表格按章节编号
\numberwithin{figure}{section}%图片按章节编号
\numberwithin{equation}{section}%公式按章节编号

\captionsetup[table]{labelformat=simple, labelsep=space, font={bf,small},labelfont={bf,small},textfont={bf,small}, name={\songti \bf 表}, format=plain,skip=2pt}
\captionsetup[figure]{labelformat=simple, labelsep=space, font={bf,small},labelfont={bf,small},textfont={bf,small}, name={\songti \bf 图}, format=plain}
% \renewcommand{\tablename}{\songti \bf 表}
% \renewcommand{\thefigure}{{\bfseries \arabic{section}.\arabic{figure}}}
% \renewcommand{\figurename}{\songti \bf 图}
\renewcommand{\arraystretch}{1.5} % 表格行间距

% 自定义引用格式
\newcommand{\fref}[1]{（如图\ref{#1}所示）}
\newcommand{\tref}[1]{（如表\ref{#1}所示 ）}
\renewcommand{\eqref}[1]{见公式（\ref{#1}）所示}



% 自定义目录
\renewcommand{\contentsname}{\heiti \zihao{-2} 目\quad 录} % 更改目录名称
\titlecontents{section}[2em]{\bf \zihao{-4}}{\contentslabel{1.5em}}{\hspace*{-1.5em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
\titlecontents{subsection}[4em]{\zihao{-4}}{\contentslabel{2em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
\titlecontents{subsubsection}[6em]{\zihao{-4}}{\contentslabel{3em}}{\hspace*{-2em}}{~\titlerule*[0.6pc]{$.$}~\contentspage}
% 设置1.5倍行距
\linespread{1.5}

\hbadness=10000
\ExplSyntaxOn
\newcommand{\setup}[1]{\keys_set:nn {module}{#1}}

\tl_new:N \l_BT_title_tl
\tl_new:N \l_BT_author_tl
\tl_new:N \l_BT_studentnumber_tl
\tl_new:N \l_BT_major_tl
\tl_new:N \l_BT_college_tl
\tl_new:N \l_BT_supervisor_tl
% Define the \BTsetup command to process the key-value pairs
\NewDocumentCommand{\BTsetup}{m}{\keys_set:nn {BTsetup} {#1}}
\keys_define:nn {BTsetup}
{
    info .meta:nn = {BTsetup / info} {#1},
}
\keys_define:nn {BTsetup / info}
{
    title .tl_set:N = \l_BT_title_tl,
    author .tl_set:N = \l_BT_author_tl,
    studentnumber .tl_set:N = \l_BT_studentnumber_tl,
    major .tl_set:N = \l_BT_major_tl,
    college .tl_set:N = \l_BT_college_tl,
    supervisor .tl_set:N = \l_BT_supervisor_tl,
}


% 自定义标题命令
\newcommand{\custommaketitle}{
    \thispagestyle{empty}
    
    \begin{figure}[h] % 'h' 可以让图形出现在这里
        \centering
        \includegraphics[width=0.4\textwidth]{Figure/武大校徽.jpg} % 调整宽度
        \vspace{0cm} % 可以根据需要调整上方的垂直间距
    \end{figure}
    \begin{center}
        \zihao{2} \songti \bf 本科毕业论文（设计）
        \vspace{2.5cm}
    \end{center}

    \begin{center}
        \zihao{1} \kaishu
        { \l_BT_title_tl} \\[3em] % 论文标题

        \zihao{4} \songti
        {\makebox[2.5cm][s]{姓名}：\makebox[5cm][c]{\l_BT_author_tl}} \\[1em] % 姓名
        {\makebox[2.5cm][s]{学号}：\makebox[5cm][c]{\l_BT_studentnumber_tl}} \\[1em] % 学号
        {\makebox[2.5cm][s]{专业}：\makebox[5cm][c]{\l_BT_major_tl}} \\[1em] % 专业
        {\makebox[2.5cm][s]{学院}：\makebox[5cm][c]{ \l_BT_college_tl}} \\[1em] % 学院
        {\makebox[2.5cm][s]{指导老师}：\makebox[5cm][c]{ \l_BT_supervisor_tl}} \\[1em] % 指导教师
    \end{center}

    \vspace{3cm} % 额外的垂直间距

    \begin{center}
        \zihao{4} \songti
        \zhdigits{\the\year} 年 \zhnumber{\the\month} 月
    \end{center}

    \newpage
    \input{Pages/Front}
    
    \input{Pages/Abstract}
}


% 覆盖原有的 \maketitle 命令
\renewcommand{\maketitle}{\custommaketitle}

% 自定义页眉高度
\setlength{\headheight}{13pt}

% 自定义参考文献标题
\renewcommand{\refname}{\heiti \bf \zihao{-2} 参考文献}

\ExplSyntaxOff
% 使用 \AtBeginDocument 钩子在文档开始时执行代码



\endinput