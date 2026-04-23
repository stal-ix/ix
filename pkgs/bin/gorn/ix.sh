{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/17.tar.gz
{% endblock %}

{% block go_sha %}
83a0647cad4190f2dd9a305f9f241736b073c7666f1eea6f0837bcf3db46d7ce
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
