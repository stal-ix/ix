import json


PYPI = json.loads(parent.serve('pypi.json'))


TMPL = r'''
{% extends '//die/std/ix.sh' %}

{% block fetch %}
{url}
md5:{md5}
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
py_exports > exports
fix_dist
cat exports
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
    t = t.replace('{md5}', rec['md5'])
    t = t.replace('{run}', '\n'.join(x + '/ix.sh' for x in rec.get('run', [])))

    return t


def serve(x):
    try:
        return gen_pkg(PYPI[x.replace('/t/ix.sh', '/ix.sh')])
    except KeyError:
        raise FileNotFoundError(x)
