with
    fonte as (
        select *
        from {{ source('production', 'production_productinventory') }}
    )
    
    , renomeado as (
        select
            cast(productid as int) as pk_produto_id
            , cast(locationid as int) as fk_localizacao_id
            , cast(shelf as string) as prateleira
            , cast(bin as int) as compartimento
            , cast(quantity as int) as quantidade_estoque
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado