\usepackage{subcaption}
\geometry{margin=1in}
\usepackage{authblk}
\usepackage{multirow}
\usepackage[table,xcdraw]{xcolor}
\linespread{1.5} 
\newfloatcommand{capbtabbox}{table}[][\FBwidth]
\usepackage{blindtext}
\usepackage{wrapfig,booktabs}
\usepackage[utf8]{inputenc}
\usepackage{fontenc}
\usepackage{graphicx}
\usepackage{subfig}
\usepackage{biblatex}
\addbibresource{citations-2.bib}
\usepackage[colorlinks,citecolor=red,urlcolor=blue,bookmarks=false,hypertexnames=true]{hyperref} 
\begin{document}
\title{\textbf{\huge{Predicting the Number of Bicycle Rentals}}}
\author{\textbf{\large{ID: 1716469}}}
%\affiliation{The	College,	University	of	Chicago,	Chicago,	Illinois	60637,	USA}

\date{\today}
%	Abstract
\maketitle
\maketitle
%	\tableofcontents
%%	Main	body	starts	here
%	Description	of	Section	1
%	Section	2\\
\section{Introduction}
\label{sec:Sec2}
We are hired by a company running a bicycle rental business to develop a model which predicts the number of bikes rented at any given time. The company has provided us with an hourly rental data set which has been collected for two consecutive years: 2011 and 2012. The data can be found at(cite).  In this scenario, one of our aims is to train our model on the 2011 data and predict the number of rentals using the 2012 data. The other aim is to understand how factors such as weather condition, external parameters (temperature, humidity, wind speed) and the types of customers affect the number of rentals. 
%	Section	3
\section{Statistical Methodology}
\label{sec:Sec3}
\subsection{Exploratory Data Analysis (EDA)}
The company believes that customers who pay annual membership (registered users) have a different behaviour than the ones who use the scheme on a pay-as-you-go basis (casual users). Therefore, we suspect that these two categories need to be modeled separately but further investigation is needed. Figure $1$(a) presents histograms(cite) for both count variables that we need to study. We observe that they both present right-skewness in their distributions and high excess of zero values. The shape of the box plots(cite) from Figure $1$(b) confirm what the histograms showed about the distributions. Furthermore, they reveal the presence of many outliers more of which belong to the category of casual users.\\
Figure $2$ focuses on how the hourly trend(cite) of bike rentals behaves for each type of user. First we see that the convention used in the data set is the $24$-hour clock. We notice that on average registered customers hire bikes more frequently than casual customers. The exception to this rule is made between $3$:$00$ a.m. and $5$:$00$ a.m. when the number of rentals is around $0$. This is perfectly plausible given the hours when this occurs. Another feature of interest in this plot is represented by the two bumps around $8$:$00$ a.m. and $6$:$00$ p.m. on the curve of registered users. These might be explained by the usual hours for schools and jobs. 
\begin{figure}[]%
\centering
\subfloat[Histograms for both types of users]{{\includegraphics[width=7cm]{hista3.png} }}%
\qquad
\subfloat[Boxplots for both types of users]{{\includegraphics[width=8cm]{boxa3.png} }}%
\caption{Histograms and boxplots for both types of customers}%
\end{figure}

\begin{figure}[H]
\includegraphics[width=8cm,height=6cm]{trenda3.png}
\caption{Hourly trend for \textcolor{blue}{registered} users and \textcolor{red}{casual} users}
\end{figure}
\noindent
We investigate further the hourly trend(cite) of rentals but with respect to the categorical variables from the data. Figure $3$ shows a contrast in behaviour between registered and casual users during holidays time. We observe that on average registered users exhibit a higher demand for bikes outside the holidays season. A particular aspect is that the two peaks spotted earlier appear again in Figure $3$(a). On the other hand, Figure $3$(b) depicts the higher demand on average for casual users during the holidays season with an emphasis on the afternoon time in this period.
\begin{figure}[]%
\centering
\subfloat[Bikes hired on holidays by registered users]{{\includegraphics[width=7.5cm]{p1a3.png} }}%
\qquad
\subfloat[Bikes hired on holidays by casual users]{{\includegraphics[width=7.5cm]{p2a3.png} }}%
\caption{The hourly trend of bike rentals on holidays for both types of customers}%
\end{figure}

\begin{figure}[H]%
\centering
\subfloat[Bikes hired on working/non-working days by registered users]{{\includegraphics[width=7.5cm]{p3a3.png} }}%
\qquad
\subfloat[Bikes hired on working/non-working days by casual users]{{\includegraphics[width=7.5cm]{p4a3.png} }}%
\caption{The hourly trend of bike rentals on working/non-working days for both types of customers}%
\end{figure}
\noindent
Figure $4$ continues to reveal more of the contrasting pattern of rentals between registered and casual users. We can spot a trend reversal for registered users during the afternoon of each day. There is a higher demand for bikes during this particular time in the weekend. On the other hand, demand during non-working days is predominant for casual users. At this point we can infer that registered customers subscribe to company's service to use the bikes as a means of transport to ride either to school or to the workplace. At the other end, casual customers seem to use the renting scheme for cycling as a leisure time activity. 
\begin{figure}[H]%
    \centering
    \subfloat[Bikes hired based on weather condition]{{\includegraphics[width=7.5cm]{p5p6a3.png} }}%
    \qquad
    \subfloat[Bikes hired based on season]{{\includegraphics[width=7.5cm]{seasona3.png} }}%
    \caption{The total number of bikes hired based on weather condition and season}%
\end{figure}
\noindent
Figure $5$(a) displays a similar attitude among both types of customers regarding weather. The general idea is that the number of rentals increases for both categories as the weather conditions are better. Figure $5$(b) shows that the similarities also occur for rentals in a particular season. This means that greater demand for bikes can be attributed to warmer seasons.\\
Next, we study how variables such as temperature, feeling temperature, humidity and wind speed affect the number of bike rentals. We investigated this relationship separately for registered and casual users and the differences are indistinguishable. Thus, figure $6$(a) shows the relationship between the aforementioned parameters and the total number of rentals (registered and casual). We can see in figure $6$(b) that normalized temperature and normalized feeling temperature are almost perfectly correlated. Consequently, as both increase, the demand for bikes increases too as we can observe from both the scatter plot and the correlation matrix. On the other hand, the humidity and the demand are negatively correlated while the wind speed shows no significant correlation with the rentals. Moreover, as we concluded from the earlier plots, \texttt{hour} is an important predictor as it is positively correlated with the number of rentals.
\begin{figure}[H]%
    \centering
    \subfloat[Relationship between total rentals and external air parameters]{{\includegraphics[width=7.5cm]{pa3.png} }}%
    \qquad
    \subfloat[Correlation matrix for continuous variables]{{\includegraphics[width=7.5cm]{corr.png} }}%
    \caption{Relationship between response and continuous predictors and their correlation matrix}%
\end{figure}



\subsection{Modeling Process}

\section{Appendix}



\color{black}
\noindent\rule[0.25\baselineskip]{\textwidth}{1pt}
% Bibliography
% \small
%\bibliographystyle{unsrt}


\printbibliography
%\bibliographystyle{unsrt}
%\bibliography{citations-2.bib}






\end{document}