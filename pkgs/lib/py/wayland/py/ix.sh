{% extends '//lib/py/wayland/t/ix.sh' %}

{% block bld_tool %}
bld/pip
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
py_exports > exports
cat exports
{% endblock %}

{% block env %}
{{super()}}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
