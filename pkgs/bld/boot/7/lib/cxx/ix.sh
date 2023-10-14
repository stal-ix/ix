{% extends '//lib/c++/bootstrap/t/ix.sh' %}

{% block lib_deps %}
bld/boot/7/lib/cxx/rt
{% endblock %}

{% block bld_libs %}
{% if linux %}
bld/boot/7/lib/linux
{% endif %}
{% endblock %}

{% block bld_deps %}
bld/boot/6/env/std
{% endblock %}
