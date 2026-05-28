with cartao as (

    select *
    from {{ ref('stg_sales_creditcard') }}

)

select
    pk_cartao_credito_id as pk_pagamento_id
    , 'Cartão de crédito' as tipo_pagamento
    , tipo_cartao
    , mes_expiracao
    , ano_expiracao
    , ano_mes_expiracao
    , data_modificacao
    , current_timestamp() as data_escrita_elt
from cartao