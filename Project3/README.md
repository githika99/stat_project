# Model


-   Add a picture of every graph with state superimposed on private (for
    matching graphs). Add a line on top that traces the histogram’s
    shape.

-   i want to somehow see if ADP more directly correlates to higher
    spending. OR if custody type (max, min, close, med) correlate to
    spending. I want to test how these effects differ for state and
    private prisons.

-   combine private and state data.

In order to analyze the difference between private and public prisons, I
will use Principle Component Analysis. After reducing dimensionality
with PCA, I created a plot in which private and public prisons are
colored differently. I then used hierarchical clustering to see if these
prisons cluster differently. I found that …

**Analysis**

The PCA Graph shows that State prisons are more consistent in how they
operate per inmate and Private prisons are more varied and some diverge
significantly from the state cluster. The difference is not significant
enough to determine that all private prisons are different from all
state prisons.

The scree plot for private prisons shows that PCA1 and PCA2 have
non-zero variances. This implies PCA found two patterns in the data.

The scree plot for state prisons shows that only PCA1 has a non-zero
variance. This implies PCA found only one pattern in the data.

In order to uncover the pattern that PCA found in state prison data, I
used regression.

I conducted regression to quantify how prison type and ADP effects cost
metrics. I controlled for number of prisoners by only looking at the per
capita measures. Additionally, I controlled for custody by only
selecting minimum and medium prisons, since there is no data for close
custody or max custody private prisons.

I used \_\_\_ regression because \_\_\_. The residuals of the model were
\_\_\_ normal, as displayed in this plot.
