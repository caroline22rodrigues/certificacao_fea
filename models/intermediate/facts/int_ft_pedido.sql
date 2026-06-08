with pedido as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
)
, cliente as (
    select *
    from {{ ref('stg_sales_customer') }}
)
, item as (
    select *
    from {{ ref('stg_sales_salesorderdetail') }}
)
, metricas_item as (
    select
        pk_pedido_id
        , sum(quantidade_pedida * preco_unitario) as valor_bruto_pedido
        , sum(
            quantidade_pedida
            * preco_unitario
            * (1 - desconto_preco_unitario)
        ) as valor_liquido_pedido
        , sum(quantidade_pedida) as quantidade_itens
        , count(distinct fk_produto_id) as quantidade_produtos
    from item
    group by 1
)

select
    pedido.pk_pedido_id
    , pedido.fk_cliente_id
    , cliente.fk_loja_id
    , pedido.fk_vendedor_id
    , pedido.fk_pagamento_id
    , pedido.fk_territorio_id
    , pedido.fk_endereco_cobranca_id
    , pedido.fk_endereco_entrega_id
    , pedido.fk_metodo_envio_id
    , pedido.fk_status_pedido_id
    , replace(pedido.data_pedido, '-', '') as pk_data_pedido
    -- métricas agregadas
    , metricas_item.valor_bruto_pedido
    , metricas_item.valor_liquido_pedido
    , metricas_item.quantidade_itens
    , metricas_item.quantidade_produtos
    -- header
    , pedido.valor_frete
    , pedido.valor_imposto
    , pedido.valor_total
    -- auditoria
    , current_timestamp() as data_escrita_elt
from pedido
left join cliente
    on pedido.fk_cliente_id = cliente.pk_cliente_id
left join metricas_item
    on pedido.pk_pedido_id = metricas_item.pk_pedido_id