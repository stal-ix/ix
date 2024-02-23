{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/wtfutil/wtf/archive/refs/tags/v0.41.0.tar.gz
{% endblock %}

{% block go_sha %}
e94b4b22229591462fb54d26a599a7045d6b322c10f30c43aabd6501c9f53af2
{% endblock %}

{% block go_build_flags %}
-o wtfutil
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp wtfutil ${out}/bin/
{% endblock %}
