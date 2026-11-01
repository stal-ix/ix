{% extends '//lib/boost/t/ix.sh' %}

{% block fetch %}
https://github.com/boostorg/boost/releases/download/boost-1.89.0/boost-1.89.0-b2-nodocs.tar.xz
875cc413afa6b86922b6df3b2ad23dec4511c8a741753e57c1129e7fa753d700
{% endblock %}

{% block install %}
{{super()}}
llvm-objcopy \
    --strip-symbol=__cxa_allocate_exception \
    ${out}/lib/libboost_stacktrace_from_exception.a
{% endblock %}
