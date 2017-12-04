### Secret Santa Assignment Sender

This application randomizes Secret Santa assignments and emails everyone in your party without anyone knowing who others got.

### To use:

On Mac OSX, run `/usr/sbin/sendmail` on local port 25 (default).

Replace the data array in `run.rb` with your group's names and emails.

```
bundle install
ruby run.rb
```

Run tests:

`rspec assigner_spec` (does not actually send emails)
