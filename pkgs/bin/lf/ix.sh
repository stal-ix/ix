{% extends '//die/go/build.sh' %}

{% block pkg_name %}
lf
{% endblock %}

{% block version %}
41
{% endblock %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
85a091ac7b694bd43c0b2aeacaebb80a1edb940c5766d90a58aeceb99e027d65
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_bins %}
lf
{% endblock %}
