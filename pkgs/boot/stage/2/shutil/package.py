def package(mix):
    return {
        'build': {
            'script': mix.files.build_py,
            'fetch': [
                {
                    'url': 'https://github.com/pg83/shutil/archive/cf434c92b54583865ce10c556c81ab51c3230141.zip',
                    'md5': 'd877127f9e043a100188dfec48f1b8a3',
                },
            ],
            'depends': [
                'boot/stage/1/env',
            ],
        },
    }
