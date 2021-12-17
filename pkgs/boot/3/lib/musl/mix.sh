{% extends '//lib/musl/template/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block bld_deps %}
boot/3/make/mix.sh
boot/2/env/mix.sh
{% endblock %}
