with pagamento as (
    select *
    from {{ ref('int_dim_pagamento') }}
)
select
    *
from pagamento