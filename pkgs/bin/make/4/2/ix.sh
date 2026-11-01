{% extends '//bin/make/ix.sh' %}

{# The JDK 9-14 build system writes its .vardeps files through $(file ...)
   with \# escapes that make 4.3 reads differently (JDK-8237879). #}

{% block pkg_name %}
make
{% endblock %}

{% block version %}
4.2.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-{{self.version().strip()}}.tar.gz
e40b8f018c1da64edd1cc9a6fce5fa63b2e707e404e20cad91fbae337c98a5b7
{% endblock %}

{% block patch %}
sed -i \
    -e 's/^my_realloc (p, n)$/my_realloc (void *p, unsigned int n)/' \
    -e '/^     char \*p;$/d' \
    -e '/^     unsigned int n;$/d' \
    glob/glob.c
{% endblock %}
