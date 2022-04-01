{% extends '//bin/meson/better/mix.sh' %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block run_deps %}
bld/python
{% endblock %}
