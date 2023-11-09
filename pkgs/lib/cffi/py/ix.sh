{% extends '//lib/cffi/t/ix.sh' %}

{% block bld_tool %}
bld/pip
{{super()}}
{% endblock %}

{% block bld_libs %}
pip/wheel
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv cffi* lib
cd lib
cp -R EGG-INFO cffi-1.16-py3.12.egg-info
py_exports > exports
cat exports
{% endblock %}

{% block env %}
{{super()}}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
