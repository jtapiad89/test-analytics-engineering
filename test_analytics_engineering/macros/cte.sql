{% macro cte() %}
select 
SAFE_CAST(age  as integer) as age,
job,
marital,
education,
CAST(CASE
  WHEN lower(`default`) = "yes" THEN 1
  WHEN lower(`default`) = "no" THEN 0
  ELSE NULL
  END as BOOL) as `default`,
SAFE_CAST(balance as integer) as balance,
CAST(CASE
  WHEN lower(`housing`) = "yes" THEN 1
  WHEN lower(`housing`) = "no" THEN 0
  ELSE NULL
  END as BOOL) as `housing`,
CAST(CASE
  WHEN lower(`loan`) = "yes" THEN 1
  WHEN lower(`loan`) = "no" THEN 0
  ELSE NULL
  END as BOOL) as `loan`,
contact,
SAFE_CAST(day as integer) as day,
month,
SAFE_CAST(duration as integer) as duration,
SAFE_CAST(campaign as integer) as campaign,
SAFE_CAST(pdays as integer) as pdays,
SAFE_CAST(previous as integer) as previous,
poutcome,
CAST(CASE
  WHEN lower(`y`) = "yes" THEN 1
  WHEN lower(`y`) = "no" THEN 0
  ELSE NULL
  END as BOOL) as `y`,
SAFE_CAST(campaign as integer)+SAFE_CAST(previous as integer) as totalContactos,
0 as score
from {{ source("DeaAnalytics","raw_bank_marketing")}}
where SAFE_CAST(pdays as integer) > -1
and lower(job) in ("admin.","unknown","unemployed","management","housemaid","entrepreneur","student","blue-collar","self-employed","retired","technician","services")
and lower(marital) in ("married","divorced","single","divorced","widowed")
and lower(education) in ("unknown","secondary","primary","tertiary")
and lower(`default`) is not NULL
and lower(housing) is not NULL
and lower(loan) is not NULL
and lower(contact) in ("unknown","telephone","cellular")
and lower(`month`) in ("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec")
and lower(poutcome) in ("unknown","other","failure","success")
and lower(y) is not NULL
{% endmacro %}

{% macro score_calc() %}
select
age,
job,
marital,
education,
`default`,
balance,
`housing`,
`loan`,
contact,
day,
month,
duration,
campaign,
pdays,
previous,
poutcome,
`y`,
totalContactos,
case
when age < 30 then score+1
when age > 60 then score+2
else score
end as scoreA,

case
when job = "unemployed" then score+2
when job = "retired" then score+2
else score
end as scoreJ,

case
when marital = "single" then score+1
else score
end as scoreM,

case
when education = "secondary" then score+1
when education = "primary" then score+2
else score
end as scoreE,

case
when loan = true then score+1
else score
end as scoreL,

case 
when housing = true then score+1
else score
end as scoreH
{%endmacro%}

{% macro segmentar() %}
select
age,
job,
marital,
education,
`default`,
balance,
`housing`,
`loan`,
contact,
day,
month,
duration,
campaign,
pdays,
previous,
poutcome,
`y`,
totalContactos,
case 
when scoreA+scoreJ+scoreM+scoreE+scoreL+scoreH < 3 then "low"
when scoreA+scoreJ+scoreM+scoreE+scoreL+scoreH > 5 then "high"
else "medium" 
end as segmentacion
{% endmacro %}

