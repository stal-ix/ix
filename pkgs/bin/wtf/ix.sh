{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/wtfutil/wtf/archive/refs/tags/v0.41.0.tar.gz
{% endblock %}

{% block go_sha %}
0bb9bdc69cc7e7305f6dcc2167738ce30fe9f14e974811e702f58c6c1ceeda5a
{% endblock %}

{% block go_build_flags %}
-o wtfutil
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp wtfutil ${out}/bin/
{% endblock %}
