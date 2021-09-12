{% extends '//shell/dash/template/template.sh' %}

{% block deps %}
# bld lib/intl lib/edit lib/iconv dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block conf %}
--with-libedit=yes
{% endblock %}
