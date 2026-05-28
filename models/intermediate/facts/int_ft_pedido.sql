with pedido as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
)
, tempo as (
    select *
    from {{ ref('int_dim_tempo') }}

)
select
    pedido.pk_pedido_id
    -- dimensões
    , tempo.pk_data as pk_data_pedido
    , pedido.fk_cliente_id
    , pedido.fk_territorio_id
    , pedido.fk_pagamento_id
    , pedido.fk_endereco_cobranca_id
    , pedido.fk_endereco_entrega_id
    , pedido.fk_metodo_envio_id
    , pedido.fk_status_pedido_id
    , pedido.fk_vendedor_id
    -- datas
    , pedido.data_pedido
    -- métricas do pedido
    , pedido.valor_frete
    , pedido.valor_imposto
    , pedido.valor_total
    -- auditoria
    , pedido.data_modificacao
    , current_timestamp() as data_escrita_elt
from pedido
left join tempo  on tempo.data = pedido.data_pedido

