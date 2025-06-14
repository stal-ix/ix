{% extends '//lib/cffi/xkbcommon/t/ix.sh' %}

{% block bld_tool %}
bld/pip
bin/unzip
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}:\${PYTHONPATH}"
{% endblock %}
