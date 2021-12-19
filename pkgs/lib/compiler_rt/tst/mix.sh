{% extends '//lib/compiler_rt/template/mix.sh' %}

{% block bld_libs %}
{{super()}}
lib/c/no_rt/mix.sh
{% endblock %}

{% block cmake_flags %}
{{super()}}
COMPILER_RT_BUILD_BUILTINS=ON
COMPILER_RT_BUILD_SANITIZERS=OFF
COMPILER_RT_BUILD_XRAY=OFF
COMPILER_RT_BUILD_LIBFUZZER=OFF
COMPILER_RT_BUILD_PROFILE=OFF
COMPILER_RT_BUILD_MEMPROF=OFF
COMPILER_RT_BUILD_XRAY_NO_PREINIT=OFF
COMPILER_RT_BUILD_ORC=OFF
COMPILER_RT_CAN_EXECUTE_TESTS=OFF
COMPILER_RT_EXTERNALIZE_DEBUGINFO=OFF
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv {{target.os}}/* ./
{% endblock %}
