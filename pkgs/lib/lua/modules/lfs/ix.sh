{% extends '//lib/lua/modules/t.sh' %}

{% block fetch %}
https://github.com/lunarmodules/luafilesystem/archive/refs/tags/v1_8_0.tar.gz
sha:16d17c788b8093f2047325343f5e9b74cccb1ea96001e45914a58bbae8932495
{% endblock %}

{% block unpack %}
{{super()}}
cd src
>fakes.lua
{% endblock %}
