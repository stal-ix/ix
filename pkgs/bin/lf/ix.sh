{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r27.tar.gz
{% endblock %}

{% block go_sha %}
sha:fc244cd8be5adee97cb4367e51afb784c9a96bc08e3172342b8f6264dccfed54
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}
