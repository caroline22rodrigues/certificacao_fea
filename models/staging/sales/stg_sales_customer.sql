with
    fonte as (
        select *
        from {{ source('sales', 'sales_customer') }}
    )
    
    , renomeado as (
        select
            cast(customerid as int) as pk_cliente_id
            , cast(personid as int) as fk_pessoa_id
            , cast(storeid as int) as fk_loja_id
            , cast(territoryid as int) as fk_territorio_id
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado