{% extends '//die/python/bin.sh' %}

{% block step_unpack %}
cat << EOF > ix_python
{% include 'ix.py' %}
EOF
{% endblock %}

{% block bld_libs %}
lib/python
{% endblock %}

{% block entry_point %}ix_python{% endblock %}
