{% extends '//dev/lang/python/3/10/package.sh' %}

{% block deps %}
# bld {{'lib/linux/package.sh' | linux}}
# bld lib/z/package.sh
# bld env/std/package.sh
# bld boot/final/env/tools/package.sh
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
