# Prompt — Tela Formulário de Feedback

Create a **mobile UI screen** for a Flutter educational app called **Flutter Lab**, representing the exercise **Formulário de Feedback**.
This screen should simulate a polished user feedback form where the user can enter personal information, rate their experience using radio options, write additional comments, and submit the form.

## Language requirement

**All visible text in the interface must be in Brazilian Portuguese (pt-BR).**

## Screen purpose

Design a **feedback form screen** with a polished dark theme, where the user can:

* enter full name
* enter email
* evaluate the experience using radio-style options
* add multiline written comments
* submit feedback
* read a privacy or educational notice at the bottom

## Visual style

* Dark mode interface
* Modern, elegant, minimalistic mobile UI
* Premium form experience
* Material Design 3 inspired
* Strong typography hierarchy
* Rounded input fields and rounded cards
* White titles and muted gray supporting text
* Subtle borders and clean spacing
* Refined contrast between sections
* Interface should feel like a real production Flutter app

## Top bar

Create a compact top header with:

* back arrow icon on the left
* main title: **Feedback do Usuário**
* subtitle below the title: **Exercício 05 • Formulário**
* dark background integrated with the overall screen
* clean spacing and balanced composition

## Section 1 — Personal information

Create a content section with icon and title:

* icon: user/profile outline
* title: **Suas Informações**

Inside this section, add:

### Field 1 — Full name

Label:

* **Nome Completo**

Input field:

* dark rounded text field
* left icon: user/profile
* placeholder: **Ex: João Silva**

### Field 2 — Email

Label:

* **E-mail**

Input field:

* dark rounded text field
* left icon: email/envelope
* placeholder: **[joao@exemplo.com.br](mailto:joao@exemplo.com.br)**

Add strong vertical spacing between fields and a subtle divider before the next section.

## Section 2 — Experience rating

Create another content section with icon and title:

* icon: star outline
* title: **Como foi sua experiência?**

Below this title, create a vertical list of radio-style feedback options.

Each option should appear as a large rounded dark card with:

* radio button on the left
* main label in bold
* supporting description below in muted gray
* generous padding
* one option can appear visually highlighted with a subtle white border

### Rating options

1. **Excelente**
   Supporting text: **Superou todas as expectativas**

2. **Bom**
   Supporting text: **Atendeu bem às necessidades**

3. **Regular**
   Supporting text: **Poderia ser melhor em alguns pontos**

4. **Ruim**
   Supporting text: **Não tive uma boa experiência**

Use a visually clean radio selection system with premium spacing and readability.

## Section 3 — Additional comments

Create another section with icon and title:

* icon: message/comment outline
* title: **Comentários Adicionais**

Inside this section, add:

### Field — Message

Label:

* **Mensagem**

Input field:

* dark rounded multiline text area
* large comfortable height
* placeholder: **Conte-nos mais detalhes sobre sua experiência...**

## Primary action button

Near the bottom, add a large pill-shaped primary button:

* icon: send arrow
* text: **Enviar Feedback**
* light background
* dark text
* centered and prominent
* should feel easy to tap and visually important

## Bottom informational notice

Below the main button, add a rounded light info box with:

* small information icon on the left
* text: **Seus dados estão protegidos e serão usados apenas para fins educacionais.**
* dark text inside the light box
* soft, trustworthy visual style

## Layout behavior

* Vertical smartphone layout
* Scrollable screen
* Spacious side margins
* Strong separation between sections
* Clear hierarchy between header, form fields, radio list, comments area, action button, and info box
* Design should look ready for Flutter implementation

## Interaction states to represent visually

* Empty name and email fields ready for typing
* Radio options visible and tappable
* One feedback option subtly highlighted
* Empty multiline comments field
* Active submit button
* Informational privacy notice visible at the bottom

## Design keywords

dark feedback form UI, Flutter mobile form screen, elegant dark mode, Material 3, premium survey interface, radio card selection, polished input fields, educational Flutter exercise, modern mobile feedback app

## Final instruction

The final result must look like a **real Flutter feedback form screen**, polished and modern, with **all visible text written in pt-BR** and visual consistency with the rest of the app.

screenshot: documentation\screenshots\Formulário de Feedback.png