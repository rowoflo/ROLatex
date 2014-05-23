% notebook.cls
% Custom LaTeX notebook class.
%
% AUTHOR:
%    Rowland O'Flaherty (rowlandoflaherty.com)
%
% VERSION:
%   1.0 30-MAR-2014
%
% The MIT License (MIT)
% Copyright (c) [2014] [Rowland O'Flaherty]
%----------------------------------------------------------------

\ProvidesClass{notebook}[2014/03/30 1.0 Custom notebook class.]
\newif\ifwe@use@hyperref\we@use@hyperreffalse
\DeclareOption{hyperref}{\we@use@hyperreftrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\LoadClass[oneside,oneside]{scrbook} % 'openany' here removes the gap page between days, erase it to restore this gap; 'oneside' can also be added to remove the shift that odd pages have to the right for easier reading
\RequirePackage{makeidx} \makeindex
\RequirePackage{titlesec}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % Command to make the lines in the title page
\setlength\parindent{0pt} % Removes all indentation from paragraphs
\setlength{\parskip}{10pt plus 1pt minus 1pt} % Set space between paragraphs

\addtolength{\topmargin}{-0.25in}
\addtolength{\textheight}{1.25in}

\newcommand{\notebooktitle}[2]{
\title{
\begin{center}
\HRule \\[0.4cm]
{\Huge \bfseries #1 \\[0.5cm] \Large #2}\\[0.4cm] % Degree
\HRule \\[1.5cm]
\end{center}
}
}

\newcommand{\notebookauthor}[3]{
\author{\Huge #1 \\ \\ \LARGE #2 \\ \\ \LARGE #3 \\[2cm]}
}

\def\newsubtopic#1{%
  \@ifnextchar [{\opt@arg@newsubtopic{#1}}%
    {\nopt@arg@newsubtopic{#1}}%]
}
\def\nopt@arg@newsubtopic#1#2{%
  \@ifundefined{long@exp@#1}{%
    \@namedef{long@exp@#1}{#2}%
    \@namedef{short@exp@#1}{#2}%
    }{%
    \ClassError
      {notebook}
      {subtopic abbreviation yet defined}
      {The abbreviation for an subtopic that you wanted to define
      with this command has already been defined.}%
    }
}
\def\opt@arg@newsubtopic#1[#2]#3{%
  \@ifundefined{long@exp@#1}{%
    \@namedef{long@exp@#1}{#3}%
    \@namedef{short@exp@#1}{#2}%
  }{%
    \ClassError
      {notebook}
      {subtopic abbreviation yet defined}
      {The abbreviation for an subtopic that you wanted to define
      with this command has already been defined.}%
  }
}
\def\newsubsubtopic#1{%
  \@ifnextchar [{\opt@arg@newsubsubtopic{#1}}%]
    {\nopt@arg@newsubsubtopic{#1}}%
}%
\def\nopt@arg@newsubsubtopic#1#2{%
  \@ifundefined{long@sstopic@#1}{%
    \@namedef{long@sstopic@#1}{#2}%
    \@namedef{short@sstopic@#1}{#2}%
    }{%
    \ClassError
      {notebook}
      {subtopic abbreviation yet defined}
      {The abbreviation for an subtopic that you wanted to define
      with this command has already been defined.}%
    }%
}%
\def\opt@arg@newsubsubtopic#1[#2]#3{%
  \@ifundefined{long@sstopic@#1}{%
    \@namedef{long@sstopic@#1}{#3}%
    \@namedef{short@sstopic@#1}{#2}%
  }{%
    \ClassError
      {notebook}
      {subtopic abbreviation yet defined}
      {The abbreviation for an subtopic that you wanted to define
      with this command has already been defined.}%
  }%
}%
\def\@tmpA#1{%
\def\FK@@sp@def##1##2{%
  \futurelet\FK@tempa\FK@@sp@d##2\@nil\@nil#1\@nil\relax##1}%
\def\FK@@sp@d{%
  \ifx\FK@tempa\@sptoken
    \expandafter\FK@@sp@b
  \else
    \expandafter\FK@@sp@b\expandafter#1%
  \fi}%
\def\FK@@sp@b#1##1 \@nil{\FK@@sp@c##1}%
  }%
\def\FK@@sp@c#1\@nil#2\relax#3{\FK@toks@{#1}\edef#3{\the\FK@toks@}}%
\newtoks\FK@toks@%
\@tmpA{ }%
\newcounter{fk@commasep@argnumber}%
\def\fk@getcommasep@list#1#2#3#4#5#6{%
  \setcounter{fk@commasep@argnumber}{0}%
  #1
  \def\fk@commasep@beforebranch{#2}%
  \def\fk@commasep@firstelement{#3}%
  \def\fk@commasep@furtherelements{#4}%
  \def\fk@commasep@afterlastelement{#5\empty}%
  \def\fk@commasep@aftereachelement{#6}%
  \fk@@getcommasep@list
}
\def\fk@@getcommasep@list#1,{%
  \stepcounter{fk@commasep@argnumber}%
  \fk@commasep@beforebranch%
  \ifx\relax#1%
    \fk@commasep@afterlastelement%
  \else%
    \FK@@sp@def\fk@commasep@arg{#1}%
    \ifnum\c@fk@commasep@argnumber=1%
      \fk@commasep@firstelement%
    \else%
      \fk@commasep@furtherelements%
    \fi%
    \fk@commasep@aftereachelement%
    \expandafter\fk@@getcommasep@list%
  \fi%
}
\newcounter{fk@atdashsep@argnumber}%
\def\fk@getatdashsep@list#1#2#3#4#5#6{%
  \setcounter{fk@atdashsep@argnumber}{0}%
  #1
  \def\fk@atdashsep@beforebranch{#2}%
  \def\fk@atdashsep@firstelement{#3}%
  \def\fk@atdashsep@furtherelements{#4}%
  \def\fk@atdashsep@afterlastelement{#5\empty}%
  \def\fk@atdashsep@aftereachelement{#6}%
  \fk@@getatdashsep@list
}
\def\fk@@getatdashsep@list#1§{%
  \stepcounter{fk@atdashsep@argnumber}%
  \fk@atdashsep@beforebranch%
  \ifx\relax#1%
    \fk@atdashsep@afterlastelement%
  \else%
    \FK@@sp@def\fk@atdashsep@arg{#1}%
    \ifnum\c@fk@atdashsep@argnumber=1%
      \fk@atdashsep@firstelement%
    \else%
      \fk@atdashsep@furtherelements%
    \fi%
    \fk@atdashsep@aftereachelement%
    \expandafter\fk@@getatdashsep@list%
  \fi%
}
\newif\ifmore@thanone@item%
\def\fk@parse@optarg{%
  \fk@getcommasep@list{%
    \more@thanone@itemfalse%
  }{%
  }{%
    \@onelevel@sanitize{\fk@commasep@arg}%
    \protected@edef\fk@current@tocentry{\fk@commasep@arg}%
  }{%
    \more@thanone@itemtrue%
    \protected@edef\fk@currentarg{\fk@commasep@arg}%
    \@onelevel@sanitize{\fk@currentarg}%
    \protected@edef\fk@currentarg@withspace{\fk@currentarg\space}%
    \expandafter\fk@checkifabbrev@arg%
      \fk@currentarg@withspace&{long@\fk@explevel}%
    \ifabbrev@defined%
      \expandafter\protected@edef%
          \csname fk@current@\fk@explevel name\expandafter%
          \endcsname{%
            \csname short@\fk@explevel @\fk@currentarg\endcsname}%
      \fk@buildindexlist{%
        \csname short@\fk@explevel @\fk@currentarg\endcsname}%
    \else%
      \expandafter\protected@edef%
          \csname fk@current@\fk@explevel name\endcsname{%
            \fk@currentarg}%
      \expandafter\fk@buildindexlist{\fk@currentarg}
    \fi%
  }{%
    \protected@edef\fk@currentarg{\fk@current@tocentry}%
    \@onelevel@sanitize{\fk@currentarg}%
    \protected@edef\fk@currentarg@withspace{\fk@currentarg\space}%
    \expandafter\fk@checkifabbrev@arg%
      \fk@currentarg@withspace&{long@\fk@explevel}%
    \ifmore@thanone@item\else%
      \ifabbrev@defined%
        \fk@buildindexlist{%
          \csname short@\fk@explevel @\fk@currentarg\endcsname}%
      \else%
        \expandafter\fk@buildindexlist{\fk@currentarg}%
      \fi%
    \fi%
  }{%
  }%
}
\def\fk@exp@indexlist{}%
\def\fk@sstopic@indexlist{}%
\def\fk@buildindexlist#1{%
  \def\@tmpA{exp}
  \ifx\fk@explevel\@tmpA
    \protected@edef\fk@exp@indexlist{#1§\fk@exp@indexlist}
  \else
    \protected@edef\fk@sstopic@indexlist{#1§\fk@sstopic@indexlist}
  \fi
}
\def\fk@useindexlist{%
  \fk@getatdashsep@list{}{}{}{}{}{%
    \fk@@writeindex{\fk@atdashsep@arg}%
  }%
}%
\def\fk@@writeindex#1{%
  \def\@tmpA{exp}%
  \ifx\fk@explevel\@tmpA%
    \fk@writeindex{#1}%
  \else%
    \ifx\fk@parselevel\@tmpA% we are iterating over the current list
                            % of subtopics
      \protected@edef\fk@current@expname{#1}
      \def\fk@parselevel{sstopic}
      \expandafter\fk@useindexlist\fk@sstopic@indexlist\relax§%
      \def\fk@parselevel{exp}
    \else
      \fk@writeindex{\fk@current@expname!#1}%
    \fi
  \fi%
}%
\def\fk@openindex#1{\index{#1|(}}%)
\def\fk@closeindex#1{\index{#1|)}}%)
\def\muST@bE@emPTy{\message{Numquam videbor}}%
\newif\ifabbrev@defined%
\def\fk@checkifabbrev@arg #1 #2&#3{%
  \ifx\muST@bE@emPTy#2\muST@bE@emPTy%
    \protected@edef\@tmpA{#1\space}%
    \expandafter\fk@checkfirst\@tmpA{#3}%
  \else%
    \abbrev@definedfalse%
  \fi%
}%
\def\fk@checkfirst #1 #2{%
  \@ifundefined{#2@#1}{\abbrev@definedfalse}{\abbrev@definedtrue}%
}%
\def\fk@close@labindex{%
  \let\fk@writeindex\fk@closeindex%
  \@ifundefined{fk@explevel}{}{%
    \def\@tmpA{exp}%
    \ifx\fk@explevel\@tmpA%
      \def\fk@parselevel{exp}%
      \def\fk@explevel{sstopic}%
      \fk@@close@labindex%
      \def\fk@explevel{exp}%
      \fk@@close@labindex%
    \else%
      \fk@@close@labindex%
    \fi%
  }%
}%
\def\fk@@close@labindex{%
  \expandafter\fk@useindexlist\fk@exp@indexlist\relax§%
  \expandafter\def\csname fk@\fk@explevel @indexlist\endcsname{}%
}
\newcounter{topic}
\newcounter{subtopic}[topic]
\newcounter{subsubtopic}[subtopic]
\@addtoreset{footnote}{topic}
\@addtoreset{subsubsection}{subsubtopic}
\let\subtopicmark\@gobble
\let\subsubtopicmark\@gobble
\setcounter{tocdepth}{3}
\def\subtopic{%
  \def\fk@explevel{exp}
  \fk@close@labindex%
  \lower@sectionlevelfalse%
  \@ifstar{\@ssubtopic}{\@subtopic}%
}
\def\@subtopic{%
  \@ifnextchar [{\opt@arg@subtopic}{\nopt@arg@subtopic}%
}
\def\nopt@arg@subtopic#1{%
  \def\fk@currentarg{#1 }\@onelevel@sanitize{\fk@currentarg}%
  \expandafter\fk@checkifabbrev@arg\fk@currentarg&{long@exp}%
  \ifabbrev@defined%
    \fk@buildindexlist{\csname short@exp@#1\endcsname}%
    \@startsection{subtopic}{1}{\z@}%
         {-3.5ex \@plus -1ex \@minus -.2ex}%
         {2.3ex \@plus.2ex}%
         {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
         [\@nameuse{short@exp@#1}]{\@nameuse{long@exp@#1}}%
  \else%
    \expandafter\fk@buildindexlist{\fk@currentarg}
    \@startsection{subtopic}{1}{\z@}%
         {-3.5ex \@plus -1ex \@minus -.2ex}%
         {2.3ex \@plus.2ex}%
         {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
         {#1}%
  \fi%
}%
\def\opt@arg@subtopic[#1]#2{%
  \fk@parse@optarg#1,\relax,%
  \ifabbrev@defined%
    \def\fk@currentarg{#2 }\@onelevel@sanitize{\fk@currentarg}%
    \expandafter\fk@checkifabbrev@arg\fk@currentarg&{long@exp}%
    \ifabbrev@defined%
          \expandafter\ifx%
               \csname short@exp@\fk@current@tocentry\expandafter%
               \endcsname\csname short@exp@#2\endcsname%
            \@startsection{subtopic}{1}{\z@}%
              {-3.5ex \@plus -1ex \@minus -.2ex}%
              {2.3ex \@plus.2ex}%
              {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
              [\@nameuse{short@exp@\fk@current@tocentry}]%
              {\@nameuse{long@exp@#2}}%
          \else%
            \ClassError
             {notebook}
             {index entry and subtopic title don't match}
             {%
               You have used \protect\subtopic\space with an
               optional argument, and used abbreviations
               \MessageBreak both in the optional argument
               (the first item in square brackets, for the index
               and toc\MessageBreak entries) and the mandatory
               argument (in curly braces, for the subtopic title
               in the text). This is only possible if both would
               yield the same index/toc\MessageBreak
               entries. However, you requested the index
               entry\MessageBreak
               \@nameuse{short@exp@\fk@current@tocentry}
               \MessageBreak
               but the title corresponds to index entry\MessageBreak
               \@nameuse{short@exp@#2}}%
          \fi%
    \else%
      \ClassWarning{notebook}
        {Using a pre-defined short form for this
          \protect\subtopic.\MessageBreak
          Please check that the abbreviation\MessageBreak
          \csname short@exp@#1\endcsname\MessageBreak corresponds
          properly to the long form \MessageBreak #2\MessageBreak}
      \@startsection{subtopic}{1}{\z@}%
        {-3.5ex \@plus -1ex \@minus -.2ex}%
        {2.3ex \@plus.2ex}%
        {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
        [\@nameuse{short@exp@\fk@current@tocentry}]{#2}%
    \fi%
  \else%
    \def\fk@currentarg{#2 }\@onelevel@sanitize{\fk@currentarg}%
    \expandafter\fk@checkifabbrev@arg\fk@currentarg&{long@exp}%
    \ifabbrev@defined%
    \ClassError {notebook} {Manual short form conflicts with
      abbreviated title} {You have used an optional argument to
      \protect\subtopic\space (the first element in
      square\MessageBreak brackets) that TeX does not
      recognize as an abbreviation. However, in the
      \MessageBreak subtopic title (in the curly braces),
      you have used an abbreviation defined\MessageBreak with
      \protect\newsubtopic. This doesn't make sense, so
      I don't accept it.}%
    \else%
      \@startsection{subtopic}{1}{\z@}%
         {-3.5ex \@plus -1ex \@minus -.2ex}%
         {2.3ex \@plus.2ex}%
         {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
         [\fk@current@tocentry]{#2}%
    \fi%
  \fi%
}%
\def\@ssubtopic#1{%
  \ClassError{notebook}{%
    Starred form of \protect\subtopic\space not defined
  }{%
    There is no starred form of \protect\subtopic\space defined
  in this version of notebook.cls. Please use the unstarred form, or
  check for a new version.
  }
}
\def\subsubtopic{%
  \def\fk@explevel{sstopic}%
  \def\fk@parselevel{exp}%
  \fk@close@labindex%
  \lower@sectionlevelfalse%
  \@ifstar{\@ssubsubtopic}{\@subsubtopic}%
}%
\def\@subsubtopic{%
  \@ifnextchar [{\opt@arg@subsubtopic}{\nopt@arg@subsubtopic}%]
}%
\def\nopt@arg@subsubtopic#1{%
  \def\fk@parselevel{exp}
  \def\fk@currentarg{#1 }\@onelevel@sanitize{\fk@currentarg}%
  \expandafter\fk@checkifabbrev@arg\fk@currentarg&{long@sstopic}%
  \ifabbrev@defined%
    \fk@buildindexlist{\csname short@sstopic@#1\endcsname}%
    \@startsection{subsubtopic}{2}{\z@}%
         {-3.5ex \@plus -1ex \@minus -.2ex}%
         {2.3ex \@plus.2ex}%
         {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
         [\@nameuse{short@sstopic@#1}]{\@nameuse{long@sstopic@#1}}%
  \else
    \expandafter\fk@buildindexlist{#1}
    \@startsection{subsubtopic}{2}{\z@}%
         {-3.5ex \@plus -1ex \@minus -.2ex}%
         {2.3ex \@plus.2ex}%
         {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
         {#1}%
  \fi%
}%
\def\opt@arg@subsubtopic[#1]#2{%
  \def\fk@parselevel{sstopic}
  \fk@parse@optarg#1,\relax,%
  \def\fk@parselevel{exp}%
  \ifabbrev@defined%
    \def\fk@currentarg{#2 }\@onelevel@sanitize{\fk@currentarg}%
    \expandafter\fk@checkifabbrev@arg\fk@currentarg&{long@exp}%
    \ifabbrev@defined%
      \expandafter\ifx\csname short@sstopic@\fk@current@tocentry%
          \expandafter\endcsname\csname short@sstopic@#2\endcsname%
        \@startsection{subsubtopic}{2}{\z@}%
           {-3.5ex \@plus -1ex \@minus -.2ex}%
           {2.3ex \@plus.2ex}%
           {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
           [\@nameuse{short@sstopic@\fk@current@tocentry}]%
           {\@nameuse{long@sstopic@#2}}%
      \else%
        \ClassError
          {notebook}
          {index entry and subsubtopic title don't match}
          {%
            You have used \protect\subsubtopic\space with an
            optional argument, and used abbreviations\MessageBreak
            both in the optional argument (in square brackets, for
            the index and toc\MessageBreak entries) and the
            mandatory argument (in curly braces, for the subtopic
            title in the text). This is only possible if both would
            yield the same index/toc\MessageBreak entries. However,
            you requested the index entry\MessageBreak
            \@nameuse{short@sstopic@#1}\MessageBreak
            but the title corresponds to index entry\MessageBreak
            \@nameuse{short@sstopic@#2}}%
      \fi%
    \else%
       \ClassWarning{notebook}
         {Using a pre-defined short form for this
          \protect\subsubtopic.\MessageBreak
          Please check that the abbreviation\MessageBreak \csname
          short@sstopic@#1\endcsname\MessageBreak corresponds
          properly to the long form \MessageBreak #2\MessageBreak}%
       \@startsection{subsubtopic}{2}{\z@}%
         {-3.5ex \@plus -1ex \@minus -.2ex}%
         {2.3ex \@plus.2ex}%
         {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
         [\@nameuse{short@sstopic@\fk@current@tocentry}]{#2}%
    \fi%
  \else%
    \def\fk@currentarg{#2 }\@onelevel@sanitize{\fk@currentarg}%
    \expandafter\fk@checkifabbrev@arg\fk@currentarg&{long@sstopic}%
    \ifabbrev@defined%
      \ClassError
         {notebook}
         {Manual short form conflicts with abbreviated title}
         {You have used an optional argument to
          \protect\subsubtopic\space (the short form, in
          \MessageBreak square brackets) that TeX does not
          recognize as an abbreviation. However, \MessageBreak
          in the subsubtopic title (in the curly braces),
          you have used an abbreviation\MessageBreak defined
          with \protect\newsubsubtopic. This doesn't make
          sense, so I don't accept it.}%
    \else%
      \@startsection{subsubtopic}{2}{\z@}%
         {-3.5ex \@plus -1ex \@minus -.2ex}%
         {2.3ex \@plus.2ex}%
         {\raggedsection\normalfont\sectfont\nobreak\size@section\nobreak}%
         [\fk@current@tocentry]{#2}%
    \fi%
  \fi%
}%
\def\@ssubsubtopic#1{%
  \ClassError{notebook}{%
    Starred form of \protect\subsubtopic\space not defined
  }{%
    There is no starred form of \protect\subsubtopic\space defined
  in this version of notebook.cls. Please use the unstarred form, or
  check for a new version.
  }%
}%
\newcommand*{\topic}{%
  \def\fk@explevel{exp}%
  \fk@close@labindex%
  \let\fk@explevel\@undefined%
  \refstepcounter{topic}%
  \addchap%
}%
\let\fk@part\part
\renewcommand*{\part}{%
  \def\fk@explevel{exp}%
  \fk@close@labindex%
  \let\fk@explevel\@undefined%
  \fk@part%
}
\newif\iflower@sectionlevel
\let\fk@oldsubsubsection\subsubsection%
\renewcommand{\subsubsection}{%
  \lower@sectionleveltrue%
  \fk@oldsubsubsection%
}
\renewcommand*\thesubtopic{\@arabic\c@subtopic}%
\renewcommand*\thesubsubtopic{%
  \thesubtopic.\@arabic\c@subsubtopic}%
\renewcommand*\thesubsubsection{%
  \thesubsubtopic.\@arabic\c@subsection}%
\renewcommand*\theparagraph{%
  \thesubsubsection.\@arabic\c@paragraph}%
\renewcommand*\thesubparagraph{%
  \theparagraph.\@arabic\c@subparagraph}%
\@addtoreset{figure}{topic}%
\@addtoreset{table}{topic}%
\renewcommand*\thefigure{%
  \@arabic\c@figure}%
\renewcommand*\thetable{%
  \@arabic\c@table}%
\let\l@topic\l@chapter%
\let\l@subtopic\l@section%
\let\l@subsubtopic\l@subsection%
\def\define@addcontentsline{%
  \let\fk@old@addcontentsline\addcontentsline%
  \def\addcontentsline##1##2##3{%
    \fk@old@addcontentsline{##1}{##2}{##3}%
    \def\@tmpA{toc}%
    \def\@tmpB{##1}%
    \ifx\@tmpA\@tmpB%
      \@ifundefined{fk@explevel}{}{%
        \iflower@sectionlevel\else%
          \let\fk@writeindex\fk@openindex%
          \expandafter\fk@useindexlist\fk@exp@indexlist\relax§%
        \fi%
      }%
    \fi%
  }%
}%
\ifwe@use@hyperref\else%
  \define@addcontentsline%
\fi%
\newif\iflast@labindex@closed\last@labindex@closedfalse%
\let\fk@old@appendix\appendix%
\def\appendix{%
  \iflast@labindex@closed\else%
    \def\fk@explevel{exp}%
    \fk@close@labindex%
    \last@labindex@closedtrue%
    \let\fk@explevel\@undefined%
    \setcounter{footnote}{0}%
  \fi%
  \fk@old@appendix%
}%
\let\fk@old@backmatter\backmatter%
\def\backmatter{%
  \iflast@labindex@closed\else%
    \def\fk@explevel{exp}%
    \fk@close@labindex%
    \last@labindex@closedtrue%
    \let\fk@explevel\@undefined
    \setcounter{footnote}{0}%
  \fi%
  \fk@old@backmatter%
}
\AtEndDocument{%
  \iflast@labindex@closed\else%
    \def\fk@explevel{exp}%
    \fk@close@labindex%
  \fi%
}
\ifwe@use@hyperref
  \AfterPackage{hyperref}{%
    \define@addcontentsline%
    \providecommand*{\toclevel@topic}{0}%
    \providecommand*{\toclevel@subtopic}{1}%
    \providecommand*{\toclevel@subsubtopic}{2}%
    \newcommand*\theHtopic{%
      \arabic{topic}}%
    \newcommand*\theHsubtopic{%
      \theHtopic.\arabic{subtopic}}%
    \newcommand*\theHsubsubtopic{%
      \theHsubtopic.\arabic{subsubtopic}}%
    \renewcommand*\theHsubsubsection{%
      \theHsubsubtopic.\arabic{subsubsection}}%
    \renewcommand*\theHfigure{%
      \theHtopic.\arabic{figure}}%
    \renewcommand*\theHtable{%
      \theHtopic.\arabic{table}}
  }%
  \AtBeginDocument{%
    \@ifpackageloaded{hyperref}{}{%
      \ClassError{notebook}{%
        hyperref option given, but package not loaded}{%
        You have specified the class option hyperref, but
        not loaded the package until \protect\begin{document}.
      }
    }
  }
\else
  \AtBeginDocument{%
    \@ifpackageloaded{hyperref}{%
      \ClassError{notebook}{%
        hyperref option not given, but package loaded}{%
        You have not specified the class option hyperref,
        but loaded the package. Don't do that again!
      }%
    }{}%
  }%
\fi%
\endinput
%%
%% End of file `notebook.cls'.
