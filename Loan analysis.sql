/* Printing first 1000 columns*/
select * from financial_loan;

/*Total applications */
select count(id) as total_applications 
from financial_loan;

/*Last/Final month total applications */
select count(id) as total_applications 
from financial_loan
where month(issue_date) = 12 ;

/*Total funded amount */
select SUM(loan_amount) as total_funded_amount 
from financial_loan;

/*Last/Final total funded amount*/
select SUM(loan_amount) as total_funded_amount 
from financial_loan
where month(issue_date) = 12 ;

/* Total amount recieved */
select SUM(total_payment) as total_amount_received 
from financial_loan;

/*Month-to-date total amount recieved  */
select SUM(total_payment) as total_amount_received 
from financial_loan 
where month(issue_date) = 12 and year(issue_date) = 2021 ;

/* Average interest rate */
select ROUND(AVG(int_rate), 5) *100 as average_interest_rate
from financial_loan;

/*Month-to-date average interest rate */
select ROUND(AVG(int_rate), 5) *100 as average_interest_rate
from financial_loan
where month(issue_date) = 12 and year(issue_date) = 2021 ;

/* Average DTI */
select AVG(dti) * 100 as average_dti 
from financial_loan ;

/*MTD Average DTI */
select AVG(dti) * 100 as average_dti 
from financial_loan 
where month(issue_date) = 12 and year(issue_date) = 2021 ;

/* Good Loan Percentage */
SELECT
(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
COUNT(id) AS good_loan_percentage
FROM financial_loan;

/* Good Loan Applications */
SELECT COUNT(id) AS good_loan_applications 
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' ; 

/* Good Loan Funded Amount */
SELECT SUM(loan_amount) AS good_loan_funded_amount 
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' ;

/* Good Loan Amount Received */
SELECT SUM(total_payment) AS good_Loan_amount_received 
FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' ;

/* Bad loan applications */ 
SELECT COUNT(id) as bad_loan_applications from financial_loan
where loan_status = "Charged off" ;

/* Bad Loan Percentage */
SELECT
(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
COUNT(id) AS bad_loan_percentage
FROM financial_loan ; 
 
/* Bad Loan Funded Amount*/
SELECT SUM(loan_amount) AS bad_loan_funded_amount 
FROM financial_loan
WHERE loan_status = 'Charged Off' ;
 
/* Bad Loan Amount Received */
SELECT SUM(total_payment) AS Bad_loan_amount_received
 FROM financial_loan
WHERE loan_status = 'Charged Off';

/* Loan status */
SELECT loan_status , 
count(id) as total_loan_applications ,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount ,
avg(int_rate * 100) as interest_rate ,
avg(dti * 100) as interest_rate,
avg(dti * 100) as DTI
from financial_loan group by loan_status ; 

/* Month-to-date Loan status */
SELECT loan_status , 
count(id) as total_loan_applications ,
sum(total_payment) as mtd_total_amount_received,
sum(loan_amount) as mtd_total_funded_amount
from financial_loan 
where month(issue_date) = 12
group by loan_status ;

/* Grouping by month */
select month(issue_date),
MONTHNAME(issue_date) as month_name,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount, 
sum(total_payment) as total_received_amount
from financial_loan 
group by month(issue_date),MONTHNAME(issue_date) 
order by month(issue_date);

/* Grouping by address state */
select address_state,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount, 
sum(total_payment) as total_received_amount
from financial_loan 
group by address_state
order by count(id) DESC ;

/* Grouping by term */
select term,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount, 
sum(total_payment) as total_received_amount
from financial_loan 
group by term
order by count(id) DESC;

/* Grouping by employee length (customers) */
select emp_length,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount, 
sum(total_payment) as total_received_amount
from financial_loan 
group by emp_length
order by count(id) DESC;

/* Grouping by purpose of loan application */
select purpose,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount, 
sum(total_payment) as total_received_amount
from financial_loan 
group by purpose
order by count(id) DESC;

/* Grouping by Home ownership*/
select home_ownership,
count(id) as total_loan_applications,
sum(loan_amount) as total_funded_amount, 
sum(total_payment) as total_received_amount
from financial_loan 
group by home_ownership
order by count(id) DESC;

select * from financial_loan;
