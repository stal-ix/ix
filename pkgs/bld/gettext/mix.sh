{% extends '//bin/gettext/mix.sh' %}

{% block run_deps %}
bld/tar
bld/gzip
{% endblock %}

{% block bld_tool %}
bld/gzip
bin/bison/3/6
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s xgettext gettext
{% endblock %}
