# Pauta do Marcello

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
