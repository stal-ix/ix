{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v2.4.4.tar.gz
sha:fe8b3e32b293697b55f85344ce124a305cf513eca8bfffd43b1b5894ba343d76
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
