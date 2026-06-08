with
    fonte as (
        select *
        from {{ source('sales', 'sales_salesorderheader') }}
    )
    
    , renomeado as (
        select
            cast(salesorderid as int) as pk_pedido_id
            , cast(customerid as int) as fk_cliente_id
            , cast(salespersonid as int) as fk_vendedor_id
            , cast(territoryid as int) as fk_territorio_id
            , cast(billtoaddressid as int) as fk_endereco_cobranca_id
            , cast(shiptoaddressid as int) as fk_endereco_entrega_id
            , cast(shipmethodid as int) as fk_metodo_envio_id
            , cast(creditcardid as int) as fk_pagamento_id
            , cast(status as int) as fk_status_pedido_id
            -- , cast(creditcardapprovalcode as string) as codigo_aprovacao_cartao
            -- , cast(currencyrateid as int) as fk_taxa_cambio_id
            , cast(orderdate as date) as data_pedido
            , cast(subtotal as decimal(18,2)) as valor_subtotal
            , cast(taxamt as decimal(18,2)) as valor_imposto
            , cast(freight as decimal(18,2)) as valor_frete
            , cast(totaldue as decimal(18,2)) as valor_total
            --, cast(comment as string) as comentario
            -- , cast(rowguid as string) as id_unico_linha
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte
    )

select *
from renomeado