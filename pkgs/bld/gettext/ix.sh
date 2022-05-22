{% extends '//bin/gettext/ix.sh' %}

{% block run_deps %}
bld/tar
bld/gzip
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s xgettext gettext
{% endblock %}
