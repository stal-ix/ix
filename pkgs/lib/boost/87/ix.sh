{% extends '//lib/boost/t/ix.sh' %}

{% block fetch %}
https://github.com/boostorg/boost/releases/download/boost-1.87.0/boost-1.87.0-b2-nodocs.tar.xz
sha:3abd7a51118a5dd74673b25e0a3f0a4ab1752d8d618f4b8cea84a603aeecc680
{% endblock %}

{% block install %}
{{super()}}
llvm-objcopy \
    --strip-symbol=__cxa_allocate_exception \
    ${out}/lib/libboost_stacktrace_from_exception.a
{% endblock %}
