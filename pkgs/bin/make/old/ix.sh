{% extends '//bin/make/ix.sh' %}

{% block pkg_name %}
make
{% endblock %}

{% block version %}
4.3
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-{{self.version().strip()}}.tar.gz
e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19
{% endblock %}

{% block patch %}
sed -i \
    -e 's/^my_realloc (p, n)$/my_realloc (void *p, unsigned int n)/' \
    -e '/^     char \*p;$/d' \
    -e '/^     unsigned int n;$/d' \
    lib/glob.c
{% endblock %}
