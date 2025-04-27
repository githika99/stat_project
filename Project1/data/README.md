# Data_Dictionary


## Inmate Fact Sheet

The Fact Sheet has information on the demographics of prisoners who in
2020, were admitted, released, and confined in the prison by the end of
the fiscal year. The information is available by gender. I saved all
tables from the Fact Sheet except for County of Conviction. For
categories in which the counts and distribution were both provided, such
as “Admit Type \#” and “Admit Type %”, I only saved the counts.

The following tables explain the terms found in Admit_Type.csv.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td><strong>New Court Commitments</strong></td>
<td>People newly sentenced to prison by a court.</td>
</tr>
<tr>
<td><strong>County Probationers Revoked</strong></td>
<td>People sent to prison because their county probation was
canceled.</td>
</tr>
<tr>
<td><strong>ADC Paroles Revoked</strong></td>
<td>People sent back to prison because they violated Arizona parole
rules.</td>
</tr>
<tr>
<td><strong>Other</strong></td>
<td>Admissions that don’t fit into the main listed categories.</td>
</tr>
</tbody>
</table>

The following tables explain the terms found in Criminal_History.csv.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td>Violent History</td>
<td><strong>Prisoners with a violent criminal history.</strong></td>
</tr>
<tr>
<td>Current Violent</td>
<td>Prisoners who are currently serving a sentence for a violent
crime.</td>
</tr>
<tr>
<td>Non Violent #</td>
<td>Prisoners with a non violent criminal history and prisoners who are
currently serving a sentence for a non violent crime.</td>
</tr>
</tbody>
</table>

The following tables explain the terms found in Felony_Class.csv.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr>
<th>Felony Class 1</th>
<th>Most serious crimes (like murder).</th>
</tr>
</thead>
<tbody>
<tr>
<td>Felony Class 2</td>
<td>Very serious crimes (like manslaughter or armed robbery).</td>
</tr>
<tr>
<td>Felony Class 3</td>
<td>Serious crimes (like aggravated assault).</td>
</tr>
<tr>
<td>Felony Class 4</td>
<td>Mid-level crimes (like theft or drug possession with intent).</td>
</tr>
<tr>
<td>Felony Class 5</td>
<td>Less serious felonies (like credit card fraud).</td>
</tr>
<tr>
<td>Felony Class 6</td>
<td>Least serious felonies (sometimes treated like misdemeanors).</td>
</tr>
</tbody>
</table>

The following tables explain the terms found in Mental_Health.csv.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td><strong>Score 1: No Need</strong></td>
<td>No mental health treatment needed.</td>
</tr>
<tr>
<td><strong>Score 2: Low Need</strong></td>
<td>Minor mental health support needed.</td>
</tr>
<tr>
<td><strong>Score 3: Moderate to High Need</strong></td>
<td>Moderate to serious mental health support needed.</td>
</tr>
<tr>
<td><strong>Score 4: High Need</strong></td>
<td>Significant mental health treatment needed.</td>
</tr>
<tr>
<td><strong>Score 5: Acute Need</strong></td>
<td>Immediate, intensive mental health care required.</td>
</tr>
</tbody>
</table>

The following tables explain the terms found in
Substance_Abuse_History.csv.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr>
<th><strong>Score 0: No Need</strong></th>
<th>No substance abuse help needed.</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Score 1: Education Need</strong></td>
<td>Needs education about substance abuse, but no treatment.</td>
</tr>
<tr>
<td><strong>Score 2: Moderate Treatment Need</strong></td>
<td>Needs moderate level substance abuse treatment.</td>
</tr>
<tr>
<td><strong>Score 3: Intense Treatment Need</strong></td>
<td>Needs intensive substance abuse treatment.</td>
</tr>
</tbody>
</table>

The terms in the remaining tables are self explanatory.

## Cost Report

The focus of my project is the difference in expenditures between
private and public prison units. Thus, although the report has lots of
interesting information, I focused on tables directly related to this. I
extracted the Expenditure Summary table on page 8 of the pdf. In this
table, I only extracted the information from the Private Prisons. The
information on private prisons was organized by unit. I extracted the
entire table from pages 10 and 11 of the pdf, which contains information
on State Prison Expenditure by Prison Unit. Since both the extracted
data for Private and Public prisons was then organized by unit, I could
compare the data.

This table explains the meaning of each column of
Private_Prison_Expenditure.csv and State_Prison_Expenditure.csv.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr>
<td>CUSTODY</td>
<td>Type or level of security supervision for inmates (Minimum, Medium,
Close, or Maximum).</td>
</tr>
<tr>
<td>ADP</td>
<td>(Average Daily Population) Average number of inmates housed each day
over a year.</td>
</tr>
<tr>
<td>Unit Direct</td>
<td>Costs directly tied to running a single prison unit.</td>
</tr>
<tr>
<td>Complex Direct</td>
<td>Costs directly tied to managing a group of prison units.</td>
</tr>
<tr>
<td>Total Direct</td>
<td>All direct costs combined from units and complexes.</td>
</tr>
<tr>
<td>Total Indirect</td>
<td>Overhead costs not tied to specific units (like administration,
HR).</td>
</tr>
<tr>
<td>Total Expense</td>
<td>Direct + Indirect costs</td>
</tr>
<tr>
<td>Annual Per Capita Cost - Direct</td>
<td>Direct costs divided by the number of inmates per year.</td>
</tr>
<tr>
<td>Annual Per Capita Cost - Indirect</td>
<td>Indirect costs divided by the number of inmates per year.</td>
</tr>
<tr>
<td>Annual Per Capita Cost - Total</td>
<td>Total costs divided by the number of inmates per year.</td>
</tr>
<tr>
<td>Daily Per Capita Cost</td>
<td>Total costs divided by inmates per day.</td>
</tr>
</tbody>
</table>
