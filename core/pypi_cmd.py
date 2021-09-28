import json
import urllib.request as ur


TEMPLATE = '''
{% extends '//util/wheel.sh' %}

{% block url %}
{url}
{% endblock %}

{% block md5 %}
{md5}
{% endblock %}
'''


def cli_pypi_gen(ctx):
    args = ctx['args']

    for a in args:
        url = f'https://pypi.python.org/pypi/{a}/json'
        data = json.loads(ur.urlopen(url).read())

        for rec in data['urls']:
            if '.whl' in rec['url']:
                print(TEMPLATE.replace('{url}', rec['url']).replace('{md5}', rec['md5_digest']).strip())
