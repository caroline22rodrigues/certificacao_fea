with item as (
    select *
    from {{ ref('stg_sales_salesorderdetail') }}
)
select
    -- chaves
    item.pk_pedido_item_id
    , item.pk_pedido_id
    , item.fk_produto_id
    -- métricas do item
    , item.quantidade_pedida
    , item.preco_unitario
    , item.desconto_preco_unitario
    -- cálculos
    , (item.quantidade_pedida * item.preco_unitario) as valor_bruto
    , (item.quantidade_pedida* item.preco_unitario* (1 - item.desconto_preco_unitario)) as valor_liquido
    , current_timestamp() as data_escrita_elt
from item