with produto as (
    select *
    from {{ ref('stg_production_product') }}
)
, subcategoria as (
    select *
    from {{ ref('stg_production_productsubcategory') }}
)
, categoria as (
    select *
    from {{ ref('stg_production_productcategory') }}
)
select
    produto.pk_produto_id
    , produto.nome_produto
    , produto.preco_lista
    , produto.tamanho_produto
    , produto.peso_produto
    , produto.dias_para_fabricacao
    , produto.data_inicio_venda
    , subcategoria.nome_subcategoria_produto
    , categoria.nome_categoria_produto
    , current_timestamp() as data_escrita_elt
from produto
left join subcategoria on produto.fk_subcategoria_produto_id = subcategoria.pk_subcategoria_produto_id
left join categoria on subcategoria.fk_categoria_produto_id = categoria.pk_categoria_produto_id