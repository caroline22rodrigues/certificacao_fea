with
    fonte as (
        select *
        from {{ source('sales', 'sales_currency') }}
    )
    
    , renomeado as (
        select
            cast(currencycode as string) as pk_moeda_id
            , cast(name as string) as nome_moeda
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado