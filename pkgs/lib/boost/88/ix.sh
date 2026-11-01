{% extends '//lib/boost/t/ix.sh' %}

{% block fetch %}
https://github.com/boostorg/boost/releases/download/boost-1.88.0/boost-1.88.0-b2-nodocs.tar.xz
ad9ce2c91bc0977a7adc92d51558f3b9c53596bb88246a280175ebb475da1762
{% endblock %}

{% block install %}
{{super()}}
llvm-objcopy \
    --strip-symbol=__cxa_allocate_exception \
    ${out}/lib/libboost_stacktrace_from_exception.a
{% endblock %}
