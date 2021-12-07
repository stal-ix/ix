{% extends '//box/sbase/mix.sh' %}

{% block make_bin %}
bmake
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/2/heirloom/mix.sh
boot/2/bmake/mix.sh
boot/1/env/mix.sh
{% endblock %}
