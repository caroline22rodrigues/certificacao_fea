with
    fonte as (
        select *
        from {{ source('person', 'person_personphone') }}
    )
    
    , renomeado as (
        select
            cast(businessentityid as int) as fk_entidade_negocio_id
            , cast(phonenumber as string) as numero_telefone
            --, cast(phonenumbertypeid as int) as fk_tipo_telefone_id
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado