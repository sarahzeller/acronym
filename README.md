# acronym

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A very simple shortcode exension to use acronyms in Quarto documents. 
It allows to use the LaTeX package `acronym`, and still export the Quarto file to other formats without LaTex code.

## Usage

Acronyms need to be formatted as follows: `{{< acro acronym >}}`

They are then converted as follows:

-   LaTeX: to `\ac{acronym}`
-   all other file formats: to `acronym`

For example, `{{< acro GDP >}}` will be converted to:
-   LaTex: `\ac{GDP}`
-   all other file formats: `GDP`

A `.tex` file needs to be added to the root folder in which the acronyms are defined.
It also neeeds to be specified in the YAML-header (cf. `example.qmd`).