with endereco as (
    select *
    from {{ ref('stg_person_address') }}
)
, estado as (
    select *
    from {{ ref('stg_person_stateprovince') }}
)
, pais as (
    select *
    from {{ ref('stg_person_countryregion') }}
)
select
    endereco.pk_endereco_id
    , endereco.endereco_linha_1
    , endereco.cidade
    , endereco.codigo_postal
    , estado.nome_estado_provincia
    , estado.codigo_estado_provincia
    , pais.nome_pais_regiao
    , pais.codigo_pais_regiao
from endereco
left join estado on endereco.fk_estado_provincia_id = estado.pk_estado_provincia_id
left join pais on estado.codigo_pais_regiao = pais.codigo_pais_regiao