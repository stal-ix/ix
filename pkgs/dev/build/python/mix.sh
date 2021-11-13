{% extends '//lib/python/3/10/mix.sh' %}

{% block bld_deps %}
dev/build/autoconf/2.69/mix.sh
dev/build/automake/1.16.3/mix.sh
dev/build/autoconf/archive/mix.sh
{{'lib/linux/mix.sh' | linux}}
{{'sys/framework/SystemConfiguration/mix.sh' | darwin}}
lib/z/mix.sh
env/std/0/mix.sh
{% endblock %}

{% block extra_modules %}
{% endblock %}

{% block extra_tests %}
{% endblock %}

{% block patch_ffi %}
{% endblock %}

{% block setup %}
{% endblock %}

{% block postinstall %}
{{super()}}

rm -rf ${out}/include
rm -rf ${out}/lib/pkgconfig
find ${out}/lib/ | grep '\.a$' | xargs rm
{% endblock %}
