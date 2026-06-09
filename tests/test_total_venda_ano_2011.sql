-- depends_on: {{ ref('int_ft_pedido') }}

with resultado as (

    {{ total_vendas_ano(2011) }}

)

select *
from resultado
where total_vendas != 12646112.16