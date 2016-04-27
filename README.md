# Working with Dates and Times

## Summary
Working with dates and times can be tricky—particularly when we have to rely on user input.  Why would that be tricky?  Think about entering a date in a form field.  How many formats could the same date take?  "April 15, 1980", "15/04/1980", "4-15-80", etc.  Now imagine entering a date and time together.  How many different forms could that take?  "04-15-1980 2:00 PM", "April 15, 1980 14:00", etc.

There are tons of ways that humans represent dates.  Unfortunately, Ruby doesn't understand all of them.  We're going to look at representations of dates and times that Ruby understands and explore some options for getting user input for dates in one of these forms.


## Releases
### Release 0:  String Formats that Ruby Can Parse
We've been supplied with a CRUD app with one-resource: an `Event` model with a `datetime` attribute named `starts_at`.  Users will create events by submitting a form, so we'll be working with dates and times entered by users.  This means that the dates and times that users enter must be formatted in a way that Ruby can parse.

So, in what format must a string be for Ruby to parse it to a date and time?  One format is *[ISO 8601][]*, an international standard for representing dates and times.  There's also *JIS X 0301*, *RFC 2822*, *RFC 3339*, etc.  In other words, probably nothing that our users will enter on their own.

We won't create an exhaustive list, but let's explore a few formats to see how Ruby handles them.  Open the `rake console` and try to assign an event a starting date and time using each of the strings in Table 1.  Some will parse correctly and some won't.  See Figure 1 for a couple examples; notice that when a string doesn't parse properly, the attribute's value is set to `nil`.  Guess which formats will work before using them.  What happens if the string leaves out elements live the time zone, seconds, etc.?

```ruby
event = Event.new
# => #<Event id: nil, name: nil, location: nil, starts_at: nil, created_at: nil, updated_at: nil> 
event.starts_at
# => nil
event.starts_at = "Wed, 27 Apr 2016 17:42:41 -0500"
# => "Wed, 27 Apr 2016 17:42:41 -0500"
event.starts_at
# => 2016-04-27 22:42:41 UTC
event.starts_at = "Wed, 27 04 2016 17:42:41 -0500"
# => "Wed, 27 04 2016 17:42:41 -0500" 
event.starts_at
# => nil 
```
*Figure 1*. Assigning an `Event` a starting data and time using a string.


| Ruby String                         | Format     |
| :---------------------------------- | :---       |
| `"2016-04-28T15:32:44+00:00"`       | ISO 8601   |
| `"H14.02.03T04:05:06+00:00"`        | JIS X 0301 |
| `"Thu, 5 May 2016 04:05:06+00:00"`  | RFC 2822   |
| `"2016-04-30T04:05:06+00:00"`       | RFC 3339   |
| `"20131101T040506+0700"`            |            |
| `"16th Oct 2016 12:12:12"`          |            |
| `"15:20:45 Nov 19th 2016"`          |            |
| `"30-06-1984 17:50:00"`             |            |
| `"06-30-1984 17:50:00"`             |            |
| `"2002/04/30 20:00"`                |            |
| `"2002-04-30 14:00"`                |            |
| `"2012/10/30 16"`                   |            |
| `"2015-12-31 08:15 PM"`             |            |
*Table 1*.  Date and time formatted strings.


[ISO 8601]: https://en.wikipedia.org/wiki/ISO_8601
