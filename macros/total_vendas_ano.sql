{% macro total_vendas_ano(ano) %}

select
    round(sum(valor_bruto_pedido), 2) as total_vendas
from {{ ref('int_ft_pedido') }}
where floor(pk_data_pedido / 10000) = {{ ano }}

{% endmacro %}