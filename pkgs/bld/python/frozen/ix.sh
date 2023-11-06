{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/python
lib/py/extra
{{super()}}
{% endblock %}

{% block entry_point %}xxx{% endblock %}

{% block step_unpack %}
cat << EOF > xxx
import sys
EOF
{% endblock %}
