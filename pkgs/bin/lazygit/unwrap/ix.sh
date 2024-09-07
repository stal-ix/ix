{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.44.0.tar.gz
{% endblock %}

{% block go_sha %}
05ac5c3f36ea8fc009bf30dde1e9e800e8214294d7925b7381f85fa5fc45a0ae
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
