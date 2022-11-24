{% extends '//bin/gettext/unwrap/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s xgettext gettext
{% endblock %}
