# Prompt — Tela Diário Pessoal

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Diário Pessoal**.
This screen should simulate a polished personal journal interface where the user can navigate dates in a calendar, write a diary entry for the selected day, save it, and review previous records.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **personal diary screen** with a polished dark theme, where the user can:

* navigate a monthly calendar
* identify days that contain journal entries
* select a specific date
* write a diary entry for the selected day
* save the entry
* view previous journal records for the selected period
* quickly create a new entry using a floating action button

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium journaling app feel
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded containers, rounded buttons, and soft borders
* White titles and muted gray support text
* Blue accent for the selected date and primary actions
* Subtle green indicators for dates that have entries
* Spacious layout and refined alignment
* Interface should feel like a real production Flutter app

## Top bar

Create a minimal top app bar with:

* back arrow icon on the left
* centered title: **Meu Diário**
* search icon on the right
* dark background integrated with the overall screen
* balanced spacing and clean composition

## Calendar section

Below the top bar, create a large dark calendar section.

Inside this section, include:

* month title: **Outubro 2023**
* supporting text in green: **5 entradas este mês**
* two square navigation buttons on the upper-right for previous and next period
* weekday labels in pt-BR abbreviations:

  * **Dom**
  * **Seg**
  * **Ter**
  * **Qua**
  * **Qui**
  * **Sex**
  * **Sáb**

Display one row of dates:

* **22**
* **23**
* **24**
* **25**
* **26**
* **27**
* **28**

Visual states:

* selected date: **24** inside a blue circular highlight
* small green dots under dates that contain entries, such as **22** and **26**
* remaining dates neutral

The calendar should feel clean, readable, and slightly premium.

## Selected date section

Below the calendar, create a horizontal section header with:

* title on the left: **24 de Outubro**
* a rounded blue pill button on the right with the text: **Hoje**

This should reinforce the currently selected date.

## Journal writing card

Below the selected date section, create a large dark rounded writing card.

Inside the card, add:

* placeholder text near the top-left: **Como foi seu dia?**
* an open empty writing area for multiline text
* a small row of utility icons near the bottom-left, such as:

  * emoji
  * image
  * pin
* a rounded light button near the bottom-right with the text: **Salvar Nota**

This writing card should feel calm, spacious, and comfortable for reflective writing.

## Divider

Add a subtle divider line below the journal writing area to separate current input from past content.

## Previous records section

Create a section title:

* **Registros Anteriores**

Then add a vertical list of previous journal cards.

## Previous record cards

Each record card should include:

* dark rounded rectangular container
* time label in muted gray near the top-left
* a small edit/note icon near the top-right in blue
* journal text preview in white below
* comfortable internal spacing
* clean readability for longer text

### Example records

1. Time: **09:45**
   Text: **Hoje comecei o dia com uma meditação guiada. Senti-me muito mais focado para as aulas de Flutter.**

2. Time: **14:20**
   Text: **Consegui finalizar o desafio do componente de calendário! A lógica de estados foi um pouco complexa mas valeu a pena.**

## Floating action button

At the bottom-right, add a large pill-shaped floating action button with:

* plus icon
* text: **Nova Entrada**
* blue background
* dark or high-contrast text
* premium mobile app appearance

## Layout behavior

* Vertical smartphone layout
* Scrollable content
* Spacious side margins
* Strong separation between calendar, current entry area, previous records, and floating action button
* Design should look ready for Flutter implementation

## Interaction states to represent visually

* Calendar with selected date and entry indicators
* Empty writing area ready for a new entry
* Save action available
* Multiple previous records visible
* Floating action button available for quick creation

## Design keywords

dark journal UI, Flutter diary screen, personal journal app, elegant dark mode, Material 3, premium writing interface, calendar with entry indicators, reflective note app, polished mobile diary, educational Flutter exercise

## Final instruction

The final result must look like a **real Flutter personal diary screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.

screenshot: documentation\screenshots\Diario Pessoal.png