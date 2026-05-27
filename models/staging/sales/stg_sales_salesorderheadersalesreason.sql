with
    fonte as (
        select *
        from {{ source('sales', 'sales_salesorderheadersalesreason') }}
    )
    
    , renomeado as (
        select
            cast(salesorderid as int) as pk_pedido_id
            , cast(salesreasonid as int) as fk_motivo_venda_id
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado