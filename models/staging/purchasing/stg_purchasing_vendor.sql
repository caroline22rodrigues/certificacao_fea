with
    fonte_vendor as (
        select *
        from {{ source('purchasing', 'purchasing_vendor') }}
    )
    
    , renomeado as (
        select
            cast(businessentityid as int) as pk_fornecedor_id
            , cast(accountnumber as string) as numero_conta
            , cast(name as string) as nome_fornecedor
            --, cast(creditrating as int) as classificacao_credito
            --, cast(preferredvendorstatus as boolean) as fornecedor_preferencial
            , cast(activeflag as boolean) as ativo
            --, cast(purchasingwebserviceurl as string) as url_servico_compras
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte_vendor
    )

select *
from renomeado