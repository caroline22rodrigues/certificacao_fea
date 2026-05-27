with date as (
    select *
    from {{ ref('int_dim_tempo') }}

)
select *
from date