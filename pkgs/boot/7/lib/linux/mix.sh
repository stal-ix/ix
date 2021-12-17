{% extends '//lib/linux/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block host_libs %}
boot/3/lib/c/mix.sh
{% endblock %}

{% block bld_deps %}
boot/6/env/cxx/mix.sh
{% endblock %}
