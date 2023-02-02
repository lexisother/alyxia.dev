---
id: 'skills-heroes-1'
title: 'Skills Heroes Round 1'
date: '2022-11-24T00:00:00'
---

This post is about my participation in the national [Skills Heroes](https://worldskillsnetherlands.nl/skillsheroes/) championship. It's a competition for students in the Dutch [MBO](https://en.wikipedia.org/wiki/Education_in_the_Netherlands#MBO) education.

## Round 1

Our first round was rather simple. We were tasked to write a CRUD API for some students who are building a web application to fetch data about teachers.
Aside from building the API, we also had to write documentation about setting it up, and how to use it.
Finally, were provided with nothing but an Excel spreadsheet (which you can simply convert to SQL statements when saving the spreadsheet as CSV) to populate our database with, and from that point on we were on our own.

### The participants

The participants of this round were the third-year students. They were forced to attend the competition. Second-year students were invited to participate but were not forced to attend. I chose to attend because I figured it'd be a nice way to get my head off of things.

### The code

For this API, I used a simplified version of the MVC design pattern, namely stripping out the "view" part. I have models and controllers, the models are only used to query the database using [illuminate/database](https://github.com/illuminate/database) (which also handles schema creation for me), and the controllers are called by [illuminate/routing](https://github.com/illuminate/routing).
Aside from [vlucas/phpdotenv](https://github.com/vlucas/phpdotenv), I used no other libraries.
My result is available [here](https://github.com/lexisother/skills-heroes-1). It honestly isn't that much code, the actual API functionality is all contained in `App\Controllers\TeacherController`.

### The rating

As for the rating of my project, I got all points but for two of them. In my focused session of writing documentation for setting up the damn project, I completely forgot the actual API docs. So that was two points less than the maximum, sadly. However, despite that, I still scored first place. 🏆
