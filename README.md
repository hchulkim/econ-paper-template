
# Academic working paper template for Economists

This is a Quarto template for making an academic working paper that is often used in the field of Economics. It is named **"aea"** as it is loosely based on the paper template given by [AEA](https://www.aeaweb.org/journals/templates).

## Creating a new article

You can use this as a template to create your own working paper. To do this, run in terminal:

```
quarto use template hchulkim/econ-paper-template
```

This will install the extension in the `_extensions` subdirectory and create an example qmd file and bibiography that you can use as a starting place for your article.

## Installation for existing document

You may also use this format with an existing Quarto project or document. From the quarto project or document directory, run the following command to install this format:

```
quarto add hchulkim/econ-paper-template
```

## Usage

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
4. You can also render the Quarto document on save using the feature in VS code. Check here and go to `Render on save` section: [Render on save](https://quarto.org/docs/tools/vscode.html)
5. A more easier version of LyX.

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


<details>
  <summary><strong>Miscellaneous (Customizing template.qmd file)</strong></summary>

1. Try not to use other pdf engines than pdfLaTeX. Currently, the template is optimized for pdfLaTeX. For example, there is some issue with XeLaTeX where it would not print the \* in the latex code (which means significance).

2. If you set `blinded: true` in the yaml header, it will hide the author information in the title page. This feature is not that necessary for working papers in Economics, but still, it is there.

3. You can change the cite, link, url color in the yaml header. Currenlty, it is set to cyan. 

4. Use `title-footnote` in the yaml header to add a footnote in the title page. Similarly, use `acknowledgements` to add acknowledgements for each author.

5. Use `abstract` in the yaml header to add an abstract. Similarly for the `keywords`.

6. `author-format: horizontal` makes the author names to go horizontal. If you remove that line, author names will go vertical.

</details>

## Main contributors

1. [Hyoungchul Kim (Creator)](https://hchulkim.github.io): Ph.D. student in Applied Economics at The Wharton School, UPenn. [Email Me](mailto:hchulkim@wharton.upenn.edu)

2. [Wooyong (Tommy) Park](https://wyeconomics.github.io): Incoming predoctoral research fellow at Stanford GSB. [Email Me](mailto:tommypark822@gmail.com)

## Acknowledgement

1. Significant portion of the code is based on [JASA Quarto template](https://github.com/quarto-journals/jasa/tree/main). **Copyright (c) 2022 quarto-journals**

2. econ.bst file is from [Template maintained by Shiro Takeda](https://github.com/ShiroTakeda/econ-bst).
