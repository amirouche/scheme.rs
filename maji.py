#!/usr/bin/env python
import logging
import os
import sys
from pathlib import Path

from datetime import datetime
from datetime import timezone
from lxml.html import fromstring as string2html
from feedgen.feed import FeedGenerator

from jinja2 import Environment
from jinja2 import FileSystemLoader

import mistune
from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import html
from loguru import logger as log



class HighlightRenderer(mistune.Renderer):
    def block_code(self, code, lang):
        if not lang:
            out = '\n<div><pre>{}</pre></div>\n'
            return out.format(mistune.escape(code.strip()))
        lexer = get_lexer_by_name(lang, stripall=True)
        formatter = html.HtmlFormatter()
        return highlight(code, lexer, formatter)


renderer = HighlightRenderer()
markdown = mistune.Markdown(renderer=renderer)


def jinja(template, templates, **context):
    templates = os.path.abspath(templates)
    env = Environment(loader=FileSystemLoader((templates,)))
    template = env.get_template(template)
    out = template.render(**context)
    return out


# make

def make_post(base, path):
    log.info('make post: {}', path)
    with path.open('r') as f:
        source = f.read()
    output = markdown(source)
    output = '<div>{}</div>'.format(output)
    permalink = "{}{}/".format(base, path.parent)
    log.debug('permalink is {}', permalink)

    post = {
        'output': output,
    }
    log.debug('rendering blog post')
    content = jinja('index.jinja2', os.getcwd(), base=base, **post)
    output = path.parent / 'index.html'
    with output.open('w') as f:
        f.write(content)
    log.debug('wrote: {}', output)
    return post


def make(root, base):
    root = Path(root)
    log.info('getting started at: {}', root)
    paths = root.rglob('*index.md')
    for path in paths:
        make_post(base, path)
    content = jinja('404.jinja2', os.getcwd(), base=base)
    output = root / '404.html'
    with output.open('w') as f:
        f.write(content)


def main():
    base = sys.argv[1]
    make('.', base)


if __name__ == '__main__':
    main()
