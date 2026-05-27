with
    fonte_purchaseorderdetail as (
        select *
        from {{ source('purchasing', 'purchasing_purchaseorderdetail') }}
    )
    
    , renomeado as (
        select 
            cast(purchaseorderid as int) as pk_pedido_id
            , cast(purchaseorderdetailid as int) as pk_pedido_item_id 
            , cast(duedate as date) as data_prevista_entrega
            , cast(orderqty as int) as quantidade_pedida
            , cast(productid as int) as pk_produto_id
            , cast(unitprice as decimal(18,2)) as preco_unitario
            , cast(receivedqty as int) as quantidade_recebida
            , cast(rejectedqty as int) as quantidade_rejeitada
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte_purchaseorderdetail
    )

select *
from renomeado