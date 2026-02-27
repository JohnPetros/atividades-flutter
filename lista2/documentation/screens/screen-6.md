# Prompt — Tela Preferências

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Configurações de Preferência**.
This screen should simulate a polished preferences/settings interface where the user can configure profile information, appearance mode, language, review the current selections, and save changes.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **preferences/settings screen** with a polished dark theme, where the user can:

* edit the username
* choose the appearance mode
* choose the app language
* review the active preferences in a summary card
* save the changes
* view app version information at the bottom

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium settings app feel
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded cards and rounded input fields
* White titles and muted gray support text
* Subtle borders and soft contrast
* Spacious layout with clear grouping of sections
* Interface should feel like a real production Flutter app

## Top bar

Create a compact top header with:

* back arrow icon on the left
* main title: **Preferências**
* subtitle below the title: **Personalize sua experiência**
* dark background integrated with the screen
* clean spacing and balanced composition

## Section 1 — User profile

Create a content section with icon and title:

* icon: user/profile outline
* title: **Perfil do Usuário**

Inside this section, add a rounded dark card containing:

### Field — Username

Label:

* **Nome de Usuário**

Input field:

* dark rounded text field
* left icon: user/avatar/profile
* prefilled value: **Dev_Flutter_BR**
* large comfortable spacing inside the container

## Section 2 — Appearance

Create another content section with icon and title:

* icon: palette or appearance symbol
* title: **Aparência**

Below it, create a large rounded dark selection card with three stacked radio-style options.

### Appearance options

1. **Modo Claro**
   Supporting text: **Ideal para ambientes bem iluminados**

2. **Modo Escuro**
   Supporting text: **Economiza bateria e reduz cansaço visual**

3. **Sistema**
   Supporting text: **Segue as configurações do dispositivo**

Each row should include:

* main label on the left
* supporting description below in muted gray
* radio button aligned on the right
* subtle divider lines between options
* elegant spacing and readable hierarchy

One option can appear selected or ready to be selected, but keep the screen visually clean and neutral.

## Section 3 — Language

Create another content section with icon and title:

* icon: globe/language
* title: **Idioma**

Below it, create another rounded dark selection card with three stacked radio-style options.

### Language options

1. **Português (Brasil)**
2. **English (US)**
3. **Español**

Each language row should include:

* label aligned to the left
* radio button aligned to the right
* subtle divider lines between rows
* strong spacing and clean structure

## Section 4 — Current summary

Create a rounded dark summary card titled:

* **Resumo Atual**

Inside the card, add a compact checklist-style summary with small icons and the following lines:

* **Usuário: Dev_Flutter_BR**
* **Tema: Modo Escuro**
* **Idioma: Português**

This card should feel informative, calm, and easy to scan.

## Primary action button

Near the bottom, add a large pill-shaped primary button:

* icon: save/floppy disk
* text: **Salvar Alterações**
* light background
* dark text
* centered and prominent
* should feel trustworthy and easy to tap

## Footer

At the bottom center, add a subtle low-emphasis text label:

* **Versão do App 1.0.4**

Use a muted gray tone so it stays visible but secondary.

## Layout behavior

* Vertical smartphone layout
* Scrollable content
* Spacious side margins
* Strong section spacing
* Clear visual grouping between profile, appearance, language, summary, and save action
* Design should look ready for Flutter implementation

## Interaction states to represent visually

* Username field filled with sample value
* Radio-style choices visible for theme and language
* Summary card reflecting the active choices
* Active save button clearly highlighted
* Version info visible but low emphasis

## Design keywords

dark settings UI, Flutter preferences screen, elegant dark mode, Material 3, premium mobile settings, radio selection card, profile settings form, polished preferences interface, educational Flutter exercise

## Final instruction

The final result must look like a **real Flutter preferences/settings screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.

screenshot: documentation\screenshots\Configurações de Preferências.png