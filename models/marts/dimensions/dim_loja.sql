with loja as (
    select *
    from {{ ref('int_dim_loja') }}

)
select *
from loja


