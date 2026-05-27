with pedido_motivo_venda as (
    select *
    from {{ ref('int_brg_motivo_venda') }}
)
select
    *
from pedido_motivo_venda
