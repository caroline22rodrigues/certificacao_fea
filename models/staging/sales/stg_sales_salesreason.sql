with
    fonte as (
        select *
        from {{ source('sales', 'sales_salesreason') }}
    )
    
    , renomeado as (
        select
            cast(salesreasonid as int) as pk_motivo_venda_id
            , cast(name as string) as nome_motivo_venda
            , cast(reasontype as string) as tipo_motivo_venda
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado