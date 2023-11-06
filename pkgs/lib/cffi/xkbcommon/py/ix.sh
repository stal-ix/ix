{% extends '//lib/cffi/xkbcommon/t/ix.sh' %}

{% block bld_libs %}
lib/cffi/py
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/pip
bin/unzip
bld/python/{{python_ver}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir lib
mv *.egg lib/
cd lib
unzip *.egg
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
