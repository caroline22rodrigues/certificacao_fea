with vendedor as (
    select *
    from {{ ref('int_dim_vendedor') }}

)
select *
from vendedor


