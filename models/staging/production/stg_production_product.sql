with
    fonte as (
        select *
        from {{ source('production', 'production_product') }}
    )
    
    , renomeado as (
        select
        cast(productid as int) as pk_produto_id
        , cast(listprice as decimal(18,2)) as preco_lista
        , cast(name as string) nome_produto
        , cast(size as string) as tamanho_produto
        -- , cast(sizeunitmeasurecode as string) as codigo_unidade_tamanho
        -- , cast(weightunitmeasurecode as string) as codigo_unidade_peso
        , cast(weight as decimal(18,2)) as peso_produto
        , cast(daystomanufacture as int) as dias_para_fabricacao
        -- , cast(productline as string) as linha_produto
        -- , cast(class as string) as classe_produto
        -- , cast(style as string) as estilo_produto
        , cast(productsubcategoryid as int) as fk_subcategoria_produto_id
        -- , cast(productmodelid as int) as fk_modelo_produto
        , cast(sellstartdate as date) as data_inicio_venda
        -- , cast(sellenddate as date) as data_fim_venda
        --, discontinueddate  as data_descontinuacao
        -- , cast(rowguid as string) as id_unico_linha
        , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado