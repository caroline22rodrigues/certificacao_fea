with fornecedor as (

    select *
    from {{ ref('stg_purchasing_vendor') }}

)

select
    pk_fornecedor_id
    , nome_fornecedor
    --, classificacao_credito
    --, fornecedor_preferencial
    , ativo
from fornecedor