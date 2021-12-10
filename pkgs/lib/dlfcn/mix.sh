{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/pg83/dlopen/archive/24ab1d35f96ec1c963df37d9a57a22d5aee2d119.zip
e72db8e280431a37e7c09296308323b8
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
