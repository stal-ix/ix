{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.43.1.tar.gz
{% endblock %}

{% block go_sha %}
aaf033373bae37fb5bac261fec6d8fb7643e44d9b33f953eb188f82c2ffc7712
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
