{% test check_type(model, column_name, tipo) %}

with validation as (

    select
        {{ column_name }} as even_field

    from {{ model }}

),

validation_errors as (

    select
        data_type
    from `{{target.schema}}.INFORMATION_SCHEMA.COLUMNS`
    where table_name = {{model}}
    and column_name = {{column_name}}

)

select *
from validation_errors

{% endtest %}