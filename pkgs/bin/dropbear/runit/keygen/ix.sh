{% extends '//bin/dropbear/stock/ix.sh' %}

{% block patch %}
{{super()}}
cat dbrandom.c - << EOF | sed -e 's|void seedrandom() {|void seedrandomxxx() {|' > _
#include <err.h>
static FILE* entropyf;
void seedrandom(void) {
    if (!entropyf) {
        char* env = getenv("ENTROPY");

        if (!env) {
            err(1, "no ENTROPY");
        }

        entropyf = fopen(env, "r");
    }

    if (!entropyf) {
        err(2, "can not open entropy file for read");
    }

    if (fread(hashpool, 1, sizeof(hashpool), entropyf) != sizeof(hashpool)) {
        err(3, "insufficient data");
    }

    donerandinit = 1;
}
EOF
mv _ dbrandom.c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
cp old/dropbearkey bin/purekeygen
rm -r old share
{% endblock %}
