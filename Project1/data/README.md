# Data_Dictionary


## Inmate Fact Sheet

The Fact Sheet has information on the demographics of prisoners who in
2020, were admitted, released, and confined in the prison by the end of
the fiscal year. The information is available by gender. I saved all
tables from the Fact Sheet except for County of Conviction. For
categories in which the counts and distribution were both provided, such
as “Admit Type \#” and “Admit Type %”, I only saved the counts.

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
