# stal/IX Documentation Style Guide

> This guide defines the temporary standard for the **stal/IX** documentation formatting on GitHub.

---

### TL;DR Markup conventions

Used in all documents:

**Headings** - created with one to six `#` (depending on size required) before heading text. `# The title of the document` (h1) is written in the first line.

**Paragraphs and line breaks** - leave a blank line between text lines for paragraphs, use `<br>` at the end of the previous line for line breaks.

**Styling text** - italic - by `*asterisks*`; bold - double `**asterisks**`; combined emphasis - `**asterisks and _underscores_**`.

**Quotes** - created with `>` before quoting text. Here is used for Prereq block markup. If there is no Prereq - quote  the document description.<br> 
Exception: if there are `> indeed quotes`, markup Prereq as a bulleted list, the document description - as a plain text in the first paragraph.

**Code and syntax highlighting** - framed by single backticks for inline `code` - \`code\`; fenced by lines with triple backticks - \`\`\` for  code blocks.<br>
Use language prefix next to the top triple backticks line for code highlighting, without whitespace - \`\`\`shell.<br>

Also used:

**Lists**: ordinary - each item on a new line, use `<br>` (for example, to list links); bulleted - use asterisks `* some text`.

**Links**: URLs will automatically get turned into links, or you can create an inline link by wrapping link text in brackets.<br>
`https://github.com/stal-ix/ix or [stal/IX](https://github.com/stal-ix/ix)` https://github.com/stal-ix/ix or [stal/IX](https://github.com/stal-ix/ix)

**Horizontal separation-line** - created by three (or more) hyphens `---`. Use it to highlight special text blocks, for example: *Exercise*. In the document’s body the block is highlighted with two separation-lines, above and below, if the block at the end of the document - with one separation-line above.

---

## stal/IX documentation

The documentation is under development, it is updated and supplemented regularly.

All **stal/IX** documentation is formatted using [Markdown](https://en.wikipedia.org/wiki/Markdown). [HTML](https://en.wikipedia.org/wiki/HTML) is permitted if there is no Markdown equivalent or special formatting is required.

**stal/IX** is written as is, with a lowercase letter, even in the title or in the beginning of a sentence, **IX** is written in capital letters, if **IX** package manager is meant. **stal/IX** is highlighted in bold.

## Overall documentation markup

A document always starts with its title. Title is located at the top, the first line. No buttons, shields, banners, quotes or other design and formatting elements are placed above it.

To place below the title:

* Shields, buttons and other elements if needed;
* Prereq;
* Document description. 

Document sections are marked with [headings](https://github.com/adouche/ix/blob/main/docs/GUIDE_2.md#headings).<br>
Special text blocks - with [horizontal rule](https://github.com/adouche/ix/blob/main/docs/GUIDE_2.md#horizontal-rule).

## Headings

Heading created with one to six `#` symbols (depending on size required) before heading text.

```Markdown
# h1 - the largest heading
## h2 
### h3
#### h4
##### h5
###### h6 - the smallest heading
```

# h1 - the largest heading
## h2 
### h3
#### h4
##### h5
###### h6 - the smallest heading

Heading `# h1` markups the document title in the first line. There can only be one h1 heading in a document.<br>
The second-level heading `# h2` highlights document sections, if any. Next, if necessary, use the other heading levels.

## Paragraphs and line breaks

Paragraph -  leave a blank line between text lines. Line breaks - use `<br>` at the end of the previous line.

*Important!* Markdown Here rules for line breaks (two whitespaces at the end of a line) are not used to avoid removing trailing whitespaces with appropriate editor settings.

## Text styling

Used bold and italic:<br> 
* italic - `*asterisks*`; 
* bold type - double `**asterisks**`; 
* combined emphasis - `**asterisks and _underscores_**`.

Required text highlightings:<br>
* *Pro tip* - `*Pro tip*` italic
* *Warning* - `*Warning*` italic
* *Important* - `*Important*` italic

## Quoting text

Use the `>` symbol before quoting text. 

```Markdown
> Quoting text
```
> Quoting text

Here we markup the Prereq block as a quote. If there are no prerequisites in the document, quote the document description.<br>
Exception: if there are indeed quotes in the upper part of the document’s text (the first two paragraphs), then markup the Prereq with a bulleted list, the document description as a plain text in the first paragraph.

## Code quoting and syntax highlighting

To inline `code` or `command output` within a sentence, use single backticks - \`code\` or \`command output\`.
To format code or scripts into distinct block, use triple backticks.<br>
Use the language prefix next to the top triple backticks line, without whitespace, for code highlighting - \`\`\`shell.

\`\`\`shell

code block

\`\`\`

```Markdown
code block
```

## Lists

**Unordered lists:**

* ordinary - each item on a new line, use line breaks `<br>` (for example, to list links);
* bulleted - markup with asterisks through a whitespace.<br>
```Markdown
* point a; 
* point b.
```

**Ordered (numbered) lists:**

Due to the fact that the documentation is under development and is regularly supplemented, we do not use numbered lists yet.

## Links

### Absolute links

URLs will automatically get turned into links, or you can create an inline link by wrapping the link text in brackets `[ ]`, and the URL in parentheses `( )`, without a whitespace.

```Markdown
https://github.com/stal-ix/ix or [IX package manager](https://github.com/stal-ix/ix)
```

https://github.com/stal-ix/ix or [IX package manager](https://github.com/stal-ix/ix)

### Relative links

The link text is wrapped in brackets, the link itself - in parentheses, without a whitespace.

```Markdown
[STALIX.md](STALIX.md)
```

[STALIX.md](STALIX.md)

A relative link is a link that is relative to the current file. Define relative links to navigate to other files in the same repository, since absolute links may not work in repository clones.

## Horizontal rule

To create a horizontal separation-line use three (or more) hyphens `---`. Horizontal rule is used to highlight special text blocks (for example, Exercise).

```Markdown
---
Exercise<br>
special text block

---
```

---
Exercise<br>
special text block

---

In the document’s body the block is highlighted with two separation-lines, above and below, if the block at the end of the document (for example, comments) - with one separation-line above. A blank line between the last text’s line of the block and the bottom separation-line is needed.  

## Ignoring Markdown formatting

To ignore Markdown formatting, use `\` before a Markdown symbol.
