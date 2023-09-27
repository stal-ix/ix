{% extends '//die/std/ix.sh' %}

{% block fetch %}
{% include '//lib/gi/repository/t/ver.sh' %}
{% endblock %}

{% block install %}
mkdir ${out}/share
cp -r m4 ${out}/share/aclocal
{% endblock %}
