{% extends '//box/sbase/mix.sh' %}

{% block make_bin %}
bmake
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/2/heirloom
boot/2/bmake
boot/1/env
{% endblock %}
