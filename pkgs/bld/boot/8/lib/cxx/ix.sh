{% extends '//lib/c++/bootstrap/t/ix.sh' %}

{% block lib_deps %}
bld/boot/8/lib/cxx/rt
{% endblock %}

{% block bld_libs %}
{% if linux %}
bld/boot/8/lib/linux
{% endif %}
{% endblock %}

{% block bld_deps %}
bld/boot/5/patch
bld/boot/7/env/std
{% endblock %}
