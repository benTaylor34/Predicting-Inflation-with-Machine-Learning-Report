%% Loughborough University Thesis Class
%% based on report.cls
%% Matthew Tylee Atkinson, John Whitley, Mark Withall and Iain Phillips
%%
%%	FIXME
%%		* remove LU logos and stuff; no longer needed due to new front form
%%		  being a self-contained PDF - NOT PART OF THE THESIS PDF.
%%		* check README blurb at the top is up-to-date in light of new form.
%%		* remove references to logos below (>1!)
%%		* check titlepage-related TODO below
%%		* update \date error text below
%%
%% Installation:
%%		Extract the luthesis ZIP file into ~/texmf/tex/latex/ on *nix
%%			or ~/Library/texmf/tex/latex/ on Mac OS X running MacTeX.
%%		If you want to use the logos elsewhere, you can put them in
%%			another directory, such as ~/texmf/tex/latex/logos/. As
%%			long as they're under ~/texmf/tex/latex/, they should be
%%			automagically found by the *tex compiler.
%%
%% Usage:
%%	* Pass the ``mono'' option to this document class for the hardcopy
%%		  version of your thesis.  It will make all luthesis-included logos
%%		  and forms greyscale and will tell all colours (such as those used
%%		  by hyperref) to be black.  Please note that this won't affect any
%%		  figures you include yourself (but this is probably what you want).
%%      * Don't specify a \date{} -- use the following instead.
%%          + \thesisDateDay{35th}
%%          + \thesisDateMonth{12} -- it will be turned into the name.
%%          + \thesisDateYear{2042}
%%        REASON: Different formats of the date are needed in places.
%%      * For specifying the date of printing for the form, use the
%%        field on the form [commands here are no longer required].
%%        REASON: Print date may differ from content-finalised date.
%%      * The \frontmatter, \mainmatter and \backmatter commands have
%%        been added from book.cls with the rough behaviour of those
%%        from memoir -- i.e. in \frontmatter, chapters are not numbered
%%        but they do appear in the TOC.
%%		  REASON: Use \frontmatter after \maketitle; \mainmatter after the
%%				  ToC, LoF and LoT and \backmatter after the bibliography,
%%				  for the appendices (see next note).
%%      * Appendices should appear *after* the References section (i.e.
%%        they should be the very last thing; slicing all pages from the
%%        the start of the first appendix onwards off the end of your
%%        thesis should not change it logically at all).
%%		  NOTE: Use \appendix before you start your first appendix.
%%
%% Highly-recommended Sister Packages:
%%      * booktabs -- produces tables with the proper rules; makes your
%%        document much more professional-looking; gives advice on table
%%        layout.
%%		* hyperref -- make links in your document for easy navigation.
%%		  NOTE: We pass some more subdued default colours and settings to
%%				hyperref to make reading easier on the eyes.
%%      * glossaries -- useful for both glossaries and acronyms.
%%      * gcite -- formats citations in a much more readable way.  This
%%        ensures that your thesis should be easier to read.
%%
%% Changes from report.cls:
%%      * Added a mono option to remove coloured text and use a black
%%        version of the logo (also removes hyper colours).  NB: Use this
%%		  for the hardcopy version of your thesis!
%%		* 1in margin except on the left, where it's 1.5in.
%%      * A title page to comply with Loughborough content requirements.
%%		  (NB: vertical centering required padding as detailed in
%%		  http://en.wikibooks.org/wiki/LaTeX/Page_Layout [16/04/2008].)
%%      * A4 paper, 12pt, oneside, 1+1/2 spacing by default. (The Rules.)
%%      * The babel package is loaded with the option ``british'' so
%%        that localisation of things like dates (from biblatex, for
%%        example) is transparently done.
%%		* Section numbering and appearance in ToC now goes down to
%%		  sub-sub-section level.  It is not necessarily recommended you take
%%		  advantage of this -- in fact, try to avoid it!
%%		* Section headings will not be hyphenated (this was considered
%%		  ugly by consensus of the research group of the developers); instead
%%		  they will be \raggedright.  Note that they can still be hyphenated
%%		  in the ToC and that all other text still will be.
%%
%% Options:
%%  mono: obvious
%%  iwp: do page numbering according to sensible rules (use this
%%       if your supervisor is Iain Phillips, or if you're generally a
%%       sensible person).
%%  first,second,third, up to sixth: for reports at the end of each year
%%  transfer: for transfer reports
%%  msc for msc dissertations

%%  online: normally theses are formatted with some inner margin to allow for
%           binding.  If your thesis is going to be an online pdf then this
%           provides for an alternative where the text is centred on the page
%           with no binding margin

\NeedsTeXFormat{LaTeX2e}[1996/06/01]
\ProvidesClass{luthesis}[2023/04/25]

%%%
%%% Class Options
%%%
%% Just because the class supports up to eleventh year reports
%% doesn't mean the University will accept one ...

\newif\if@lt@msc
\newif\if@lt@trstuff
\newif\if@lt@fyp
\newif\if@lt@eoy
\newif\if@lt@iwp
\newif\if@lt@online
\@lt@mscfalse
\@lt@trstufffalse
\@lt@fypfalse
\@lt@eoyfalse
\@lt@iwpfalse
\@lt@onlinefalse

\global\let\lt@year\@empty
\DeclareOption{first}{\def\lt@year{A First Year}\@lt@eoytrue}
\DeclareOption{second}{\def\lt@year{A Second Year}\@lt@eoytrue}
\DeclareOption{third}{\def\lt@year{A Third Year}\@lt@eoytrue}
\DeclareOption{fourth}{\def\lt@year{A Fourth Year}\@lt@eoytrue}
\DeclareOption{fifth}{\def\lt@year{A Fifth Year}\@lt@eoytrue}
\DeclareOption{sixth}{\def\lt@year{A Sixth Year}\@lt@eoytrue}
\DeclareOption{seventh}{\def\lt@year{A Seventh Year}\@lt@eoytrue}
\DeclareOption{eighth}{\def\lt@year{An Eighth Year}\@lt@eoytrue}
\DeclareOption{ninth}{\def\lt@year{A Ninth Year}\@lt@eoytrue}
\DeclareOption{tenth}{\def\lt@year{A Tenth Year}\@lt@eoytrue}
\DeclareOption{eleventh}{\def\lt@year{An Eleventh Year}\@lt@eoytrue}
\DeclareOption{transfer}{\def\lt@year{A Transfer}\@lt@eoytrue}
\DeclareOption{6month}{\def\lt@year{A six month Review}\@lt@eoytrue}
\DeclareOption{online}{\@lt@onlinetrue}

\DeclareOption{msc}{\@lt@msctrue}
\DeclareOption{iwp}{\@lt@iwptrue}

\DeclareOption{mono}{\PassOptionsToPackage{monochrome}{color}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\global\let\lt@prg\@empty
\global\let\lt@id\@empty
\global\let\lt@in\@empty
\global\let\lt@super\@empty

\DeclareOption{fyp}{\@lt@fyptrue
  \def\lt@fypdegree{B.Sc.}
  \def\lt@in{Computer Science}}
\def\lt@fyptext{A Project Report}
\def\setfyptext{\def\lt@fyptext}
\def\setmodcode{\def\lt@prg}

\def\programme#1{\def\lt@in{in\par #1}}
\def\programmeshort{\def\lt@prg}
\def\idnumber{\def\lt@id}
\def\supervisor{\def\lt@super}

\ProcessOptions\relax
\LoadClass[a4paper,12pt]{report}

\PassOptionsToPackage{usenames,dvipsnames}{color}

\RequirePackage{color}
\RequirePackage{graphicx,pdfpages}  % to avoid conflicts with 'color'
\RequirePackage{sectsty}  % 'sectsty' for raggedright headings
\RequirePackage[british]{babel}
\RequirePackage[onehalfspacing]{setspace}

\if@lt@online
\RequirePackage[margin=1in,left=1.25in,right=1.25in]{geometry}
\else
\RequirePackage[margin=1in,inner=1.5in]{geometry}
\fi

\allsectionsfont{\raggedright}

\RequirePackage{ifpdf}

\if@lt@msc
  \@lt@trstufftrue
\fi
\if@lt@fyp
  \@lt@trstufftrue
\fi

% If the user uses the hyperref package, we pass some options to it...
% NB: to specify NO coloured links, pass the ``mono'' option to the class.
%	pdfpagelabels -- allow the PDF viewer to see \frontmatter numbers.
%   plainpages -- ensure we don't confuse linking with \frontmatter sections.
%   pdfborder -- ensure Adobe Reader doesn't draw links, even when the author
%           doesn't want them (i.e. doesn't pass ``colorlinks'').
%           Without this customisation, the reader will always draw boxes
%           around links, which is probably not what the author wanted.
%   pdfstartview -- make it easier to read on startup.
%   blue links -- these are easier on the eyes for most people and look
%           far less like errors.
%   breaklinks -- allows long links like big URLs to break accross lines.
%   linktocpage -- make only the page numbers in the ToC links; again
%           this is about being easier on the reader's eyes.
\definecolor{darkblue}{rgb}{0, 0, 0.5}
\definecolor{darkgreen}{rgb}{0, 0.5, 0}
\PassOptionsToPackage{pdfpagelabels,plainpages=false,bookmarksopen,%
  bookmarksopenlevel=0,pdfborder={0 0 0},linkcolor=darkblue,%
  citecolor=darkgreen,breaklinks=true,colorlinks,linktocpage,pdfstartview=FitH}{hyperref}

%%%
%%% Overrides
%%%
\renewcommand{\date}{%
    \ClassError{luthesis}{The \protect\date\space command should not be used}%
    {Alternative commands are provided for setting the date of the thesis and\MessageBreak
    the print date.  Please use them instead of \protect\date.}%
}
\AtBeginDocument{%
    \renewcommand{\bibname}{References}% for some reason this won't take effect unless done here.
}
%\setcounter{secnumdepth}{5}
%\setcounter{tocdepth}{5}


%%% titlepage text
\def\thesis@tptxt{{\Large A Doctoral Thesis\par}%
  \vskip 3em%
  {\large Submitted in partial fulfilment \par
    of the requirements for the award of\par}%
  \vskip 2em%
  {\Large Doctor of Philosophy\par%
    of\par%
    Loughborough University\par}%
  \vskip 5em}

\if@lt@msc
\def\thesis@tptxt{{\Large A Masters Dissertation}
  \vskip 3em%
  {\large Submitted in partial fulfilment \par
    of the requirements for the award of\par}%
  \vskip 2em%
  {\Large Master of Science\par%
    \lt@in\par%
    of\par%
    Loughborough University\par}%
  \vskip 3em
   Supervised by \lt@super\vskip 3em}
\fi

\if@lt@eoy
\def\thesis@tptxt{{\Large \lt@year\ Report\par}%
  \vskip 3em%
  \vskip 5em%
  {\Large 
    \par%
    Loughborough University\par}%
  \vskip 5em}
\fi

\if@lt@fyp
\def\thesis@tptxt{{\Large\lt@fyptext}
  \vskip 3em%
  {\large Submitted in partial fulfilment \par
    of the requirements for the award of\par}%
  \vskip 2em%
  {\Large\lt@fypdegree\par%
    \lt@in\par%
    of\par%
    Loughborough University\par}%
  \vskip 5em}
\fi

%%%
%%% New Commands
%%%
\newcommand{\thesisDateDay}[1]{\def\@thesisDateDay{#1}}
\newcommand{\thesisDateMonth}[1]{\def\@thesisDateMonth{#1}}
\newcommand{\thesisDateYear}[1]{\def\@thesisDateYear{#1}}
% David Kastrup gave the following solution for repeating things n times -- http://groups.google.com/group/comp.text.tex/browse_thread/thread/1c9c1f99025c6f2b/7e2bd0b71066aa17?lnk=gst&q=repeating+sequence&rnum=4#7e2bd0b71066aa17
\def\recur#1{\csname rn#1\recur}\long\def\rnm#1{\endcsname{#1}#1}
\long\def\rn#1{}\def\repeatcom#1{\csname rn\expandafter\recur
\romannumeral\number\number#1 000\endcsname\endcsname} 
%}



%%%
%%% \*matter Commands
%%%
\newif\if@frontmatter
\newcommand\frontmatter{%
    \cleardoublepage
    \@frontmattertrue}
	% setting pagenumbering to roman here would reset the counter

\newcommand\mainmatter{%
    \cleardoublepage
    \@frontmatterfalse
    % iwp style is to use arabic numbering from the start
    % (we're already in arabic mode from the start in iwp style)
    \pagestyle{headings}
	\if@lt@iwp
    \else
		% typographic convention is to use roman numerals for frontmatter
		% now we're hitting the mainmatter, we need to switch to arabic
		\pagenumbering{arabic}
	\fi}

\newcommand\backmatter{%
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
    \@frontmatterfalse}

%%%
%%% Templates
%%%
%\definecolor{lupurple}{cmyk}{0.55, 0.80, 0.00, 0.64}
%\definecolor{lupink}{cmyk}{0.00, 0.99, 0.49, 0.22}

\renewcommand{\maketitle}{%
    % Construct (textual) date variables...
    \def\@thesisDate{\@thesisDateDay\ \thesisMonthText{\@thesisDateMonth}\ \@thesisDateYear}%
	\if@lt@iwp
		% iwp style is to use arabic numbering from the start
		\pagenumbering{arabic}
	\else
		% typographic convention is to use roman numerals for frontmatter
		\pagenumbering{roman}
	\fi
	\pagestyle{empty}
        % top right stff for msc and ug programmes
        \if@lt@trstuff
        \hspace*{\fill}
        \ifx\lt@prg\@empty
        \else
        \fbox{\parbox{1in}{
          \lt@prg\par

          \lt@id}}
        \fi
        \fi
        \vspace*{\fill}%
        \begin{center}%
            {\LARGE \@title \par}%
            \vskip 3em%
            by
            \vskip 2em%
            {\Large
            \lineskip .75em%
            \begin{tabular}[t]{c}%
            \@author
            \end{tabular}\par}%
            \vskip 3em%
            \thesis@tptxt%
            {\large \@thesisDate \par}%
            \vskip 2em%
            {\small Copyright \@thesisDateYear\ \@author}%
        \end{center}\par%
        \vspace*{\fill}%
		\vspace{25pt}% ``dubious hack no.1''
        \clearpage
%	\pagestyle{headings}
}

%%%
%%% \frontmatter-aware Chapter Heads and TOC Entries
%%%
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
  \if@frontmatter\else\refstepcounter{chapter}\fi%
  \typeout{\@chapapp\space\thechapter.}%
  % luthesis: must behave differently if in frontmatter...
  \if@frontmatter%
    % Are we using hyperref?
    \ifthenelse{\isundefined{\texorpdfstring}}{%
      % No -- do nowt.
    }{%
      % Yes -- add a phantom section first...
      \phantomsection
    }%
    % Either way, add the contents line...
    \addcontentsline{toc}{chapter}{#1}%
  \else
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{\thechapter}#1}%
  \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
\fi
\chaptermark{#1}%
\addtocontents{lof}{\protect\addvspace{10\p@}}%
\addtocontents{lot}{\protect\addvspace{10\p@}}%
\if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \if@frontmatter\@makeschapterhead{#2}\else\@makechapterhead{#2}\fi%
      \@afterheading
    \fi}

%%%
%%% Utility Macros
%%%
\newcommand{\thesisMonthText}[1]{%
    \ifcase#1%
    \or{January}%
    \or{February}%
    \or{March}%
    \or{April}%
    \or{May}%
    \or{June}%
    \or{July}%
    \or{August}%
    \or{September}%
    \or{October}%
    \or{November}%
    \or December\fi}

\AtBeginDocument{
	% Are we using hyperref?
	\ifthenelse{\isundefined{\texorpdfstring}}{%
		% No -- do nowt.
	}{%
		% Yes -- provide extra \autoref commands...
		\let\luthesis@org@autoref\autoref
	
		% \autoref is for inside a sentence
		% This represents the standard hyperref names according to http://www.tex.ac.uk/tex-archive/macros/latex/contrib/hyperref/doc/manual.html at the time of writing.  They are explicitly declared here for ease of maintenance.
		\renewcommand{\autoref}{%
			\def\figureautorefname{Figure}%
			\def\tableautorefname{Table}%
			\def\partautorefname{Part}%
			\def\appendixautorefname{Appendix}%
			\def\equationautorefname{Equation}%
			\def\Itemautorefname{item}%
			\def\chapterautorefname{chapter}%
			\def\sectionautorefname{section}
			\def\subsectionautorefname{subsection}%
			\def\subsubsectionautorefname{subsubsection}%
			\def\paragraphautorefname{paragraph}%
			\def\Hfootnoteautorefname{footnote}%
			\def\AMSautorefname{Equation}%
			\def\theoremautorefname{Theorem}%
			\def\pageautorefname{page}%
			% This one is extra...
			\def\subfigureautorefname{Figure}%
			% Extra for algorithms bundle...
			\def\algorithmautorefname{algorithm}%
			\leavevmode\unskip \luthesis@org@autoref}

		% NOTE: some packages define the plural versions; some don't
		%       so we need to test for this...

		% \autorefs is plural for inside a sentence
		\ifthenelse{\isundefined{\autorefs}}{\newcommand{\autorefs}{}}{}
		\renewcommand{\autorefs}{%
			\def\figureautorefname{Figures}%
			\def\tableautorefname{Tables}%
			\def\partautorefname{Parts}%
			\def\appendixautorefname{Appendices}%
			\def\equationautorefname{Equations}%
			\def\Itemautorefname{items}%
			\def\chapterautorefname{chapters}%
			\def\sectionautorefname{sections}
			\def\subsectionautorefname{subsections}%
			\def\subsubsectionautorefname{subsubsections}%
			\def\paragraphautorefname{paragraphs}%
			\def\Hfootnoteautorefname{footnotes}%
			\def\AMSautorefname{Equations}%
			\def\theoremautorefname{Theorems}%
			\def\pageautorefname{pages}%
			% This one is extra...
			\def\subfigureautorefname{Figures}%
			% Extra for algorithms bundle...
			\def\algorithmautorefname{algorithms}%
			\leavevmode\unskip \luthesis@org@autoref}
		
		% \Autoref is for the beginning of the sentence
		\ifthenelse{\isundefined{\Autoref}}{\newcommand{\Autoref}{}}{}
		\renewcommand{\Autoref}{%
			\def\figureautorefname{Figure}%
			\def\tableautorefname{Table}%
			\def\partautorefname{Part}%
			\def\appendixautorefname{Appendix}%
			\def\equationautorefname{Equation}%
			\def\Itemautorefname{Item}%
			\def\chapterautorefname{Chapter}%
			\def\sectionautorefname{Section}
			\def\subsectionautorefname{Subsection}%
			\def\subsubsectionautorefname{Subsubsection}%
			\def\paragraphautorefname{Paragraph}%
			\def\Hfootnoteautorefname{Footnote}%
			\def\AMSautorefname{Equation}%
			\def\theoremautorefname{Theorem}%
			\def\pageautorefname{Page}%
			% This one is extra...
			\def\subfigureautorefname{Figure}%
			% Extra for algorithms bundle...
			\def\algorithmautorefname{Algorithm}%
			\leavevmode\unskip \luthesis@org@autoref}
		
		% \Autorefs is plural for the beginning of the sentence
		\ifthenelse{\isundefined{\Autorefs}}{\newcommand{\Autorefs}{}}{}
		\renewcommand{\Autorefs}{%
			\def\figureautorefname{Figures}%
			\def\tableautorefname{Tables}%
			\def\partautorefname{Parts}%
			\def\appendixautorefname{Appendices}%
			\def\equationautorefname{Equations}%
			\def\Itemautorefname{Items}%
			\def\chapterautorefname{Chapters}%
			\def\sectionautorefname{Sections}%
			\def\subsectionautorefname{Subsections}%
			\def\subsubsectionautorefname{Subsubsections}%
			\def\paragraphautorefname{Paragraphs}%
			\def\Hfootnoteautorefname{Footnotes}%
			\def\AMSautorefname{Equations}%
			\def\theoremautorefname{Theorems}%
			\def\pageautorefname{Pages}%
			% This one is extra...
			\def\subfigureautorefname{Figures}%
			% Extra for algorithms bundle...
			\def\algorithmautorefname{Algorithms}%
			\leavevmode\unskip \luthesis@org@autoref}
	}%
}
