{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r27.tar.gz
{% endblock %}

{% block go_sha %}
2824e5d65bd405d1aa21ba9d087e108f927ee7cc082aa5af3576a1859778c405
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}
