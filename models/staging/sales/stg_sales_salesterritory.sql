with
    fonte as (
        select *
        from {{ source('sales', 'sales_salesterritory') }}
    )
    
    , renomeado as (
        select
            cast(territoryid as int) as pk_territorio_id
            , cast(name as string) as nome_territorio
            , cast(countryregioncode as string) as codigo_pais_regiao
            , cast(group as string) as grupo_territorio
            , cast(salesytd as decimal(18,2)) as valor_vendas_ano_atual
            , cast(saleslastyear as decimal(18,2)) as valor_vendas_ano_anterior
            , cast(costytd as decimal(18,2)) as valor_custo_ano_atual
            , cast(costlastyear as decimal(18,2)) as valor_custo_ano_anterior
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado