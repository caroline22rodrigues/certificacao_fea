# Certificação FEA – Engenharia de Analytics

## Objetivo

Este projeto tem como objetivo construir uma solução analítica completa utilizando Databricks, dbt Cloud e Power BI, aplicando conceitos de Engenharia de Analytics e modelagem dimensional sobre a base de dados AdventureWorks.

---

## Arquitetura da Solução

<img width="547" height="102" alt="Diagrama sem nome-Página-2 drawio" src="https://github.com/user-attachments/assets/710910aa-e201-48a8-8373-1a6e0cb0b7f3" />


---

## Estrutura do Projeto

```text
analyses/
│
macro/
├── tests/
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
│
seeds/
│
snapshots/
│
tests/
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

## Sources

| Domínio | Tabelas |
|----------|----------|
| Sales | stg_sales_customer, stg_sales_creditcard, stg_sales_store, stg_sales_salesperson, stg_sales_salesterritory, stg_sales_salesreason, stg_sales_salesorderheader, stg_sales_salesorderdetail, stg_sales_salesorderheadersalesreason |
| Person | stg_person_person, stg_person_address, stg_person_stateprovince, stg_person_countryregion |
| Production | stg_production_product, stg_production_productsubcategory, stg_production_productcategory |
| Purchasing | stg_purchasing_shipmethod |



## Dimensões

| Dimensão | Tabelas de Origem |
|-----------|------------------|
| dim_cliente | stg_sales_customer, stg_person_person |
| dim_produto | stg_production_product, stg_production_productsubcategory, stg_production_productcategory |
| dim_endereco | stg_person_address, stg_person_stateprovince, stg_person_countryregion |
| dim_loja | stg_sales_store, stg_sales_salesterritory |
| dim_vendedor | stg_sales_salesperson, stg_person_person, stg_sales_salesterritory |
| dim_pagamento | stg_sales_creditcard |
| dim_status_pedido | stg_sales_salesorderheader |
| dim_motivo_venda | stg_sales_salesreason |
| dim_tempo | Calendário gerado via dbt |



## Bridge

| Bridge | Origem | Relaciona | Granularidade |
|----------|---------|------------|---------------|
| brg_motivo_venda | stg_sales_salesorderheadersalesreason, dim_motivo_venda | ft_pedido ↔ dim_motivo_venda | 1 linha = 1 motivo associado a 1 pedido |



## Fatos

| Fato | Origem | Dimensões Utilizadas | Granularidade |
|--------|---------|---------------------|---------------|
| ft_pedido | stg_sales_salesorderheader | dim_cliente, dim_loja, dim_vendedor, dim_pagamento, dim_status_pedido, dim_endereco, dim_tempo | 1 linha = 1 pedido |
| ft_pedido_item | stg_sales_salesorderdetail, stg_sales_salesorderheader | dim_produto, dim_cliente, dim_loja, dim_vendedor, dim_pagamento, dim_status_pedido, dim_endereco, dim_tempo | 1 linha = 1 item do pedido |

---

## Qualidade dos Dados

Foram implementados testes de qualidade utilizando dbt:

* Unique
* Not Null
* Testes customizados utilizando macros

---

## Dashboard Power BI

O dashboard desenvolvido contempla guias navegáveis com diversos filtros conforme os prints a seguir:

* Data da venda
<p align="center">
    <img width="900" alt="image" src="https://github.com/user-attachments/assets/9e4f6f70-522a-464a-920f-0714551a6e3c" />
</p>

* Produto
<p align="center">
    <img width="900" alt="image" src="https://github.com/user-attachments/assets/64d21bbe-0fbc-49e4-bdee-44b225953696" />
</p>

* Cartão
<p align="center">
    <img width="900" alt="image" src="https://github.com/user-attachments/assets/2f24dcf7-a1b7-4579-8bf6-ded135ec9ac4" />
</p>

* Motivos de Venda
<p align="center">
    <img width="900" alt="image" src="https://github.com/user-attachments/assets/7f550b36-9016-4940-909c-fe438051b640" />
</p>

* Cliente
<p align="center">
    <img width="900" alt="image" src="https://github.com/user-attachments/assets/f97a88f4-53f3-46f9-aae2-2d880ee031a0" />
</p>

* Localidades
<p align="center">
    <img width="900" alt="image" src="https://github.com/user-attachments/assets/6a5b6bf8-82fe-420c-af09-e0956f3817b6" />
</p>

* Vendedor
<p align="center">
  <img width="900" alt="image" src="https://github.com/user-attachments/assets/f0eb484d-6edb-48af-94e9-a87250cb151e" />
</p>

* Guia de filtros
<p align="center">
    <img width="900" alt="image" src="https://github.com/user-attachments/assets/256b6dc2-d9b6-4c7c-952e-cb5b1e03febb" />
</p>
  
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
