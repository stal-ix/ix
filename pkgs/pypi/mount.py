PYPI = {
    'beautysh/package.sh': {
        'url': 'https://files.pythonhosted.org/packages/36/c8/23a1c06e462cb107f29d741ffd8851bf5469738d1aeb8d977d271db69b89/beautysh-6.1.0-py3-none-any.whl',
        'md5': '0edfde5715fcb643db59724c61365d0f',
        'run': ['pypi/setuptools'],
    },
}


TMPL = '''
{% extends '//util/wheel.sh' %}

{% block url %}
{url}
{% endblock %}

{% block md5 %}
{md5}
{% endblock %}

{% block wheel_deps %}
# run {run}
{% endblock %}
'''


def gen_pkg(rec):
    return TMPL.replace('{url}', rec['url']).replace('{md5}', rec['md5']).replace('{run}', ' '.join(rec['run']))


def serve(x):
    try:
        return gen_pkg(PYPI[x])
    except KeyError:
        raise FileNotFoundError(x)
