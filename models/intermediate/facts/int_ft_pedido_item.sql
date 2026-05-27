with pedido as (
    select *
    from {{ ref('stg_sales_salesorderheader') }}
)
, item as (
    select *
    from {{ ref('stg_sales_salesorderdetail') }}
)
select
    item.pk_pedido_id
    , item.pk_pedido_item_id
    , pedido.fk_cliente_id
    , pedido.fk_territorio_id
    , item.fk_produto_id
    , item.quantidade_pedida
    , item.preco_unitario
    , item.desconto_preco_unitario
    , (item.quantidade_pedida * item.preco_unitario) as valor_bruto
    , (item.quantidade_pedida * item.preco_unitario * (1 - item.desconto_preco_unitario)) as valor_liquido
    , pedido.valor_frete
    , pedido.valor_imposto
    , pedido.data_modificacao
from item
left join pedido on item.pk_pedido_id = pedido.pk_pedido_id