with
    fonte as (
        select *
        from {{ source('production', 'production_location') }}
    )
    
    , renomeado as (
        select
            cast(locationid as int) as pk_localizacao_id
            , cast(name as string) as nome_localizacao
            , cast(costrate as decimal(18,2)) as taxa_custo
            , cast(availability as decimal(18,2)) as disponibilidade
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado