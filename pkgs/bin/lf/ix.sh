{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r27.tar.gz
{% endblock %}

{% block go_sum %}
sha:cdd132e33387423ef9f9448e21d3f1e5c9a5319b34fdfb53cb5f49351ebac005
{% endblock %}

{% block go_sha %}
sha:fc244cd8be5adee97cb4367e51afb784c9a96bc08e3172342b8f6264dccfed54
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}
