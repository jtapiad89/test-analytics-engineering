{{ config(materialized='table') }}

with filtrados as(
    {{ cte() }}
), 
creacionScore as(
    {{score_calc()}}
    from filtrados
), 
segmentacion as (
    {{segmentar()}}
    from creacionScore
)
select * from segmentacion