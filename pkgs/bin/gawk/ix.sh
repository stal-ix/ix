{% extends '//die/autohell.sh' %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/gawk/gawk-5.1.0.tar.xz
sha:cf5fea4ac5665fd5171af4716baab2effc76306a9572988d5ba1078f196382bd
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block c_rename_symbol %}
err
regcomp
regfree
xmalloc
xrealloc
{% endblock %}

{% block configure_flags %}
--disable-extensions
{% endblock %}

{% block test_bin %}
export PATH="${out}/bin:${PATH}"
cd test
make basic
{% endblock %}
