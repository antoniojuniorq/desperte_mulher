# Desperte Mulher

> **Plataforma de Análise de Risco para Vítimas de Violência Doméstica**

![Flutter](https://img.shields.io/badge/Flutter-3.44.4-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.12.2-blue?logo=dart)
![License](https://img.shields.io/badge/Licença-Acadêmica-purple)
![Platform](https://img.shields.io/badge/Plataforma-Android%20%7C%20Web-green)

---

## Sobre o Projeto

O **Desperte Mulher** é um aplicativo mobile e web desenvolvido como **Projeto Final de Curso**, baseado na plataforma [despertemulher.org](https://despertemulher.org).

O objetivo é oferecer uma **ferramenta gratuita, anônima e baseada em metodologia científica** para que mulheres em situação de violência doméstica possam avaliar seu nível de risco e acessar orientações e redes de apoio.

> _"Reconhecer que você está em risco não é fraqueza — é o ato mais corajoso que uma mulher pode fazer por si mesma."_

---

## Funcionalidades

-  **Análise de Risco** baseada no FONAR (Formulário Nacional de Avaliação de Risco — CNJ/CNMP)
-  **15 perguntas** estruturadas sobre diferentes dimensões da violência
-  **5 níveis de risco** identificados: Muito Baixo, Baixo, Moderado, Alto e Extremo
-  **Recomendações personalizadas** de acordo com o resultado
-  **100% anônimo** — nenhum dado pessoal é exigido
-  **Contatos de emergência** sempre visíveis (180, 190, Ouvidoria)
-  **Login do Acolhe** — área restrita para profissionais parceiros
-  **Cadastro de parceiros** da rede de atendimento
-  **Redesign visual completo** com identidade moderna e acolhedora

---

##  Arquitetura

O projeto segue os princípios da **Clean Architecture** com separação clara de responsabilidades:

```
lib/
├── core/                    # Configurações globais
│   ├── constants/           # Cores, tipografia, espaçamento
│   ├── errors/              # Failures e exceptions
│   ├── network/             # Cliente HTTP (Dio)
│   ├── routes/              # Navegação (go_router)
│   └── theme/               # Tema do app
│
├── domain/                  # Regras de negócio
│   ├── entities/            # Modelos puros
│   ├── repositories/        # Contratos (interfaces)
│   └── usecases/            # Casos de uso
│
├── data/                    # Implementações
│   ├── datasources/         # Fontes de dados (API, local)
│   ├── models/              # Modelos com serialização
│   └── repositories/        # Implementações dos contratos
│
├── mock/                    # Dados de teste (FONAR)
│
└── presentation/            # Interface do usuário
    ├── common/widgets/      # Componentes reutilizáveis
    ├── home/                # Tela inicial
    ├── quiz/                # Análise de risco
    ├── result/              # Resultado e recomendações
    ├── login/               # Autenticação
    ├── registration/        # Cadastro de parceiros
    └── profile/             # Perfil do profissional
```

---

## Design System

| Token | Valor | Uso |
|---|---|---|
| `primary` | `#7B2D8B` | Cor principal (roxo empoderamento) |
| `accent` | `#E91E8C` | Botões de ação (rosa vibrante) |
| `background` | `#FAF7FC` | Fundo geral |
| `riskExtreme` | `#D32F2F` | Nível extremo de risco |
| `riskVeryLow` | `#4CAF50` | Nível muito baixo de risco |

**Tipografia:**
- Display/Títulos: **Playfair Display** (elegante e marcante)
- Corpo/UI: **Inter** (legível e moderno)

---

## Dependências Principais

| Pacote | Versão | Finalidade |
|---|---|---|
| `go_router` | ^13.0.0 | Navegação declarativa |
| `flutter_riverpod` | ^2.5.1 | Gerenciamento de estado |
| `dio` | ^5.4.0 | Requisições HTTP |
| `google_fonts` | ^6.2.1 | Tipografia (Playfair + Inter) |
| `flutter_animate` | ^4.5.0 | Animações fluidas |
| `fl_chart` | ^0.67.0 | Gráficos de resultado |
| `equatable` | ^2.0.5 | Comparação de objetos |
| `dartz` | ^0.10.1 | Programação funcional (Either) |
| `shared_preferences` | ^2.2.2 | Armazenamento local |

## Metodologia — FONAR

As perguntas são baseadas no **Formulário Nacional de Avaliação de Risco (FONAR)**, estabelecido pela:

> **Resolução Conjunta n.º 5, de 03/03/2020 do CNJ e CNMP**

Com aplicação da **Metodologia de Análise de Risco Pax (AR Pax)**, desenvolvida por [Felipe Scarpelli](https://premioespiritopublico.org.br/felipe-scarpelli/) e adotada pelo Tribunal de Justiça do Estado do Tocantins.

### Níveis de Risco

| Nível | Faixa | Descrição |
|---|---|---|
| 🟢 Muito Baixo | 0–20% | Poucos indicadores identificados |
| 🟡 Baixo | 21–40% | Alguns sinais de alerta |
| 🟠 Moderado | 41–60% | Padrões de controle identificados |
| 🔴 Alto | 61–80% | Múltiplos fatores de risco |
| ⛔ Extremo | 81–100% | Risco iminente — ação imediata |

---

## Parceiros e Apoios

- Ouvidoria da Mulher do Tocantins
- Casa da Mulher Brasileira — Palmas/TO
- Secretaria de Estado da Mulher — TO
- Polícia Civil do Tocantins
- Comissão de Feminicídio
- Lions Club
- Instituto Justiça de Saia
- Justiceiras
- Faculdade Católica do Tocantins

---

## Contatos de Emergência

| Número | Serviço |
|---|---|
| **180** | Central de Atendimento à Mulher |
| **190** | Polícia Militar |
| **(63) 99282-0574** | Ouvidoria da Mulher — Tocantins |
| **(63) 3212-7496** | Casa da Mulher Brasileira — Palmas |

---

## Desenvolvedor

**Antonio Junior**
- GitHub: [@antoniojuniorq](https://github.com/antoniojuniorq)
- Projeto Final de Curso — Desenvolvimento Mobile

---

## Licença

Este projeto foi desenvolvido para fins acadêmicos.  
O conteúdo das perguntas é baseado no FONAR — documento público do CNJ/CNMP.

---

<div align="center">
  <strong>💜 Desenvolvido com propósito — porque toda mulher merece segurança</strong>
</div>
