### install python version
`pyenv install 3.11.4`

### list
`pyenv versions`

### select version for the current shell 
`pyenv shell <version>`

### automatically select whenever you are in the current directory (or its subdirectories)
`pyenv local <version>`

### select globally for your user account
`pyenv global <version>`


## Virtual Environments (using pyenv-virtualenv)

### create virtual env based on a pyenv installed version
`pyenv virtualenv 3.11.4 envname`

### activate virtual env
`pyenv activate envname`
