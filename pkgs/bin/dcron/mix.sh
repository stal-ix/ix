{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/dubiousjim/dcron/archive/refs/tags/v4.5.tar.gz
sha:7c047194b9339b781971b000bf5512c11e856d20a14fe5323d5a1823f04c2a3f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e 's|-o root||' -e 's|-g root||' \
    -e 's|-g $(CRONTAB_GROUP)||'      \
    -e 's|.*INSTALL_DIR.*|| ' -i Makefile
{% endblock %}
