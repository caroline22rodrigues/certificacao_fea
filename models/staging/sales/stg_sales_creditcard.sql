with
    fonte as (
        select *
        from {{ source('sales', 'sales_creditcard') }}
    )

    , renomeado as (
        select
            cast(creditcardid as int) as pk_pagamento_id
            , cast(cardtype as string) as tipo_cartao
            -- , cast(cardnumber as string) as numero_cartao
            , cast(expmonth as int) as mes_expiracao
            , cast(expyear as int) as ano_expiracao
            , concat(cast(expyear as string),'-',lpad(cast(expmonth as string), 2, '0')) as ano_mes_expiracao
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado
