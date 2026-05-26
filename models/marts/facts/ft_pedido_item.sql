with pedido as (
    select *
    from {{ ref('int_ft_pedido_item') }}
)

select
    *
from pedido