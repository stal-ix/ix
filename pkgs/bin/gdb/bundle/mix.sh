{% extends '//bin/gdb/t/mix.sh' %}

{% block bld_libs %}
bin/gdb/py(edit=readline)
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/python
{{super()}}
{% endblock %}

{% block configure_flags %}
--with-python=$(which python3)
{{super()}}
{% endblock %}

{% block test %}
echo 'python print("na gorshke" + " sidel korol")' | ${out}/bin/gdb | grep "na gorshke sidel korol"
{% endblock %}
