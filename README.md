### Secret Santa Assignment Sender

This application randomizes Secret Santa assignments and emails everyone in your party without anyone knowing who others got.

I wrote this because I wanted to organise a Secret Santa gift exchange, with the following requirements:

1. No "central organiser" should know about the assignments
1. No using online software that would potentially save emails and send spam later

### To use:

On Mac OSX, run `/usr/sbin/sendmail` on local port 25 (default). You need Ruby 2.* installed.

Replace the data array in `run.rb` with your group's names and emails.

```
bundle install
ruby run.rb
```

To do a test run, `DRY_RUN=true ruby run.rb`

To save the output (and spoil the fun), `SAVE_OUTPUT=true ruby run.rb`

Run tests:

`rspec assigner_spec` (does not actually send emails)
