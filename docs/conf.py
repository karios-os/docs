import os
import sys

# -- Project information -----------------------------------------------------
project = 'Karios'
copyright = '2024, Karios Team'
author = 'Karios Team'
release = '1.0'
version = '1.0.0'

# -- General configuration ---------------------------------------------------
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.napoleon',
    'sphinx.ext.intersphinx',
    'sphinx.ext.extlinks',
    'myst_parser',
    'sphinx_copybutton',
    'sphinx_design',
    'sphinxext.opengraph',
]

# Support for Markdown files
source_suffix = {
    '.rst': None,
    '.md': 'myst_parser',
}

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# -- Options for HTML output -------------------------------------------------
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
html_favicon = '_static/karios.png'
html_css_files = ['css/custom.css']

# Theme options
html_theme_options = {
    'analytics_id': '',  # Add your Google Analytics ID
    'analytics_anonymize_ip': False,
    'logo_only': False,
    #'display_version': True,
    'prev_next_buttons_location': 'bottom',
    'style_external_links': False,
    'vcs_pageview_mode': '',
    'style_nav_header_background': '#2c3e50',
    'collapse_navigation': False,
    'sticky_navigation': True,
    'navigation_depth': 4,
    'includehidden': True,
    'titles_only': False
}

# Logo and favicon
#html_logo = '_static/images/logo.png'
#html_favicon = '_static/images/favicon.ico'

# Additional options
html_title = 'Karios'
html_short_title = 'Karios'
html_show_sourcelink = False
html_show_sphinx = False
html_show_copyright = True

# -- Extension configuration -------------------------------------------------

# OpenGraph configuration
ogp_site_url = 'https://docs.karios.ai/'
ogp_site_name = 'Karios Documentation'
ogp_image = '_static/images/og-image.png'

# External links
extlinks = {
    'issue': ('https://github.com/karios/karios/issues/%s', 'issue #%s'),
    'pr': ('https://github.com/karios/karios/pull/%s', 'PR #%s'),
}

# Intersphinx mapping
intersphinx_mapping = {
    'python': ('https://docs.python.org/3/', None),
}
extensions = [
    # your other extensions
    #'sphinxcontrib.spelling',
]

# Spelling configuration
spelling_lang = 'en_US'
spelling_word_list_filename = 'spelling_wordlist.txt'
spelling_show_suggestions = True
