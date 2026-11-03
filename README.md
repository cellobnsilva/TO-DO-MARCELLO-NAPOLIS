# Pauta do Marcello

Dois painéis independentes, no mesmo repositório:

| Painel | Fonte | Versão standalone |
|---|---|---|
| **Pauta** (afazeres) | `src/pauta.html` | `index.html` |
| **Pauta Comitê** (programação de casos para comitê) | `src/pauta-comite.html` | `comite.html` |

`scripts/build.sh` regenera as duas versões standalone.

## Pauta (afazeres)

Gestor de afazeres com duas categorias (**Pessoal** e **Invista**), subcategorias editáveis, data de criação automática, vencimento em notação D+n, recorrência, follow-ups ("aguardando terceiros"), checklist e placar de entregas.

- **Versão principal (nuvem, privada):** artefato no claude.ai, com dados salvos no banco do artefato (só o dono lê e escreve).
- **Versão offline:** abra `index.html` no navegador (ou publique via GitHub Pages). Nesse modo os dados ficam no `localStorage` do navegador; use *Exportar JSON* para backup.

## Estrutura

| Arquivo | Função |
|---|---|
| `src/pauta.html` | Fonte do app (formato de artefato: sem `<html>`/`<head>`). |
| `index.html` | Documento completo gerado a partir da fonte. |
| `scripts/build.sh` | Regenera `index.html`. Rode após editar `src/pauta.html`. |

## Entrada rápida

| Sintaxe | Efeito |
|---|---|
| `/juridico` | Subcategoria (pelo começo do nome); define a categoria junto |
| `#pessoal` `#invista` | Categoria |
| `!1` a `!4` | Prioridade (crítica a baixa) |
| `hoje` `amanhã` `sex` `15/11` `+3d` `+2s` `+1m` | Vencimento |
| `14h` `9h30` `16:45` | Horário |
| `@pessoa` | Status "aguardando terceiros", com quem |
| `*diario` `*uteis` `*semanal` `*mensal` `*anual` | Repetição |
| `#tag` | Etiqueta livre |

Exemplo: `Cobrar minuta do acordo @escritório /recup sex 11h !2`

## Modelo de dados (coleção `tasks`)

`title, notes, cat (pessoal|invista), sub, priority (1-4), status (todo|doing|waiting|done), createdAt, updatedAt, due (AAAA-MM-DD), dueTime (HH:MM), doneAt, waitingOn, estimate (min), tags[], checklist[{id,text,done}], recur (none|daily|weekdays|weekly|monthly|yearly), link`.

Subcategorias ficam em `config/main`. Datas calculadas no fuso America/Sao_Paulo.

## Pauta Comitê

Quadro com três horizontes (**essa semana**, **semana que vem**, **daqui 15 dias**), mais *A programar* e *Mais adiante*. Cada caso guarda a semana do comitê (segunda-feira da semana), então as colunas avançam sozinhas toda segunda. O dia do comitê é configurável (padrão: quinta).

Por caso: objetivo (aprovação, informativo, acompanhamento, ratificação), tipo, quem apresenta, tempo de pauta, face e proposta em R$ MM (deságio calculado), taxa/prazo, credores, checklist de preparo, notas, link, decisão (aprovado, com ressalvas, diligência adicional, reprovado) e contagem de adiamentos. Casos que passam da semana sem decisão aparecem num alerta. "Copiar pauta" gera o texto da semana para e-mail ou WhatsApp.

Coleções: `cases` e `config/main` (`day`: 0 a 6).
