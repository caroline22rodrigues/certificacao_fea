with
    fonte as (
        select *
        from {{ source('production', 'production_productcategory') }}
    )
    
    , renomeado as (
        select
            cast(productcategoryid as int) as pk_categoria_produto_id
            , cast(name as string) as nome_categoria_produto
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado