Prosper Data Visualizations
==============

Summary
--------

Prosper is part of the peer-to-peer lending industry. In the following visuals we want to explore if a Prosper Score  has an impact on the loan origination amount and monthly loan payment. The following visuals are based on the loans issued by Prosper in 2013.

You can access the visuals by clicking on the following link:
http://bl.ocks.org/yanndupis/raw/a5000c6bf549a53b438224b36ee0ee28/

Design
------

In the first visual we want to make sure that there is a linear relationship between Loan Origination amount and Monthly Loan Payment for each loan. Because we are comparing the relationship between two numerical variables, we have created a scatter plot. In the scatter plot, we can identify three clusters. Prosper provides 12-month, 36-month and 60-month loans. In theory, when the loan origination amount remains the same, a borrower who takes 36 months to reimburse the loan should have a monthly loan payment that is greater than the monthly loan payment for a 60-month loan. For this reason, the Term should provide an explanation about why we have three distinct clusters.

By adding a color to each term length, we can confirm that the three clusters correspond to the three terms, with a linear relationship between Loan Origination Amount and Monthly Loan Payment. When the term decreases, the monthly loan payment increases.  However it's very surprising that monthly payments for some 36-month loans can be as low as monthly payments for some 60-month loans.

Prosper has a Prosper Score that quantifies the loan risk based on credit score, employment, salary etc. It would be interesting to see if it can explain why monthly payments for some 36-month loans can be as low as monthly payments for some 36-month loans. To confirm this hypothesis, we have created a scatter plot showing 36-month loans with the lowest monthly payments (and therefore, the best Prosper Scores: Score >= 9), and 60-month loans
with the highest monthly payments (and therefore the worst Prosper Scores: 1 <= Score <= 2).


After creating this bar chart, we observe that the Monthly Loan Payment for 36-month loans with the highest Prosper Score (Score >= 9) and 60-month loans with with worst Prosper Score (1 <= Score <= 2) are very similar when they have a Loan Origination Amount below $15,000. One of the reasons is that Prosper increases the Monthly Loan Payment if they think there is a greater chance that the borrower will default (which translates to a Low Prosper Score). On the other hand, Prosper will decrease the Monthly Loan Payment if they think there is a smaller chance that the borrower will default (which translates to a High Prosper Score). So we can confirm that the Prosper Score has an impact on Monthly Loan Payments.

To confirm this observation, we can create a bar chart that displays the average Monthly Payment by Prosper Score and by Loan Origination Amount. A bar chart is a great way to compare different categories.

By creating a bar chart, we are able to compare the average Monthly Payment by Prosper Score for a same Loan Origination Amount.
We can conclude that the Prosper Score has an impact on the Loan Origination Amount and Monthly Loan Payment.

Summary
=======

We have been able to demonstrate that the Prosper Score has an impact on Monthly Loan Payments and Loan Origination Amount.
The impact is such that Monthly Loan Payments for 60-month loans with a low Prosper Score (considered high risk loans) tend to be similar to Monthly Loan Payments for 36-month loans with high Prosper Score (considered low risk loans).

Moreover if we look at the bar chart, when we select 12-month terms, we notice that Prosper doesn't provide loans with a Loan Origination Amount over $25,000. Additionally, if the Prosper Score is between 1 and 2, the Loan Origination Amount can not be greater than $15,000. For every term, we observe that the greater the Prosper Score, the lower the monthly payment for a same loan Origination Amount. However the impact of the Prosper Score tends to be greater for Loan Origination Amounts above $10,000. For Loan Origination Amounts less than $10,000, there is almost no impact on the Monthly Loan Payment, except for 60-month loans.


Feedback
--------

You can access to the visuals before feedbacks by clicking on the following link:
http://bl.ocks.org/yanndupis/raw/1d39c1c8961c2a71baa0f03e2bfc31aa/

**Feedback1**

