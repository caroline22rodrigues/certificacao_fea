{% test total_vendas_ano(model, ano, valor_esperado) %}

with vendas as (
    select
        round(sum(valor_bruto_pedido), 2) as total_vendas_brutas
    from {{ model }}
    where substring(cast(pk_data_pedido as string), 1, 4) = {{ ano }}
)

select *
from vendas
where total_vendas_brutas != {{ valor_esperado }}

{% endtest %}