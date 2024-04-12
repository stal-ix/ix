{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/drakkan/sftpgo/archive/019edf38f3a1c9b7bcd318b5ad94373ce7adeae1.zip
{% endblock %}

{% block go_sha %}
a22e542c14988d504592d733b51ef4d1e1ef7f17d9474d986a245e2d09202791
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sftpgo ${out}/bin
{% endblock %}
