{% extends '//dev/build/make/mix.sh' %}

{% block make_no_thrs %}{% endblock %}

{% block bld_libs %}
boot/3/lib/c/mix.sh
{% endblock %}

{% block bld_deps %}
boot/3/make/mix.sh
boot/2/env/mix.sh
{% endblock %}
