{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz
eeefe2e6380931a77dfa6d9350b43186
{% endblock %}

{% block bld_deps %}
lib/iconv/mix.sh
env/std/0/mix.sh
{% endblock %}

{% block patch %}
cat - gl/lib/malloc/dynarray-skeleton.c << EOF > _
#define __nonnull(x)
EOF
mv _ gl/lib/malloc/dynarray-skeleton.c
{% endblock %}
