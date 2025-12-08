from setuptools import setup, find_packages

setup(
    name="projectfactory",
    version="1.0.0",
    author="LovchikovMark",
    author_email="lovchikovmmark@gmail.com",
    description="Tool for automating project structure creation",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/LovchikovMark/ProjectFactory",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.8",
    install_requires=[
        "typer>=0.9.0",
        "pydantic>=2.0.0"
    ],
    entry_points={
        "console_scripts": [
            "projectfactory=main:app",
            "pf=main:app",
        ],
    },
)