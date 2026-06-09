with resultado as (

    {{ total_vendas_ano(2011) }}

)

select *
from resultado
where qtd_vendas_ano != 12646112.16