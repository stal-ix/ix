{% extends '//dev/build/make/mix.sh' %}

{% block make_no_thrs %}{% endblock %}

{% block bld_libs %}
boot/3/lib/c
{% endblock %}

{% block bld_deps %}
boot/3/make
boot/2/env
{% endblock %}
