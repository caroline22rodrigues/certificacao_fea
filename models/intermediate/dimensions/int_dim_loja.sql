with loja as (
    select *
    from {{ ref('stg_sales_store') }}
)
, vendedor as (
    select *
    from {{ ref('int_dim_vendedor') }}
)
select
    loja.pk_loja_id
    , loja.nome_loja
    , loja.fk_vendedor_id
    , vendedor.nome_completo as nome_vendedor
    , vendedor.fk_territorio_id
    , vendedor.nome_territorio
    , vendedor.grupo_territorio
    , vendedor.codigo_pais_regiao
    , loja.data_modificacao
from loja
left join vendedor
    on loja.fk_vendedor_id = vendedor.pk_vendedor_id