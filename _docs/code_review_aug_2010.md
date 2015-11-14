---
layout: page
title: Code Review - Aug 2010
---

Okay, keeping the principles in mind, here are some things that annoy me about dotProject and its interface:

1. It takes too much effort to establish a project, create tasks, and carry out common functions.  Creating a task currently requires filling out information on multiple separate tabs; it isn't clear what fields are required, so I often had to fill out the form multiple times; and filling out the form requires mouse clicks and keyboard activity, a bad combination.  Project templates are something of a help to this, but not much, really, since every task in a project requires some basic modification after instantiation.

2. There's no interface in dotProject to deal with invoicing customers for work performed, and the database doesn't support proper controls here.  Each task log needs a field to track the date it was entered, the date it was invoiced, and the modification date, if any.  Task logs should be read-only if they have been invoiced.  Invoices to my clients are typically done at the project level, or are done by project and project worker - so a report that groups pending task logs at those levels is required.  I also need some kind of exception reporting to note who is entering time late (in my organization, time is to be entered within 24 hours of it being worked).

3. Another critical reporting function should allow my workers to generate an invoice.  In our organization, contractors invoice us monthly for work, and I really need those invoices grouped at the client level.  No report exists to facilitate this.

4. The dependency system, while it works (more or less), is confusing.  Why would I identify dependencies if I don't want the system to also track them?

5. The interface generally feels clunky.  Some items are hard to read, others take up too much screen real estate, switching from page to page or tab to tab sometimes takes too long.  The default color scheme is soul-sucking.  On the administration end, adding or changing pick-list values is just a bizarre process.  The rendered code isn't always compliant to the doctype and so doesn't always parse/render properly.  The pop-up descriptions that show up when hovering over parts of the to-do list view sometimes extend beyond the visible screen region, making them unreadable and causing scroll bars to show up unexpectedly.  Certain features just aren't grouped logically.

Bonus #6: dotProject is slow, at least on the server I had it running on.  It would sometimes take 2-3 seconds from form submission to first byte of response.  My new system is generally sub-second response, with most delays attributable to my local machine rather than the server or network.  This isn't because the database is smaller -- if anything it's a bit larger; I migrated my dotProject data for historical purposes, and have expanded the data model in some areas to track additional data.  I'm sure this has quite a lot to do with the relative degrees of complexity.  My code just doesn't have as many rabbit holes to even think about going down before returning data to the user.  Then again, I think a more formalized MVC architecture lends itself toward faster response for these kinds of systems, so that may help, and I've been diligent about indexing on my new system.  I could never get performance data out of dotProject, so I could never optimize for it.

For any task, I need to track: what it is, when it's due, what the budget is, who will perform it, and the project it's a part of.  I don't care about anything else.  I might want to (someday) track dependencies again, but that matters a lot less when I'm managing 20 very small projects instead of 1 or 2 big, complicated ones.  Due dates are a surprisingly good substitute for dependency tracking in about 90% of projects I manage.  I'd drop the entire idea of putting more than one person on a task.  If you can't articulate what a specific person is responsible for, you haven't gotten to the task level yet.  I also don't bother with parent/child tasks, or "dynamic" tasks; I used to, but it was just confusing for the project workers to report their time properly.

[[Category:Code Reviews]]
