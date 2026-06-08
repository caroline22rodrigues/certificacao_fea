with vendedor as (
    select *
    from {{ ref('stg_sales_salesperson') }}
)
, pessoa as (
    select *
    from {{ ref('stg_person_person') }}
)
, territorio as (
    select *
    from {{ ref('stg_sales_salesterritory') }}
)
select
    vendedor.pk_vendedor_id
    , pessoa.nome_completo
    , vendedor.fk_territorio_id
    , territorio.nome_territorio
    , territorio.grupo_territorio
    , territorio.codigo_pais_regiao
    , vendedor.meta_vendas
    , vendedor.valor_bonus
    , vendedor.percentual_comissao
    , vendedor.valor_vendas_ano_atual
    , vendedor.valor_vendas_ano_anterior
    , vendedor.data_modificacao
from vendedor
left join pessoa
    on vendedor.pk_vendedor_id = pessoa.pk_entidade_negocio_id
left join territorio
    on vendedor.fk_territorio_id = territorio.pk_territorio_id