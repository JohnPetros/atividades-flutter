# Prompt — Tela Agendamento

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Agendamento de Eventos Simples**.
This screen should simulate a polished scheduling interface where the user can pick a date from a calendar, create a new event, define a time and category, and visualize a list of scheduled commitments.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design an **event scheduling screen** with a polished dark theme, where the user can:

* navigate a monthly calendar
* select a date
* create a new event
* define event title
* define event time
* choose an event category
* confirm the scheduling
* view scheduled commitments in a list
* remove commitments using a delete action

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium calendar/productivity app feel
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded cards, rounded inputs, and refined buttons
* White titles and muted gray support text
* Subtle borders and soft contrast
* Spacious layout with clean section grouping
* Interface should feel like a real production Flutter app

## Top bar

Create a minimal top app bar with:

* back arrow icon on the left
* centered title: **Agendamento**
* search icon on the right
* dark background integrated with the overall screen
* balanced spacing and clean composition

## Calendar card

Below the top bar, create a large rounded dark calendar card.

Inside the card, include:

* month title: **Novembro 2023**
* supporting text: **4 eventos este mês**
* two square navigation buttons on the upper-right for previous and next month
* weekday labels in pt-BR abbreviations:

  * **DOM**
  * **SEG**
  * **TER**
  * **QUA**
  * **QUI**
  * **SEX**
  * **SÁB**

Display a partial month grid with:

* dates from the end of the previous month and the first days of the current month
* one date visually selected with a filled light square: **1**
* another date highlighted with an outlined square: **7**

The calendar should feel modern, clean, and easy to scan.

## New event form card

Below the calendar, create another rounded dark card for creating a new event.

At the top of the card, add:

* icon: plus in a circle
* title: **Novo Evento**

Then add the following form structure:

### Field 1 — Event title

Label:

* **Título do Evento**

Input field:

* dark rounded text field
* left icon: calendar/edit
* placeholder: **Ex: Reunião de Design**

### Field 2 — Time

Label:

* **Horário**

Input field:

* dark rounded compact field
* left icon: clock
* prefilled value: **14:00**

### Field 3 — Category

Label:

* **Categoria**

Input field:

* dark rounded dropdown/select field
* selected value: **Trabalho**
* right dropdown arrow icon

Arrange the time and category fields side by side for a more polished layout.

### Primary action button

At the bottom of the card, add a large pill-shaped primary button:

* text: **Confirmar Agendamento**
* light background
* dark text
* centered and prominent

## Commitments list section

Below the form, create a section header with:

* title on the left: **Meus Compromissos**
* action text on the right: **Ver Todos**

Then create a vertical list of large dark rounded event cards.

## Event cards

Each event card should include:

* a square dark mini-panel on the left showing the event time
* time written inside the mini-panel
* small clock icon below or near the time
* event title in bold
* event date below in muted gray
* delete icon on the right in red
* generous spacing and strong visual hierarchy

### Example commitments

1. **Aula de Flutter UI**
   Time: **09:00**
   Date: **01 Nov 2023**

2. **Mentoria de Projeto**
   Time: **11:30**
   Date: **01 Nov 2023**

3. **Review com Cliente**
   Time: **16:00**
   Date: **02 Nov 2023**

## Layout behavior

* Vertical smartphone layout
* Scrollable content
* Spacious side margins
* Strong spacing between calendar, form card, section header, and commitment cards
* Clean hierarchy and implementation-ready composition for Flutter

## Interaction states to represent visually

* Calendar with selected and highlighted dates
* Form fields filled or ready for editing
* Category dropdown visible
* Primary scheduling button active
* Multiple scheduled commitments visible
* Delete actions available for each commitment

## Design keywords

dark calendar UI, Flutter scheduling screen, event planner interface, elegant dark mode, Material 3, premium mobile calendar, appointment list, productivity app design, educational Flutter exercise, polished event form

## Final instruction

The final result must look like a **real Flutter scheduling screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.

screenshot: documentation\screenshots\Agendamento de Eventos.png