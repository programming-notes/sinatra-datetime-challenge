# Working with Dates and Times

## Summary
Working with dates and times can be tricky—particularly when we have to rely on user input.  Why would that be tricky?  Think about entering a date in a form field.  How many formats could the same date take?  "April 15, 1980", "15/04/1980", "4-15-80", etc.  Now imagine entering a date and time together.  How many different forms could that take?  "04-15-1980 2:00 PM", "April 15, 1980 14:00", etc.

There are tons of ways that humans represent dates.  Unfortunately, Ruby doesn't understand all of them.  In fact, it only understands a couple of them.

We're going to look at representations of dates and times that Ruby understands and explore some options for getting user input for dates in a form.