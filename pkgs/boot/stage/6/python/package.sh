{% extends '//dev/lang/python/3/minimal/package.sh' %}

{% block deps %}
# bld {{'boot/lib/linux' | linux}} boot/lib/z boot/lib/compiler_rt
# bld boot/stage/5/env
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
