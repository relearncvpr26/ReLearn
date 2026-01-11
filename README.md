# ReLearn Website Contributions

This repo contains the website for the ReLearn CVPR 2026 workshop. We use the [Pelican](https://docs.getpelican.com/en/latest/) static site generator.

## Quick start

To view the website locally:

1. Install Python 3 and Pelican (any recent Pelican 4.x works).

    `python -m pip install "pelican[markdown]"`

2. Clone the repo:
    ```bash
    git clone https://github.com/relearncvpr26/ReLearn.git
    ```

3. Build and serve locally
   ```bash
   make html
   make serve
   ```
   Or alternatively, for live-reload during edits:

    ```bash
    make devserver
    ```

## File structure

Files organized as follows:

- `pelicanconf.py`, `publishconf.py` are config files;
- `themes/relearn` contains the layout and the design of the theme;
- `themes/relearn/templates/index.html` contains the layout and content of the homepage.
- `themes/relearn/static/css/style.css` contains the style.
- `themes/relearn/static/images/` contains various images. If you add images, reference them like:

    ```
    {{ SITEURL }}/theme/images/your-image.png
    ```
- `docs/` contains the built webpages that are served by GitHub Pages. Do not manually edit anything in this folder.

To modify the website, update the files in `themes/relearn/`, then build, and then commit the files in `docs/`.
