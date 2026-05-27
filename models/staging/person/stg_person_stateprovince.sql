with
    fonte as (
        select *
        from {{ source('person', 'person_stateprovince') }}
    )
    
    , renomeado as (
        select
            cast(stateprovinceid as int) as pk_estado_provincia_id
            , cast(stateprovincecode as string) as codigo_estado_provincia
            , cast(countryregioncode as string) as codigo_pais_regiao
            --, cast(isonlystateprovinceflag as boolean) as somente_estado_provincia
            , cast(name as string) as nome_estado_provincia
            , cast(territoryid as int) as fk_territorio_id
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado