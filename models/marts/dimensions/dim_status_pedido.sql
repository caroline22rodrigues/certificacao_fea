with status_pedido as (
    select *
    from {{ ref('int_dim_status_pedido') }}

)
select *
from status_pedido