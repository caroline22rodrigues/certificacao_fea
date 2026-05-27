with vendas_2011 as (
    select
        round(sum(valor_bruto), 2) as total_vendas_brutas
    from {{ ref('ft_pedido_item') }}
    where year(data_pedido) = 2011
)
select *
from vendas_2011
where total_vendas_brutas != 12646112.16