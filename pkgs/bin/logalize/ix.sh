{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/deponian/logalize/archive/refs/tags/v0.4.2.tar.gz
{% endblock %}

{% block go_sha %}
c5ca38637e92888012c0b5bbc14ee282bb34325fdacba5af6940904974320069
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp logalize ${out}/bin/
{% endblock %}
