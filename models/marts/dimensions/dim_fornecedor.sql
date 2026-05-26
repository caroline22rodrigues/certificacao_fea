with fornecedor as (
    select *
    from {{ ref('int_dim_fornecedor') }}
)
select
   *
from fornecedor