{% extends '//lib/xxhash/t/ix.sh' %}

{% block test_bin %}
make NO_C90_TEST=true test
{% endblock %}
