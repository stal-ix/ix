{% extends '//dev/lang/clang/mix.sh' %}

{% block bld_libs %}
{% if target.os == 'linux' %}
boot/7/lib/linux/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation/mix.sh
{% endif %}
boot/7/lib/cxx/mix.sh
{% endblock %}

{% block bld_deps %}
boot/7/cmake/mix.sh
boot/7/python/mix.sh
boot/6/env/std/mix.sh
{% endblock %}

{% block cmake_flags %}
{{super()}}

-DLLVM_TARGETS_TO_BUILD={{target.llvm_target}}

-DCLANG_ENABLE_STATIC_ANALYZER=OFF
-DCLANG_ENABLE_ARCMT=OFF
{% endblock %}
