# Karios Documentation

This repository contains the official documentation for Karios, the software-defined foundation for modern IT infrastructure.

## 📋 Prerequisites

- Python 3.8 or higher
- Git

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone git@git.karios.ai:Karios/docs.git
cd karios-docs
```

### 2. Set Up Virtual Environment
```bash
# Create virtual environment
python3 -m venv .

# Activate virtual environment
# On macOS/Linux:
source bin/activate

# On Windows:
# Scripts\activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Build Documentation
```bash
cd docs
make html
```

### 5. View Documentation
```bash
# Open in your default browser
# On macOS:
open _build/html/index.html

# On Linux:
xdg-open _build/html/index.html

# On Windows:
start _build/html/index.html
```

## 📁 Project Structure

```
karios-docs/
├── bin/                    # Virtual environment binaries (ignored in git)
├── lib/                    # Virtual environment libraries (ignored in git)
├── include/                # Virtual environment includes (ignored in git)
├── pyvenv.cfg             # Virtual environment config (ignored in git)
├── requirements.txt       # Python dependencies
├── README.md             # This file
├── .gitignore            # Git ignore rules
└── docs/                 # Sphinx documentation source
    ├── conf.py           # Sphinx configuration
    ├── index.rst         # Main documentation page
    ├── Makefile          # Build automation
    ├── make.bat          # Windows build script
    ├── _build/           # Generated documentation (ignored in git)
    ├── _static/          # Static assets (CSS, images)
    ├── getting-started/  # Getting started guide
    ├── virtualization/   # Virtualization documentation
    ├── storage/          # Storage documentation
    ├── networking/       # Networking documentation
    ├── management/       # Management documentation
    ├── deployment/       # Deployment scenarios
    ├── security/         # Security and compliance
    ├── monitoring/       # Monitoring and maintenance
    ├── advanced/         # Advanced topics
    └── appendices/       # Reference materials
```

## 🛠️ Development Workflow

### Making Changes
1. Activate the virtual environment:
   ```bash
   source bin/activate
   ```

2. Edit documentation files in the `docs/` directory

3. Build and preview changes:
   ```bash
   cd docs
   make clean  # Optional: clean previous build
   make html
   ```

4. View changes in browser:
   ```bash
   open _build/html/index.html
   ```

### Adding New Pages
1. Create new `.rst` files in the appropriate section directory
2. Add the file to the relevant `index.rst` toctree
3. Rebuild documentation

### Writing reStructuredText
- **Headers**: Use `=`, `-`, `^`, `"` for different header levels
- **Links**: `\`Link text <URL>\`_`
- **Code blocks**: Use `.. code-block:: language`
- **Notes**: Use `.. note::`, `.. warning::`, `.. important::`

Example:
```rst
My Page Title
=============

This is a paragraph with **bold** and *italic* text.

Section Header
--------------

.. note::
   This is an important note.

.. code-block:: bash
   
   # This is a code example
   make html
```

## 🔧 Available Make Commands

```bash
cd docs

# Build HTML documentation
make html

# Clean build directory
make clean

# Build and open documentation
make html && open _build/html/index.html

# Check for broken links
make linkcheck

# Build PDF (requires LaTeX)
make latexpdf

# Show all available commands
make help
```

## 📦 Dependencies

The project uses these main dependencies:

- **Sphinx** - Documentation generator
- **sphinx-rtd-theme** - Read the Docs theme
- **myst-parser** - Markdown support
- **sphinx-copybutton** - Copy button for code blocks
- **sphinx-design** - Modern design elements
- **sphinxext-opengraph** - Open Graph meta tags

See `requirements.txt` for complete list with versions.

## 🚀 Deployment

### Local Development Server
For live-reloading during development:
```bash
pip install sphinx-autobuild
cd docs
sphinx-autobuild . _build/html
```
Then open http://localhost:8000

### Production Deployment
The documentation can be deployed to:

- **Amazon S3** (static website hosting)
- **GitHub Pages**
- **Read the Docs**
- **Netlify**
- Any static web hosting service

Example S3 deployment:
```bash
# Build documentation
make html

# Deploy to S3 (requires AWS CLI configured)
aws s3 sync _build/html/ s3://your-docs-bucket --delete
```

## 🎨 Customization

### Themes
To change the theme, edit `docs/conf.py`:
```python
html_theme = 'sphinx_rtd_theme'  # Current theme
# html_theme = 'furo'            # Alternative modern theme
# html_theme = 'pydata_sphinx_theme'  # Another option
```

### Styling
Custom CSS can be added to `docs/_static/css/custom.css`

### Configuration
Main configuration is in `docs/conf.py`. Key settings:
- Project information
- Extensions
- Theme options
- Path configurations

## 🐛 Troubleshooting

### Common Issues

**Virtual environment not activating:**
```bash
# Make sure you're in the right directory
pwd  # Should show /path/to/karios-docs

# Recreate virtual environment if needed
rm -rf bin lib include pyvenv.cfg
python3 -m venv .
source bin/activate
pip install -r requirements.txt
```

**Build errors:**
```bash
# Clean and rebuild
cd docs
make clean
make html
```

**Missing dependencies:**
```bash
# Reinstall requirements
pip install -r requirements.txt
```

**Permission errors on Windows:**
```bash
# Use pip with --user flag
pip install --user -r requirements.txt
```

## 📝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test the documentation builds: `make html`
5. Commit your changes: `git commit -am 'Add some feature'`
6. Push to the branch: `git push origin feature-name`
7. Submit a pull request

## 📄 License

This documentation is licensed under [LICENSE TYPE] - see the LICENSE file for details.

## 🔗 Links

- **Karios Website**: https://www.karios.ai
- **GitHub Repository**: https://github.com/karios/karios
- **Sphinx Documentation**: https://www.sphinx-doc.org/
- **reStructuredText Guide**: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html
