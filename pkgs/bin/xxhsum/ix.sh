{% extends '//lib/xxhash/t/ix.sh' %}

{% block test %}
make NO_C90_TEST=true test
{% endblock %}
