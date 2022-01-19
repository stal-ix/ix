{% extends '//lib/archive/mix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/bzip2
{% endblock %}

{% block run_deps %}
bin/pv
{% endblock %}

{% block env %}
extract() (
    pv \${2} | bsdcat | bsdtar -x -f - --strip-components \${1}
)
{% endblock %}
