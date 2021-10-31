{% extends '//dev/lang/python/3/minimal/package.sh' %}

{% block deps %}
# bld {{'boot/lib/linux/package.sh' | linux}}
# bld boot/lib/z/package.sh
# bld boot/lib/compiler_rt/package.sh
# bld boot/stage/5/env/package.sh
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
