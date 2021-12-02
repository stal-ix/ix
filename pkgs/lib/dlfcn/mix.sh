{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/dlopen/archive/983a284dac2254b1a73f6d2b968ac140e0afce7a.zip
bc2b99fa7edefcc4843b246529915aec
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
