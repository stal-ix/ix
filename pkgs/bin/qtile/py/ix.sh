{% extends '//bin/qtile/t/ix.sh' %}

{% block bld_tool %}
bld/pip
bin/unzip
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
unzip qtile*
rm qtile*
cp ${out}/bin/qtile libqtile/__main__.py
py_exports > exports
cat exports
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}

