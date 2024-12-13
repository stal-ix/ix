{% extends '//lib/boost/t/ix.sh' %}

{% block fetch %}
https://boostorg.jfrog.io/artifactory/main/release/1.87.0/source/boost_1_87_0.tar.bz2
sha:af57be25cb4c4f4b413ed692fe378affb4352ea50fbe294a11ef548f4d527d89
{% endblock %}

{% block install %}
{{super()}}
llvm-objcopy \
    --strip-symbol=__cxa_allocate_exception \
    ${out}/lib/libboost_stacktrace_from_exception.a
{% endblock %}
