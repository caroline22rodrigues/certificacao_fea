
with motivo_venda as (

    select *
    from {{ ref('stg_sales_salesreason') }}

)

select
    pk_motivo_venda_id
    , nome_motivo_venda
    , tipo_motivo_venda
    , data_modificacao
    , current_timestamp() as data_escrita_elt
from motivo_venda