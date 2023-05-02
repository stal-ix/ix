{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.40.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:9597f297a6811d300f619fff5aadab8003adbcc1566199a43886d2ea09109a65
{% endblock %}

{% block go_sha %}
sha:323ea7f6f280948bb122002e13b7356496ffa67f47715a8737b90f442f3b56de
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
