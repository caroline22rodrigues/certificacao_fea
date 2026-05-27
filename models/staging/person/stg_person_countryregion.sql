with
    fonte as (
        select *
        from {{ source('person', 'person_countryregion') }}
    )
    
    , renomeado as (
        select
            cast(countryregioncode as string) as codigo_pais_regiao
            , cast(name as string) as nome_pais_regiao
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado