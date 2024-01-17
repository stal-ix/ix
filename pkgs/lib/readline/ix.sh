{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/readline/readline-8.2.tar.gz
sha:3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-001
sha:bbf97f1ec40a929edab5aa81998c1e2ef435436c597754916e6a5868f273aff7
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-002
sha:e06503822c62f7bc0d9f387d4c78c09e0ce56e53872011363c74786c7cd4c053
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-003
sha:24f587ba46b46ed2b1868ccaf9947504feba154bb8faabd4adaea63ef7e6acb0
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-004
sha:79572eeaeb82afdc6869d7ad4cba9d4f519b1218070e17fa90bbecd49bd525ac
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-005
sha:622ba387dae5c185afb4b9b20634804e5f6c1c6e5e87ebee7c35a8f065114c99
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-006
sha:c7b45ff8c0d24d81482e6e0677e81563d13c74241f7b86c4de00d239bc81f5a1
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-007
sha:5911a5b980d7900aabdbee483f86dab7056851e6400efb002776a0a4a1bab6f6
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-008
sha:a177edc9d8c9f82e8c19d0630ab351f3fd1b201d655a1ddb5d51c4cee197b26a
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-009
sha:3d9885e692e1998523fd5c61f558cecd2aafd67a07bd3bfe1d7ad5a31777a116
https://ftp.gnu.org/gnu/readline/readline-8.2-patches/readline82-010
sha:758e2ec65a0c214cfe6161f5cde3c5af4377c67d820ea01d13de3ca165f67b4c
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/readline-*
ls ${src}/readline82* | sort | while read l; do
    cat ${l} | patch -p0
done
{% endblock %}

{% block c_rename_symbol %}
xmalloc
xrealloc
{% endblock %}

{% block patch %}
sed -e 's|.*char PC.*||' -i terminal.c
{% endblock %}

{% block configure_flags %}
--with-curses
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*termcap.*||' -i ${out}/lib/pkgconfig/readline.pc
{% endblock %}

{% block env %}
export COFLAGS="--with-installed-readline=${out} --with-readline=${out} \${COFLAGS}"
{% endblock %}