Hi, great job with your visualization. There are some things that I noticed:
- The plot seems to be prematurely cut off in x-direction (may be my browser (firefox)), e.g. for the first plot it stops directly at 15k. Thus some points are cut in the middle. (It appears that this is not always the case.)
- The legend dewscription overlaps with the legend itself.
- when filtering by clicking on the legend there is a negative part on the x-axis (although this just happened once)
- The title of some plots is cut off in the middle
- Some Information in the tooltip is I think not necessary, like the Listing Key, and some description seem to be given in a way used for variable declaration not in a nice way for the user, e.g. MonthlyLoanPayment_pre instead of previous monthly loan payment
- The tool tips on the right edge of the plot are out of screen and not visible.
- A lot of points are overlapping. At least for the tool tips this is not very helpful. But I don't know whether there is a good way to solve this like a transformation of the data in y-direction or jittering.
- x-axis labels are missing

I really like that you used some further regression analysis with R to gain new insights and not just using the given data.

I hope I could help you a little with your work.

Have fun!
Thomas

**Feedback2**

Hi Yann,

You did a great job!

Here are some remarks and suggestions:

I would narrow the width of the html body otherwise the lines of the text are much too long. To paraphrase The Not So Short Introduction to LATEX 2
"
The line length has to be short enough not to strain the eyes of the reader, while long enough to fill the page beautifully.
"

It would be a good idea if the word Prosper in the sentence "Prosper is part.." was a link to Prosper.

On all charts, the title is placed on the right (I would preferred to have it centered, but it is ok) and cut (it does not appear in its full length); maybe it is the chart itself that got cut;

"loan origination amount": loan original amount ?

on all charts:  it would be nice to order the items of the legend in logical order (e.g. increasing order);

chart on proper score:
you want to show that the variability you observed on the previous plot can be ascribed to the proper score. The problem is that we are missing the information on the terms. Wouldn't it be more useful to split the chart "Monthly Loan Payment" in 3:
chart 1: plot the monthly loan payments for the 12-month loans and color the circles by the scores;
chart 2: same for the 36-moth loans,
chart 3: same for the 60-moth loans,
Maybe the legend itself could include the information on how risky it is;
ex.:  Score >= 9 (low risks) instead of simply Score >= 9

best regards,
Laurent

**Feedback3**

Hi Yann,


What do you notice in the visualization?

The presentation was very good. Each of the charts were clearly explained, including the variables used, the date use (2013), the relationships found, and the reason for those relationships.
The relationships found were very strong in each case (the actual data followed the regression results very clearly).

What questions do you have about the data?

Is the data for actual monthly payments (including defaults), or for proposed monthly payments?

What relationships do you notice?

A negative relationship between Term and Monthly Payments
A positive relationship between Loan Original Amount and Monthly Payments
A massive premium for short term loans (also, the term structure seems to be the reverse of standard financial assets).
A negative relationship between Prosper Score and Monthly Payments

What do you think is the main takeaway from this visualization?

The remarkably strong relationships in each of the visualizations.

Is there something you don’t understand in the graphic?

The term structure. I don't understand the massive premium on 12 month loans (could be that they are all high risk, or No Credit, loans). I also don't understand the premium on 36 month loans (in comparison to 60 month loans), as typically the term structure works in reverse (this is less likely to be due to the credit rating of borrowers).

Overall, very nicely presented and explained!!


Summary Feedback
----------------

"The plot seems to be prematurely cut off in x-direction (may be my browser (firefox)), e.g. for the first plot it stops directly at 15k. Thus some points are cut in the middle. (It appears that this is not always the case.)"
Action: I have made sure that the visuals are displayed correctly on Firefox.

"I would narrow the width of the html body otherwise the lines of the text are much too long."<br />
**Action:** I have narrow the html body.

"It would be a good idea if the word Prosper in the sentence "Prosper is part.." was a link to Prosper."<br />
**Action:** I have added a link to Prosper.

"loan origination amount": loan original amount ?<br />
**Action:** I have corrected original by origination.

"you want to show that the variability you observed on the previous plot can be ascribed to the proper score. The problem is that we are missing the information on the terms."<br />
**Action:** I have added 36-month term in the title.

 "In some of your charts, the legend labels are not ordered."<br />
**Action:** I have ordered the labels

 "Some Information in the tooltip is I think not necessary, like the Listing Key, and some description seem to be given in a way used for variable declaration not in a nice way for the user, e.g. MonthlyLoanPayment_pre instead of previous monthly loan payment."<br />
 **Action:** I have kept only the relevant information in the tooltip.


 Resources
-----------
 http://dimplejs.org/
