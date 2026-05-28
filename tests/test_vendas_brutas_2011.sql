with vendas_2011 as (
  select
        round(sum(valor_bruto_pedido),2)as total_vendas_brutas
    from {{ ref('ft_pedido') }} pedido 
    where year(data_pedido) = 2011  
)
select *
from vendas_2011
where total_vendas_brutas != 12646112.16 --Valor informado por Carlos para 2011