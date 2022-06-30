{% extends '//lib/lua/puc/5/t/ix.sh' %}

{% block fetch %}
https://www.lua.org/ftp/lua-5.1.5.tar.gz
md5:2e115fe26e435e33b0d5c022e4490567
{% endblock %}

{% block make_target %}
{{target.os}}
{% endblock %}
