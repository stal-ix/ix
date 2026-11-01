{% extends '//lib/boost/t/ix.sh' %}

{% block fetch %}
https://github.com/boostorg/boost/releases/download/boost-1.90.0/boost-1.90.0-b2-nodocs.tar.xz
9e6bee9ab529fb2b0733049692d57d10a72202af085e553539a05b4204211a6f
{% endblock %}

{% block install %}
{{super()}}
llvm-objcopy \
    --strip-symbol=__cxa_allocate_exception \
    ${out}/lib/libboost_stacktrace_from_exception.a
{% endblock %}
