{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/xyproto/gendesk/archive/refs/tags/1.0.9.tar.gz
{% endblock %}

{% block go_sha %}
6175e5350985c864956dff6de260c8e1b4566717c6769c79b47d9e6a070d442e
{% endblock %}

{% block go_refine %}
find . -type l -delete
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gendesk ${out}/bin/
{% endblock %}
