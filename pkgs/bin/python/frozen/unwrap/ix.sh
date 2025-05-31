{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/python
lib/py/extra
{{super()}}
{% endblock %}

{% block entry_point %}python3{% endblock %}

{% block step_unpack %}
cat << EOF > python3
{% include 'py.py' %}
EOF
{% endblock %}

{% block install %}
{{super()}}
{% if py_binary_name %}
mv ${out}/bin/python3 ${out}/bin/{{py_binary_name}}
{% endif %}
{% endblock %}
