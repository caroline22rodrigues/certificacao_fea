with pedido as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}

)
select distinct
    fk_status_pedido_id as pk_status_pedido_id
    , case fk_status_pedido_id
        when 1 then 'Em processamento'
        when 2 then 'Aprovado'
        when 3 then 'Pedido em espera'
        when 4 then 'Rejeitado'
        when 5 then 'Enviado'
        when 6 then 'Cancelado'
      end as nome_status_pedido
from pedido