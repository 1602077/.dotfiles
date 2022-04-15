# Cron

- Make scripts exeuctable: `chmod u+x path/to/script.sh`.
- Update crontab config: `crontab cronjobs.txt`.
- List config or edit directly with `crontab -l` and `crontab -t` respectively.

N.B To authenticate SSH requests use `keychain` and add the following to zsh profile:
```
if [ -x /usr/bin/keychain ]; then
  /usr/bin/keychain --quiet --clear $HOME/.ssh/id_rsa
fi
```
