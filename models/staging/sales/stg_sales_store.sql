with
    fonte as (
        select *
        from {{ source('sales', 'sales_store') }}
    )
    
    , renomeado as (
        select
            cast(businessentityid as int) as pk_entidade_negocio_id
            , cast(name as string) as nome_loja
            , cast(salespersonid as int) as fk_vendedor_id
            -- , cast(demographics as string) as informacoes_demograficas
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado