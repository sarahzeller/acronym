# acronym

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simple shortcode exension to use acronyms in Quarto documents. 
It allows to use the LaTeX package `acronym`, and still export the Quarto file to other formats without LaTex code.

## Installation

`$ quarto install extension szeller42/acronym`

This will install the extension into the `_extensions` subdirectory.
When using version control, it makes sense to check in this subdirectory.
Please also install and use the LaTeX package `acronym`.

## Usage

There are 2 major functionalities: using acronyms, and defining them for a list of acronyms.

### Using acronyms

Acronyms need to be formatted as follows: `{{< acro acronym >}}`

They are then converted as follows:

-   LaTeX: to `\ac{acronym}`
-   all other file formats: to `acronym`

For example, `{{< acro GDP >}}` will be converted to:
-   LaTex: `\ac{GDP}`
-   all other file formats: `GDP`

Additionally, you need to specify a list of acronyms.

### List of acronyms

You can either use a `.tex` or a `.qmd` file to define the acronyms.
Only the `.qmd` file will also generate a list of acronyms in formats other than LaTeX.
Either file needs to be added to the root folder in which the acronyms are defined.

#### LaTeX

If you use a  `.tex` file, it needs to be formatted like the `list-of-acronyms.tex` file in this repo.
It also needs to be specified in the YAML-header (cf. `example.qmd`).

#### Quarto

If you use a `.qmd` file, it needs to be formatted like the `list-of-acronyms.qmd` file in this repo.
If you want to specify something as a symbol, you need to add `symbol` to the end of the `acrodef`.
The format looks like this:

```
{{< acrosection begin >}}

{{< acrodef GDP 'gross domestic product' >}}
{{< acrodef h 'household' symbol >}}

{{< acrosection end >}}
```
