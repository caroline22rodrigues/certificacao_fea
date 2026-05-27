with endereco as (
    select *
    from {{ ref('int_dim_endereco') }}
)
select
    *
from endereco
