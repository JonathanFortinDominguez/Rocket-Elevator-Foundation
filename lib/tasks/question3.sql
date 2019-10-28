SELECT  business_name, nbelevator
FROM dimcustomers
WHERE nbelevator > 0
GROUP BY business_name,nbelevator 
order by nbelevator;