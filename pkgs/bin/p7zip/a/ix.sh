{% extends '//bin/p7zip/t/ix.sh' %}

{% block make_targets %}
7za
{% endblock %}

{% block make_flags %}
{{super()}}
DEST_DIR=${out}
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/usr/local/* ${out}/
rm -r ${out}/usr
{% endblock %}
