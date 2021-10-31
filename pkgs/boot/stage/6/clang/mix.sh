{% extends '//dev/lang/clang/mix.sh' %}

{% block extradeps %}
# bld {{'boot/lib/linux/mix.sh' | linux}}
# bld {{'sys/framework/CoreFoundation/package.py' | darwin}}
# bld boot/lib/cxx/mix.sh
# bld boot/stage/6/cmake/mix.sh
# bld boot/stage/6/python/mix.sh
# bld boot/stage/5/env/mix.sh
{% endblock %}
