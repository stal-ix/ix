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

{% block env %}
{{super()}}
export NATIVE_PYTHON=${out}/bin/python3
{% endblock %}
