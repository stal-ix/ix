{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://invisible-mirror.net/archives/mawk/mawk-1.3.4-20200120.tgz
# md5 d48752f402d7371d9eb5f68de3da05d4
{% endblock %}

{% block deps %}
# bld lib/readline/package.sh
# bld dev/lang/byacc/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}
