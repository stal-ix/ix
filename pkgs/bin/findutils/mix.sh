{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz
eeefe2e6380931a77dfa6d9350b43186
{% endblock %}

{% block bld_libs %}
lib/c
lib/iconv
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block patch %}
cd gl/lib/malloc

cat - dynarray-skeleton.c << EOF > _
#define __nonnull(x)
EOF

mv _ dynarray-skeleton.c
{% endblock %}
