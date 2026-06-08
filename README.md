# Certificação FEA – Engenharia de Analytics

## Objetivo

Este projeto tem como objetivo construir uma solução analítica completa utilizando Databricks, dbt Cloud e Power BI, aplicando conceitos de Engenharia de Analytics e modelagem dimensional sobre a base de dados AdventureWorks.

---

## Arquitetura da Solução

Fonte de Dados (AdventureWorks)
→ Databricks (Data Warehouse)
→ dbt Cloud (Transformações)
→ Power BI (Visualização)

---

## Estrutura do Projeto

```text
models/
├── staging/
│   ├── sales/
│   ├── person/
│   ├── production/
│   └── purchasing/
│
├── intermediate/
│   ├── dimensions/
│   ├── facts/
│   └── bridges/
│
└── marts/
    ├── dimensions/
    ├── facts/
    └── bridges/
```

### Camadas

**Staging**

* Padronização dos dados de origem
* Renomeação de colunas
* Tratamento inicial dos dados

**Intermediate**

* Aplicação das regras de negócio
* Construção de entidades analíticas

**Marts**

* Modelos finais para consumo analítico
* Dimensões, fatos e bridges

---

## Modelo Dimensional
<p align="center">
    <img width="900" alt="image" src="https://github.com/user-attachments/assets/6b1094a1-808c-42e0-a2fa-301fe8de700d" />
</p>

### SOURCES

* SALES
├── stg_sales_customer
├── stg_sales_creditcard
├── stg_sales_store
├── stg_sales_salesperson
├── stg_sales_salesterritory
├── stg_sales_salesreason
├── stg_sales_salesorderheader
├── stg_sales_salesorderdetail
└── stg_sales_salesorderheadersalesreason

* PERSON
├── stg_person_person
├── stg_person_address
├── stg_person_stateprovince
└── stg_person_countryregion

* PRODUCTION
├── stg_production_product
├── stg_production_productsubcategory
└── stg_production_productcategory

* PURCHASING
└── stg_purchasing_shipmethod


### DIMENSÕES

* dim_cliente
├── stg_sales_customer
└── stg_person_person

* dim_produto
├── stg_production_product
├── stg_production_productsubcategory
└── stg_production_productcategory

* dim_endereco
├── stg_person_address
├── stg_person_stateprovince
└── stg_person_countryregion

* dim_loja
├── stg_sales_store
└── stg_sales_salesterritory

* dim_vendedor
├── stg_sales_salesperson
├── stg_person_person
└── stg_sales_salesterritory

* dim_pagamento
└── stg_sales_creditcard

* dim_status_pedido
└── stg_sales_salesorderheader

* dim_motivo_venda
└── stg_sales_salesreason

* dim_tempo
└── Calendário gerado via dbt


### FATOS

* ft_pedido

Origem:
├── stg_sales_salesorderheader

Dimensões utilizadas:
├── dim_cliente
├── dim_loja
├── dim_vendedor
├── dim_pagamento
├── dim_status_pedido
├── dim_endereco
└── dim_tempo

Granularidade:
1 linha = 1 pedido


* ft_pedido_item

Origem:
├── stg_sales_salesorderdetail
└── stg_sales_salesorderheader

Dimensões utilizadas:
├── dim_produto
├── dim_cliente
├── dim_loja
├── dim_vendedor
├── dim_pagamento
├── dim_status_pedido
├── dim_endereco
└── dim_tempo

Granularidade:
1 linha = 1 item do pedido


### BRIDGE

* brg_motivo_venda

Origem:
├── stg_sales_salesorderheadersalesreason
└── dim_motivo_venda

Relaciona:
├── ft_pedido
└── dim_motivo_venda

Granularidade:
1 linha = 1 motivo associado a 1 pedido

---

## Qualidade dos Dados

Foram implementados testes de qualidade utilizando dbt:

* Unique
* Not Null
* Testes de regras de negócio
* Testes customizados utilizando macros

---

## Dashboard Power BI

O dashboard desenvolvido contempla análises de:

* Vendas
* Produtos
* Clientes
* Motivos de Venda
* Cartões de Crédito
* Localidades

---

## Tecnologias Utilizadas

* Databricks
* dbt Cloud
* Power BI
* GitHub
* SQL

---

## Autora

Caroline Rodrigues
