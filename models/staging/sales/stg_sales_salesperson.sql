with
    fonte as (
        select *
        from {{ source('sales', 'sales_salesperson') }}
    )

    , renomeado as (
        select
            cast(businessentityid as int) as pk_vendedor_id
            , cast(territoryid as int) as fk_territorio_id
            , cast(salesquota as decimal(18,2)) as meta_vendas
            , cast(bonus as decimal(18,2)) as valor_bonus
            , cast(commissionpct as decimal(18,4)) as percentual_comissao
            , cast(salesytd as decimal(18,2)) as valor_vendas_ano_atual
            , cast(saleslastyear as decimal(18,2)) as valor_vendas_ano_anterior
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado