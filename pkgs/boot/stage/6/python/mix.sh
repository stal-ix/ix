{% extends '//dev/lang/python/3/minimal/mix.sh' %}

{% block deps %}
# bld {{'boot/lib/linux/mix.sh' | linux}}
# bld boot/lib/z/mix.sh
# bld boot/lib/compiler_rt/mix.sh
# bld boot/stage/5/env/mix.sh
{% endblock %}

{% block extra_modules %}
{% endblock %}

{% block extra_tests %}
{% endblock %}

{% block patch_ffi %}
{% endblock %}

{% block coflags %}
--with-ensurepip=no
{% endblock %}
