create view appointments_enriched as 
select a."AppointmentID", a."PatientID", a."DoctorID", a."AppointmentDate", a."Status", 
		p."FirstName" as patient_first_name, p."LastName" as patient_last_name,
		d."FirstName" as doctor_first_name, d."LastName" as doctor_last_name,
		extract (day from a."AppointmentDate") as Date
from appointments a 
join patients p 
on a."PatientID"= p."PatientID"
join doctors d 
on a."DoctorID" = d."DoctorID";

-- drop view appointments_enriched;
-- SELECT * FROM appointments_enriched;

create view patient_balances as
select a."PatientID", 
		sum(b."TotalAmount") as "Total Billed", 
		sum(b."PaidAmount") as "Total Paid", 
		sum(b."TotalAmount") - sum(b."PaidAmount")   as "Total Outstanding"
from admissions a 
join bills b 
on a."AdmissionID" = b."AdmissionID"
group by a."PatientID";

-- drop view patient_balances;
-- SELECT * FROM patient_balances ;

-- Per month & DoctorID: total appointments, cancelled appointments, cancellation rate.
create view doctor_monthly_metrics as 
SELECT 
    "DoctorID",
    extract(month from "AppointmentDate") as month,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN "Status" = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_appointments
FROM appointments
GROUP BY "DoctorID", extract(month from "AppointmentDate") 
ORDER BY "DoctorID", month;

select * from doctor_monthly_metrics
