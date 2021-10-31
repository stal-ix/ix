{% extends '//dev/lang/python/3/10/mix.sh' %}

{% block deps %}
# bld {{'lib/linux/mix.sh' | linux}}
# bld lib/z/mix.sh
# bld env/std/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block extra_modules %}
{% endblock %}

{% block extra_tests %}
{% endblock %}

{% block patch_ffi %}
{% endblock %}

{% block fix_readline %}
{% endblock %}

{% block coflags %}
--with-ensurepip=no
{% endblock %}

{% block extra_postinstall %}
rm -rf ${out}/include
rm -rf ${out}/lib/pkgconfig
find ${out}/lib/ | grep '\.a$' | xargs rm
{% endblock %}
