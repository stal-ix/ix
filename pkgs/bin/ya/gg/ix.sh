{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/a09345e9e07e71e32b0c1585072eb6b9ac594642.zip
{% endblock %}

{% block go_sha %}
fbad9c38edb5f2d9d7fd6b6c1ac86dae61c26b6f434573b6e45a000b4d7cd6c9
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
