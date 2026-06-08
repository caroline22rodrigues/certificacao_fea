with pagamento as (

    select *
    from {{ ref('stg_sales_creditcard') }}

)

select
    pk_pagamento_id
    , tipo_cartao
    , data_modificacao
from pagamento