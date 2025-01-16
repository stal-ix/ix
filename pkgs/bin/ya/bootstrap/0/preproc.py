import sys

def it():
    yield 'export B = $(B)'
    yield 'export S = $(S)'

    for l in sys.stdin.read().split('\n'):
        if l.startswith('\t') or '=-' in l:
            yield l.replace('$(B)', '$${B}').replace('$(S)', '$${S}')
        else:
            yield l

print('\n'.join(it()).strip() + '\n')
