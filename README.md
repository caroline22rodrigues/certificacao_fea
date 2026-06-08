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

### Dimensões

* dim_cliente
* dim_produto
* dim_endereco
* dim_loja
* dim_vendedor
* dim_pagamento
* dim_status_pedido
* dim_motivo_venda
* dim_tempo

### Fatos

* ft_pedido
* ft_pedido_item

### Bridge

* brg_motivo_venda

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
