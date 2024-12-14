import sys

def preproc(l):
    yield 'cd $(B)'
    yield 'llvm-ar qL ' + l[65:].replace('$(B)/', '')

def it():
    for l in sys.stdin.read().split('\n'):
        if 'link_lib' in l and 'musl.a' in l:
            for x in preproc(l):
                yield '\t' + x
        else:
            yield l

print('\n'.join(it()).strip() + '\n')
