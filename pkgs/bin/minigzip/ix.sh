{% extends '//lib/z/adler/ix.sh' %}

{% block install %}
{{super()}}
mkdir ${out}/bin
cp minigzip ${out}/bin/
{% endblock %}
