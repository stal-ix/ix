{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v1.22.3.tar.gz
{% endblock %}

{% block go_sha %}
9b69be40a1532c4be9e57b4296a32665a4104f7c9dc85dd1ff91839d4633bc99
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gitea ${out}/bin/
{% endblock %}
