with
    fonte_shipmethod as (
        select *
        from {{ source('purchasing', 'purchasing_shipmethod') }}
    )
    
    , renomeado as (
        select
            cast(shipmethodid as int) as pk_metodo_envio_id
            , cast(name as string) as nome_metodo_envio
            , cast(shipbase as decimal(18,2)) as valor_base_envio
            , cast(shiprate as decimal(18,2)) as taxa_envio
            --, cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte_shipmethod
    )

select *
from renomeado