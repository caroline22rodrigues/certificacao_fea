with cliente as (
    select *
    from {{ ref('stg_sales_customer') }}
)
, pessoa as (
    select *
    from {{ ref('stg_person_person') }}
)
select
    cliente.pk_cliente_id
    , pessoa.nome_completo
    , pessoa.tipo_pessoa
    , pessoa.promocao_email
from cliente
left join pessoa on cliente.fk_pessoa_id = pessoa.pk_entidade_negocio_id