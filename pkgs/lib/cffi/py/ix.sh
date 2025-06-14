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
py_exports > exports
cat exports
{% endblock %}

{% block env %}
{{super()}}
export PYTHONPATH="${out}:\${PYTHONPATH}"
{% endblock %}
