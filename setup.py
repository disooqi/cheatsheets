from setuptools import setup, find_packages
from os import path

this_directory = path.abspath(path.dirname(__file__))
with open(path.join(this_directory, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='A2-TLIQ',
    version='0.0.1',
    description='Arabic Language Processing of ArabAgent',
    long_description=long_description,
    long_description_content_type='text/markdown',
    url='https://mohamed.eldesouki.com/pypi/a2-tliq',
    author='Mohamed Eldesouki',
    author_email='mohamed@eldesouki.com',
    extras_require=dict(tests=['pytest']),
    packages=find_packages(where="src",
                           exclude=[
                               'docs', 'tests'
                           ]),
    package_dir={"": "src"},
    python_requires='>=3.11',
    install_requires=[
        'PyArabic',
        'python-dotenv',
        'redis'
    ],
    data_files=[
        ('bitmaps', ['bm/b1.gif', 'bm/b2.gif']),
        ('config', ['cfg/data.cfg'])
    ],
    classifiers=[
        "Development Status :: 1 - Planning",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.11",
        "Operating System :: OS Independent",
        "Topic :: Internet :: WWW/HTTP :: Dynamic Content :: Wiki"
    ]
)
