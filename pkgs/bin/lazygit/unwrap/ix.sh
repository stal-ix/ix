{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/jesseduffield/lazygit/archive/refs/tags/v0.40.2.tar.gz
{% endblock %}

{% block go_sha %}
da5f703b48def36788665ab9ff33ce7015807e2e936911f66d02702e1c18b4d4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lazygit ${out}/bin/
{% endblock %}
