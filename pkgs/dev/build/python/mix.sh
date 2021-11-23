{% extends '//lib/python/3/10/mix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
{{'lib/linux/mix.sh' | linux}}
{{'lib/darwin/framework/SystemConfiguration/mix.sh' | darwin}}
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2.69/mix.sh
dev/build/automake/1.16.3/mix.sh
dev/build/autoconf/archive/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block autohell_env %}
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

{% block install %}
{{super()}}

rm -rf ${out}/include
rm -rf ${out}/lib/pkgconfig
find ${out}/lib/ | grep '\.a$' | xargs rm
{% endblock %}

{% block env %}
{% endblock %}
