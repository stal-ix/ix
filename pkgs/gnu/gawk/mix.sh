{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/gawk/gawk-5.1.0.tar.xz
8470c34eeecc41c1aa0c5d89e630df50
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/intl/mix.sh
lib/iconv/mix.sh
lib/sigsegv/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block bld_tool %}
boot/final/env/bison/mix.sh
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
