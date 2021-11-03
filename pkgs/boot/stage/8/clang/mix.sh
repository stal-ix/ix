{% extends '//dev/lang/clang/mix.sh' %}

{% block bld_deps %}
{{'boot/lib/linux/mix.sh' | linux}}
{{'sys/framework/CoreFoundation/mix.sh' | darwin}}
boot/lib/cxx/mix.sh
boot/stage/7/cmake/mix.sh
boot/stage/7/python/mix.sh
boot/stage/6/env/std/mix.sh
{% endblock %}
