{% extends '//dev/lang/python/3/minimal/mix.sh' %}

{% block bld_deps %}
{{'boot/stage/7/lib/linux/mix.sh' | linux}}
boot/stage/7/lib/z/mix.sh
boot/stage/7/lib/compiler_rt/mix.sh
boot/stage/6/env/std/mix.sh
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
