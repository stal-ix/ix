{% extends '//die/cgo.sh' %}

{% block fetch %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.8.1.tar.gz
sha:3344c3f3a372f713a4384d37dce01fcce25bb0874c08ded3338ed34ab16839ad
{% endblock %}

{% block go_tags %}
nopam
noxlib
noutmp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp emptty ${out}/bin/
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|getspnam|getpwnam|' \
        -e 's|<shadow.h>|<pwd.h>|' \
        -e 's|sp_pwdp|pw_passwd|' \
        -i ${l}
done
{% endblock %}
