with pedido_motivo_venda as (
    select *
    from {{ ref('stg_sales_salesorderheadersalesreason') }}
)
, motivo_venda as (
    select *
    from {{ ref('int_dim_motivo_venda') }}
)
select
    pedido_motivo_venda.pk_pedido_id
    , pedido_motivo_venda.fk_motivo_venda_id
    , motivo_venda.nome_motivo_venda
    , motivo_venda.tipo_motivo_venda
from pedido_motivo_venda
left join motivo_venda on pedido_motivo_venda.fk_motivo_venda_id = motivo_venda.pk_motivo_venda_id