with
    fonte_vendor as (
        select *
        from {{ source('purchasing', 'purchasing_purchaseorderheader') }}
    )
    
    , renomeado as (
        select
            cast(purchaseorderid as int) as pk_pedido_compra_id
            --, cast(revisionnumber as int) as numero_revisao
            , cast(status as int) as pedido_status_id
            , cast(employeeid as int) as fk_funcionario_id
            , cast(vendorid as int) as fk_fornecedor_id
            , cast(shipmethodid as int) as fk_metodo_envio_id
            , cast(orderdate as date) as data_pedido
            , cast(shipdate as date) as data_envio
            , cast(subtotal as decimal(18,2)) as valor_subtotal
            , cast(taxamt as decimal(18,2)) as valor_imposto
            , cast(freight as decimal(18,2)) as valor_frete
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte_vendor
    )

select *
from renomeado