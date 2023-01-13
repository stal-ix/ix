{% extends '//die/python/bin.sh' %}

{% block step_unpack %}
cat << EOF > semver
{% include 'sv.py' %}
EOF
{% endblock %}

{% block entry_point %}semver{% endblock %}
