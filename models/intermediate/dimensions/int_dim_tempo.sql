with
    date as (
        {{
            dbt_utils.date_spine(
                datepart = "day",
                start_date = "cast('2000-01-01' as date)",
                end_date = "cast('2026-01-01' as date)"
            )
        }}
    )
select 
    replace(cast(date_day as date), '-', '') as pk_data
    , cast(date_day as date) as data
    , extract(day from date_day) as dia
    , extract(month from date_day) as mes
    , extract(year from date_day) as ano
    , extract(dow from date_day) as dia_da_semana
    , case     
        when extract(dow from date_day) in (0,6) then true
        else false
    end as is_final_de_semana
from date