{% extends '//dev/lang/python/3/minimal/mix.sh' %}

{% block bld_deps %}
{{'boot/7/lib/linux/mix.sh' | linux}}
boot/7/lib/z/mix.sh
boot/7/lib/compiler_rt/mix.sh
boot/6/env/std/mix.sh
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
