with
    fonte as (
        select *
        from {{ source('production', 'production_productsubcategory') }}
    )
    
    , renomeado as (
        select
            cast(productsubcategoryid as int) as pk_subcategoria_produto_id
            , cast(productcategoryid as int) as fk_categoria_produto_id
            , cast(name as string) as nome_subcategoria_produto
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado