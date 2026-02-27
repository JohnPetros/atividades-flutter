# Prompt — Tela Tarefas Diárias

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Tarefas Diárias**.
This screen should simulate a practical daily task manager where the user can create tasks, define priority, mark completion status, and visualize an organized task list.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **daily tasks screen** with a polished dark theme, where the user can:

* create a new task
* add a task title
* add a task description
* choose a priority level using radio-style selection
* register the task
* visualize a list of created tasks
* identify task priority visually
* mark tasks as completed

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium productivity app look
* Material Design 3 inspired
* Clean layout with strong spacing and hierarchy
* Large bold headings
* Rounded text fields and task cards
* White titles, muted gray subtitles, soft borders
* High contrast call-to-action button
* Subtle depth and visual grouping
* Interface should feel like a real production Flutter app

## Top bar

Create a minimal top app bar with:

* back arrow icon on the left
* centered title: **Tarefas Diárias**
* vertical three-dot menu icon on the right
* dark background integrated with the overall screen
* clean spacing and balanced alignment

## Main form section

Below the app bar, create a section titled:

* **Nova Tarefa**

Then build the form with the following structure:

### Field 1 — Task name

Label:

* **Nome da Tarefa**

Input field:

* dark rounded text field
* placeholder: **Ex: Estudar Flutter**

### Field 2 — Description

Label:

* **Descrição**

Input field:

* dark rounded multiline text area
* placeholder: **Detalhes sobre o que fazer...**
* larger height than the title field

### Field 3 — Priority selection

Label:

* **Nível de Prioridade**

Create a horizontal selection row with three radio-style options:

* **Baixa**
* **Média**
* **Alta**

Visual behavior:

* options should look like segmented or outlined pill buttons
* one option may appear selected
* the inactive option can appear muted
* maintain a dark premium UI style

## Main action button

Below the priority selector, add a large pill-shaped call-to-action button:

* icon: plus
* text: **Registrar Tarefa**
* light background
* dark text
* centered and prominent
* visually easy to tap

## Task list section

Below the form, create a section header with:

* title on the left: **Minhas Tarefas**
* a small rounded badge on the right with the text: **3 Ativas**

Then display a vertical list of task cards.

## Task cards

Each task card should include:

* large dark rounded container
* checkbox on the left
* task title in bold
* short description below in muted gray
* small priority badge aligned on the right
* strong spacing and clean hierarchy

### Example tasks

1. **Finalizar Protótipo**
   Description: **Concluir as telas de navegação do app acadêmico**
   Priority badge: **Alta**
   Status: unchecked

2. **Leitura Técnica**
   Description: **Ler documentação sobre Widgets de Estado**
   Priority badge: **Média**
   Status: checked

3. **Organizar Workspace**
   Description: **Limpar a mesa e organizar os cabos**
   Priority badge: **Baixa**
   Status: unchecked

4. **Revisão de Código**
   Description: **Verificar Pull Requests pendentes no GitHub**
   Priority badge: **Alta**
   Status: unchecked

## Priority badge styling

Use subtle color coding for the priority tags:

* **Alta**: soft red or pink accent
* **Média**: neutral or slightly warm muted tone
* **Baixa**: subtle gray or low-emphasis neutral

Badges should be:

* small
* rounded
* elegant
* easy to scan visually

## Completion states

Represent completion clearly:

* checked tasks should show a filled checkbox
* completed tasks may have slightly dimmed content
* unchecked tasks should remain bright and prominent

## Floating suggestion button

At the bottom-right corner, add a floating pill-shaped action button:

* icon: lightning or AI spark symbol
* text: **Sugestão IA**
* blue background
* white text
* modern and prominent
* should feel like a smart assistant shortcut for generating task suggestions

## Layout behavior

* Vertical smartphone layout
* Scrollable screen
* Strong spacing between sections
* Consistent side margins
* Clear separation between form area and task list
* Design should look implementation-ready for Flutter

## Interaction states to represent visually

* Empty form fields ready for input
* Priority selection options
* Active primary action button
* Checked and unchecked tasks
* Multiple priority levels visible in the list
* Floating AI suggestion action available

## Design keywords

dark productivity UI, Flutter task manager screen, to-do app design, elegant dark mode, Material 3, premium mobile form, task cards, priority selector, educational Flutter exercise, polished checklist interface

## Final instruction

The final result must look like a **real Flutter daily tasks screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.

screenshot: documentation\screenshots\Tarefas Diárias.png