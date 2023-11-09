{% extends '//bin/kitty/next/t/ix.sh' %}

{% block bld_tool %}
bld/pip
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp -R kitty ${out}/lib/
cd ${out}/lib
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:${PYTHONPATH}"
{% endblock %}
