{% extends '//lib/archive/lite/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s bsdtar tar
ln -s bsdcpio cpio
{% endblock %}
