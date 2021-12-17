{% extends '//mix/template/proxy.sh' %}

{% block lib_deps %}
lib/mesa/mix.sh
{% endblock %}

{% block script_init_env %}
{{super()}}
export OPTFLAGS=
export CPPFLAGS=
export LDFLAGS=
{% endblock %}

{% block env %}
export LDFLAGS="-Wl,--whole-archive -lfullgl -Wl,--no-whole-archive \${LDFLAGS}"
{% endblock %}
