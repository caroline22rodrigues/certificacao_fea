with
    fonte as (
        select *
        from {{ source('person', 'person_emailaddress') }}
    )
    
    , renomeado as (
        select
            cast(businessentityid as int) as fk_entidade_negocio_id
            , cast(emailaddressid as int) as pk_email_id
            , cast(emailaddress as string) as email
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado