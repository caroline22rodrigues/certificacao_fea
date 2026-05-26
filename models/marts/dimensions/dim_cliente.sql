with cliente as (
    select *
    from {{ ref('int_dim_cliente') }}
)
select
*
from cliente
