{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/15.tar.gz
{% endblock %}

{% block go_sha %}
595a8e561c439ff1b0ae28b07f06f57f43aea20658de49e684761689e826ac3d
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
