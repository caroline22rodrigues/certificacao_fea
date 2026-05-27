with
    fonte as (
        select *
        from {{ source('person', 'person_address') }}
    )
    
    , renomeado as (
        select
            cast(addressid as int) as pk_endereco_id
            , cast(addressline1 as string) as endereco_linha_1
            --, cast(addressline2 as string) as endereco_linha_2
            , cast(city as string) as cidade
            , cast(stateprovinceid as int) as fk_estado_provincia_id
            , cast(postalcode as string) as codigo_postal
            -- , cast(spatiallocation as string) as localizacao_espacial
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado