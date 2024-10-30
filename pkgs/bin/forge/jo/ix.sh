{% extends '//die/go/build.sh' %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v9.0.1.tar.gz
{% endblock %}

{% block go_sha %}
b836e1167f8e0d66777fcec8926e4342490a9791eab9554bf7d94a2ad6d35fbc
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gitea ${out}/bin/forgejo
{% endblock %}
