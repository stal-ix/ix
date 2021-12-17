{% extends '//mix/template/proxy.sh' %}

{% block lib_deps %}
lib/compiler_rt/full/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block install %}
cd ${out} && mkdir lib && cd lib
ln -s ${COMPILER_RT_PATH}/lib/*/libclang_rt.builtins* libclang_rt_builtins.a
{% endblock %}
