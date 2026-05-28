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
    , current_timestamp() as data_escrita_elt
from fornecedor