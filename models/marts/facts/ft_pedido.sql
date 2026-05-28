with pedido as (
    select *
    from {{ ref('int_ft_pedido') }}
)

select
    *
from pedido