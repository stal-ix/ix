{% extends '//lib/compiler_rt/hack/mix.sh' %}

{% block bld_libs %}
boot/7/lib/cxx/unwind
{% endblock %}

{% block lib_deps %}
{% endblock %}

{% block bld_deps %}
boot/6/env/std
{% endblock %}

{% block cpp_defines %}
__has_feature\(x\)=0
{% endblock %}

{% block cpp_includes %}
../clang/lib/Headers
{% endblock %}
