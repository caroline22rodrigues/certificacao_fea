with
    fonte as (
        select *
        from {{ source('sales', 'sales_salesorderdetail') }}
    )
    
    , renomeado as (
        select
            cast(salesorderid as int) as pk_pedido_id
            , cast(salesorderdetailid as int) as pk_pedido_item_id
            , cast(carriertrackingnumber as string) as codigo_rastreio_transportadora
            , cast(orderqty as int) as quantidade_pedida
            , cast(productid as int) as fk_produto_id
            , cast(specialofferid as int) as fk_oferta_especial_id
            , cast(unitprice as decimal(18,2)) as preco_unitario
            , cast(unitpricediscount as decimal(18,2)) as desconto_preco_unitario
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado