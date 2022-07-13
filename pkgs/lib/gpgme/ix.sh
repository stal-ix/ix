{% extends '//die/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.17.1.tar.bz2
sha:711eabf5dd661b9b04be9edc9ace2a7bc031f6bd9d37a768d02d0efdef108f5f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/assuan
lib/gpg/error
{% endblock %}

{% block bld_tool %}
bin/gnupg
bld/texinfo
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|-lstdc++||g' -i ${l}
done
{% endblock %}
