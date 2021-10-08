import json


PYPI = json.loads(parent.serve('pypi.json'))


TMPL = '''
{% extends '//util/template.sh' %}

{% block fetch %}
# url {url}
# md5 {md5}
{% endblock %}

{% block deps %}
# bld env/std
# run {run}
{% endblock %}

{% block unpack %}
{% endblock %}

{% block build %}
mkdir -p ${out}/lib/python && cd ${out}/lib/python && ${untar} ${src}/*.whl
find . | grep \\.py | sed -e 's|\.\/||' -e 's|\.py$||' -e 's|/|.|g' | grep -v '__main__' | grep -v '__init__' > exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib/python:\${PYTHONPATH}"
{% endblock %}
'''


def gen_pkg(rec):
    t = TMPL

    t = t.replace('{url}', rec['url'])
    t = t.replace('{md5}', rec['md5'])
    t = t.replace('{run}', ' '.join(rec.get('run', [])))

    return t


def serve(x):
    try:
        return gen_pkg(PYPI[x])
    except KeyError:
        raise FileNotFoundError(x)
