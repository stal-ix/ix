{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/dlopen/archive/9d6fe219d004106c9135c43911855405e1ab2e94.zip
b0b898caac6e5080a01a0a5f8efb11ea
{% endblock %}

{% block lib_deps %}
lib/c++/mix.sh
{% endblock %}

{% block std_env %}
env/std/1/mix.sh
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/libdl.a ${out}/lib/libdlstub.a
{% endblock %}
