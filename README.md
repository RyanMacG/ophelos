# README

To run me:

```bash
```bash
bundle install
bundle exec rails db:create db:migrate db:test:prepare
bin/dev
```

Things I'm not happy with/would change with more time:

- Can currently only add one expense at a time. Would like to be able to add multiple expenses at once.
  - This is a limitation of me going with the basic out of the box nested form stimulus and not having enough time to either make it work nicely or multistage the form. I've got ideas on how to do this but trying to stick to the suggested time investment.
- More tests around the controllers and certainly at least a happy path feature test.
  - I thought I was being smart and gaining myself some time with using the standard rails testing framework but I really hit up against trying to use capybara with it. Should have just gone with RSpec on reflection.
- Actually show errors and flash messages, currently just redirecting back to the form.
- Some more polish on the UI, it's pretty basic.
