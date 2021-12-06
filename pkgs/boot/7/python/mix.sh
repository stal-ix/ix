{% extends '//dev/build/python/mix.sh' %}

{% block bld_libs %}
{% if target.os == 'linux' %}
boot/7/lib/linux/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/SystemConfiguration/mix.sh
{% endif %}
boot/7/lib/z/mix.sh
boot/7/lib/compiler_rt/mix.sh
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block autoreconf %}
{% endblock %}
