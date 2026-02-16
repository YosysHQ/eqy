#!/usr/bin/env python3
project = 'YosysHQ EQY'
author = 'YosysHQ GmbH'
copyright ='2026 YosysHQ GmbH'

# select HTML theme
html_theme = 'furo-ys'
html_css_files = ['custom.css']
html_theme_options: dict[str, str] = {
    "source_repository": "https://github.com/YosysHQ/eqy/",
    "source_branch": "main",
    "source_directory": "docs/source/",
}

# These folders are copied to the documentation's HTML output
html_static_path = ['_static']

# code blocks style 
highlight_language = 'systemverilog'

# generate section labels from their heading
extensions = ['sphinx.ext.autosectionlabel']

# ensure that autosectionlabel will produce unique names
autosectionlabel_prefix_document = True
