
# Academic paper for Economists

This is a Quarto template for making an academic working paper that is often used in the field of Economics.

## Creating a new article (Note: This function is not yet available.)

You can use this as a template to create an article for an ASA journal. To do this, use the following command:

```
quarto use template quarto-journals/aea
```

This will install the extension and create an example qmd file and bibiography that you can use as a starting place for your article.

## Installation For Existing Document (Note: This function is not yet available.)

You may also use this format with an existing Quarto project or document. From the quarto project or document directory, run the following command to install this format:

```
quarto add quarto-journals/aea
```

## Usage (Note: This function is not yet available.)

To use the format, you can use the format names aea-pdf and aea-html. For example:

```
quarto render template.qmd --to aea-pdf
```

or in your document yaml

```
format:
  aea-pdf:
    keep-tex: true
```

You can view a preview of the rendered template at [https://github.com/hchulkim/econ-paper-template/blob/main/template.pdf](https://github.com/hchulkim/econ-paper-template/blob/main/template.pdf)

## Why use Quarto?[^1]

Quarto is an open-source scientific and technical publishing system. 

1. **Language agnostic**: Create dynamic content with Python, R, Julia, and Observable.
2. **Supports various output formats**: Publish reproducible, production quality articles, presentations, dashboards, websites, blogs, and books in HTML, PDF, MS Word, ePub, and more.
3. Write using Pandoc markdown, including equations, citations, crossrefs, figure panels, callouts, advanced layout, and more.
4. A more easier version of LyX.

[^1]: This section is cited from official Quarto website.

## How to install Quarto

Download Quarto from their website: [Get started](https://quarto.org/docs/get-started/). The also have a nice tutorial.

## Basic tips

1. Mainly use qmd file to write your paper. After writing your draft in qmd file, use the following code in the terminal to render the file into pdf, tex, html:

```{bash}
quarto render template.qmd
```

2. If you need to change the format in the title page, use the `before-body.tex` file in the `partials` folder.

3. If you need to change the latex header, use the `_include-header.tex` file in the `partials` folder.

4. For citation, use the good ol' bibtex. You can add your citation in the `bibliography.bib` file.

## Main contributors

1. [Hyoungchul Kim](https://hchulkim.github.io): Ph.D. student in Applied Economics at The Wharton School, UPenn. [Email Me](mailto:hchulkim@wharton.upenn.edu)

2. 

## Acknowledgement

1. Significant portion of the code is based on [JASA Quarto template](https://github.com/quarto-journals/jasa/tree/main). **Copyright (c) 2022 quarto-journals**

2. econ.bst file is from [Template maintained by Shiro Takeda](https://github.com/ShiroTakeda/econ-bst).
