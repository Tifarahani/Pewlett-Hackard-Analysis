# Pewlett-Hackard-Analysis.
## Overview the analysis
The purpose of this analysis is to prepare Pewlett-Hackard, a company with several thousand employees, for the upcoming “silver tsunami”. A large number of employees will begin retiring at a rapid rate in the next few years and the company wants to be prepared with the retirement packages, open positions and employees’ training. In order to ensure a smooth transition this analysis focuses on the following: 

1.	Identify the retiring employees by their title.
2.	Determine the sum of retiring employees grouped by title.
3.	Identify the employees eligible for participation in the mentorship program.
4.	Determine the number of roles-to-fill grouped by title and department.
5.	Determine the number of qualified, retirement-ready employees to mentor the next generation grouped by title and department.
--- 
### Resources 
- **QuickDBD** 
- **PostreSQL**  
- **pgAdmin**
---

## Deliverable 1:The Number of Retiring Employees by Title
An entity-relationship diagram (ERD) is crucial to creating a good database design. It is used as a high-level logical data model, which is useful in developing a conceptual design for databases.

<p align="center">  
 <img src="https://github.com/Tifarahani/Pewlett-Hackard-Analysis/blob/main/ERD.png" width="350" title="hover text">
</p>
<p align="center">  
<i>Figure 1: ERD</i>
</p>

## Deliverable 1:  The Number of Retiring Employees by Title
* The list of retiring employees
 -	The table includes employee number, first name, last name, title, from-date and to-date.
 -	The query returns 133,776 rows. 
 -	The table displays a list of employees who is going to retire in the next few years.
 -	The list is long and extensive, yet at-a-glance analysis gives us some insights about the query. Some employees appear more than once due to change of title during their career at Pewlett-Hackard.
<p align="center">  
<img src="https://github.com/Tifarahani/Pewlett-Hackard-Analysis/blob/main/Table%20results/EmployeesTitleDuplicates.png" width="50%" height="50%">
</p>
<p align="center">  
<i>Figure 2: Table with the employee’s data that are retirement-ready</i>
</p>
 
**The list of retiring employees without duplicates**

The query has one drawback. It contains all the titles that employees acquired while working at Pewlett-Hackard over the years. This resulted in duplicates, some employees appear two times or more; therefore, the number of retiring employees (133,776) is huge and incorrect.

-	The table includes employee number, first name, last name, title, from-date and to-date.
-	The query returns 90,398 rows. 
- The table displays a list of employees who are going to retire in the next few years.
-	In the table each employee is listed only once, by her or his most recent title.
<p align="center">  
<img src="https://github.com/Tifarahani/Pewlett-Hackard-Analysis/blob/main/Table%20results/EmployeesTitleNODuplicates.png" width="50%" height="50%">
</p>
<p align="center">  
<i>Figure 3: Table with the employee’s data that are retirement-ready without duplicates</i>
</p>

**The number of retiring employees grouped by title**
-	The table includes employees’ titles and their sum. 
-	The query returns a cohesive table with 7 rows.
-	From this table we can quickly see how many employees with certain title will retire in the next few years.

<p align="center">  
<img src="https://github.com/Tifarahani/Pewlett-Hackard-Analysis/blob/main/Table%20results/EmployeesTitleSum.png" width="30%" height="30%">
</p>
<p align="center">  
<i>Figure 4: Table with the employee grouped by title</i>
</p>

## Deliverable 2: The Employees Eligible for the Mentorship Program
**The employees eligible for the mentorship program**
-	The table contains employee number, first name, last name, birth date, from date, to date and title. 
-	The query returns 1,549 rows.
- The table displays a list of employees who is eligible for the mentorship program.
<p align="center">  
<img src="https://github.com/Tifarahani/Pewlett-Hackard-Analysis/blob/main/Table%20results/Menthorship.png" width="50%" height="50%">
</p>
<p align="center">  
<i>Figure 5: Table with the employee grouped by title</i>
</p>

<p align="center">  
<img src="https://github.com/Tifarahani/Pewlett-Hackard-Analysis/blob/main/Table%20results/Extra_QualifiedStaff.png" width="60%" height="60%">
</p>
<p align="center">  
<i>Figure 6: Table with retirement-ready employee’s data with added department name</i>
</p>

## Summary

* knowing if the company has enough human resources in comparison with the retirement work force data,a good planning is essential, especially when such a large number of the employees is involved. Reports show the number of the employees that are about to retire and hold specific title. 
* Retrieve the department name information.
* Merging additional table `departments` into existing table `retirement_titles` with the `inner join`. After removing the duplicates, with `DISTINCT ON` command, the 
<p align="center">  
<img src="https://github.com/Tifarahani/Pewlett-Hackard-Analysis/blob/main/Table%20results/Extra_TitlesAndDepartment.png" width="60%" height="60%">
</p>
<p align="center">  
<i>Figure 6: Table with retirement-ready employee’s data with added department name</i>
</p>

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?***<br>
The table **retirement titles** contains all the information about the employees that are about to retire in the next four years. To get the number of positions that will be open in next four years I ran additional query that breaks down how many staff will retire per department. Since every department will be affected in some way this query gives more precise numbers what each department can expect and how many roles will need to be filled.

<p align="center">  
<img src="https://github.com/Tifarahani/Pewlett-Hackard-Analysis/blob/main/Table%20results/Extra_RolesToFill.png" width="40%" height="40%">
</p>
<p align="center">  
<i>Figure 7: Sum of retirement-ready employees group by title and department.</i> 
</p>




