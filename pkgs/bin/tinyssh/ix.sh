{% extends '//die/c/c_std.sh' %}

{# broken build #}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/20220801.tar.gz
sha:234656fc8d369608eb5d0f3a26280e0e38e2e6b134cfc610b6e24bce176acd4f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure %}
echo "${out}/bin" > conf-bin
echo "${out}/doc" > conf-man
{% endblock %}

{% block build %}
sh -e ./make-tinyssh.sh
{% endblock %}

{% block install %}
sh -e ./make-install.sh
{% endblock %}
