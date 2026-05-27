with produto as (
    select *
    from {{ ref('int_dim_produto') }}
)
select
    *
from produto