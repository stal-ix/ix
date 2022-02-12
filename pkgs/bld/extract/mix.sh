{% extends '//bin/bsdtar/mix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/bzip2
{% endblock %}

{% block bld_tool %}
bld/autohell
bin/auto/conf/2/69
bin/auto/make/1/16
{% endblock %}

{% block run_deps %}
bin/pv
{% endblock %}

{% block configure_flags %}
--without-xml2
--without-expat
{% endblock %}

{% block env %}
extract() (
    pv \${2} | bsdcat | bsdtar -x -f - --strip-components \${1}
)
{% endblock %}
