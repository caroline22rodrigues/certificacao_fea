with
    fonte as (
        select *
        from {{ source('person', 'person_person') }}
    )
    
    , renomeado as (
        select
            cast(businessentityid as int) as pk_entidade_negocio_id
            , cast(persontype as string) as tipo_pessoa
            , cast(namestyle as boolean) as estilo_nome
            -- , cast(title as string) as titulo
            , concat(firstname, ' ', coalesce(middlename, ''), ' ', lastname) as nome_completo
            --, cast(firstname as string) as primeiro_nome
            --, cast(middlename as string) as nome_meio
            --, cast(lastname as string) as sobrenome
            -- , cast(suffix as string) as sufixo_nome
            , cast(emailpromotion as int) as promocao_email
            -- , cast(additionalcontactinfo as string) as informacoes_contato_adicional
            -- , cast(demographics as string) as informacoes_demograficas
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado