{{ config(materialized='table') }}

select count(poutcome) as contactosExitosos,
round((count(poutcome)*100)/sum(totalContactos),2) as TasaExito,
segmentacion
from  {{ref("staging_bank_marketing")}}
where lower(poutcome) = "success"
group by segmentacion