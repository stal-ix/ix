{% extends '//dev/lang/clang/package.sh' %}

{% block extradeps %}
# bld {{'boot/lib/linux/package.sh' | linux}}
# bld {{'sys/framework/CoreFoundation/package.py' | darwin}}
# bld boot/lib/cxx/package.sh
# bld boot/stage/6/cmake/package.sh
# bld boot/stage/6/python/package.sh
# bld boot/stage/5/env/package.sh
{% endblock %}
