# Note: there is a better version of this: [gitallup](https://github.com/gerdreiss/gitallup)

# gitup

gitup invokes 'git pull' in all subdirectories of the directory passed as a parameter, e.g.:

```bash
gitup .
```
or
```bash
gitup /home/devuser/projects
```

when no parameter is given, the subdirectories of the current directory are updated, if git repositories
