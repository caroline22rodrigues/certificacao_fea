with
    fonte_productvendor as (
        select *
        from {{ source('purchasing', 'purchasing_productvendor') }}
    )
    
    , renomeado as (
        select
            cast(productid as int) as pk_produto_id
            , cast(businessentityid as int) as pk_fornecedor_id
            , cast(averageleadtime as int) as prazo_medio_entrega_dias
            , cast(standardprice as decimal(18,2)) as preco_padrao
            , cast(lastreceiptcost as decimal(18,2)) as custo_ultima_recebimento
            , cast(lastreceiptdate as timestamp) as data_ultimo_recebimento
            , cast(minorderqty as int) as quantidade_minima_pedido
            , cast(maxorderqty as int) as quantidade_maxima_pedido
            , cast(onorderqty as int) as quantidade_em_pedido
            , cast(unitmeasurecode as string) as codigo_unidade_medida
            , cast(modifieddate as timestamp) as data_modificacao
        from fonte_productvendor
    )

select *
from renomeado