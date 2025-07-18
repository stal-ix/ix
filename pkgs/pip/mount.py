import json


PYPI = json.loads(parent.serve('pypi.json'))


TMPL = r'''
{% extends '//die/std/ix.sh' %}

{% block fetch %}
{url}
{sha}
{% endblock %}

{% block bld_tool %}
bld/pip
bld/python
{% endblock %}

{% block run_deps %}
{run}
{% endblock %}

{% block lib_deps %}
{run}
{% endblock %}

{% block unpack %}
mkdir -p ${out}/lib
cd ${out}/lib
extract0 ${src}/*.whl
{% endblock %}

{% block build %}
{% if lib %}
py_exports > exports
cat exports
{% endif %}
fix_dist
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
'''


def gen_pkg(rec):
    t = TMPL

    t = t.replace('{url}', rec['url'])
    t = t.replace('{sha}', rec['sha'])
    t = t.replace('{run}', '\n'.join(x + '/ix.sh' for x in rec.get('run', [])))

    return t


def serve_str(x):
    try:
        return gen_pkg(PYPI[x.replace('/t/ix.sh', '/ix.sh')])
    except KeyError:
        raise FileNotFoundError(x)


def serve(x):
    return serve_str(x).encode()
