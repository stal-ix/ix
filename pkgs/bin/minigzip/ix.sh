{% extends '//lib/z/adler/t/ix.sh' %}

{% block install %}
{{super()}}
mkdir ${out}/bin
cp minigzip ${out}/bin/
{% endblock %}
