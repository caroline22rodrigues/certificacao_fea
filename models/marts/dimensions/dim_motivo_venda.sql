
with motivo_venda as (
    select *
    from {{ ref('int_dim_motivo_venda') }}
)
select
    *
from motivo_venda