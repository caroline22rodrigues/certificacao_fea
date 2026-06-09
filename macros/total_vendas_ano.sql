{% macro total_vendas_ano(ano) %}

select round(sum(valor_bruto_pedido), 2) qtd_vendas_ano
from {{ ref('int_ft_pedido') }}
where substring(cast(pk_data_pedido as string), 1, 4) = '{{ ano }}'

{% endmacro %}