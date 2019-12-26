---
layout: module
title: Calendar Module

category: core-module

module_name: Calendar
module_path: calendar
module_creator: dotProject
module_devs: web2project
module_version: 3.3
module_source: https://github.com/web2project/web2project
module_download: http://github.com/web2project/web2project/archive/master.zip
---

## Module Overview

One of the most useful things of any collaboration system is a single shared Calendar for all users. This is useful for coordinating schedules, reviewing priorities, and even determining individual availability. Web2project offers this basic functionality and quite a bit more combining the Events, Tasks, and offering a variety of filtered display options.

The Calendar module provides the users with interfaces to manage the [Tasks](/modules/tasks.html) and Events in a chronological way. Further, this module gives you the ability to view and filter Events according to Project or Company in addition to displaying by Day, Week, Month, and Year.

### Basic Display

The base view of the Calendar Module is a simple month view similar to Outlook or Google Calendar. It always defaults to the current month displaying all of the Users’ Tasks and Events. This view is filtered according to two aspects: Company and Ownership. At any time, a User can change the Company filter from any one to all of them. This gives a quick review on a per-customer basis with no additional effort. The Ownership filter allows a User to change their view based on All Events, Events I Created, and My Events. By changing the combination of these two aspects, Users can look at the information from a variety of angles and determine a great deal about most projects.

I> In many cases, even filtering Events and Tasks by Company will still display too much information to be useful. Therefore, you can also filter by a specific Project.

D> To make life simpler for all involved, it is currently planned to implement iCal output for any active Web2project user. This will provide a simple way to monitor a calendar from within a third–party application such as Google Calendar, Apple iCalendar, or Outlook.

From the Month View, a user can click on the button on the far left of any line. This will take the User to a Week View based on the selected Company. It breaks down the week into a simple layout similar to a weekly planner. The Ownership filter is still available but in order to change the Company, the User must go back to the Month view.

### Creating an Event / Recurring Events

Creating an Event in Web2project can be done at anytime from anywhere in the system by selecting “New Event” in the upper right hand corner. You simply name the event, give a brief description, select the relevant project, invite members, at set the recurrence schedule. If you set a recurring event, Web2project will automatically add it to all invitee’s calendars and email a notification immediately.

Q> Although every Event can be attached to a Project, there is no Events tab on the View Project screen. It will likely be developed in Head and released as a patch at a later date.

<a href="/assets/docs/events/addedit.png"><img src="/assets/docs/events/thumb-addedit.png" /></a>

With this form you will be able to create or edit Events. You can invite other users to those events and make sure they get notified by email about those Events.

Events can be associated with projects, task, meetings, or anything else relative to your daily workflow. You can access the add/edit events page from the Day View.

How-to use this page:

* Enter a name or title for the event.
* Define the type of event.
  * Note: This can be modified under the System Administration > System Look-up values to meet your needs
* Associate this event to a project
* Determine whether or not this is a private entry
* Set start and finish date
  * Note: These will determine how it displays on the calendar view
* You can recur this event to repeat weekly ect...
* Assign internal resources
  * Note: To assign internal resources, click to highlight the name then select the arrow icon located under the box.
* Type a description
* Specify a time
  * This will replicate to the day view timeline
* On the bottom of the page you have the option to send an email to the resources notifying them of the event.

### Viewing all Events 

#### View Today's Events (Today's Tasks Todo)

<a href="/assets/docs/events/today_events.png"><img src="/assets/docs/events/thumb-today_events.png" /></a>

This tab will show the user the Events marked for the given date depending on the existing filters.

#### View a Specific Day's Events (Day View Page)

<a href="/assets/docs/events/view_day.png"><img src="/assets/docs/events/thumb-view_day.png" /></a>

On this interface the user will be able to see what is going on, on a given date as well as the Tasks and Events set for that date considering the available filters.
You will find two tabs, one with the Tasks to be done on that date and another with the Events set for that date.

The day view is probably one of the most detailed views in the calendar. By default it will list events you have scheduled for that day in 15 minute time intervals.

From this page you can:

* View all your events for the day
* Access the Task-Today panel
* Schedule a new event by clicking on the "new event" tab located on the upper right.
* Set a company filter
* Move forward and backwards in time for the day, week or month

Clicking on a day within any of the calendars on the right hand side will take you to the day view for that month.

#### View Week (Week View Page)

<a href="/assets/docs/events/view_week.png"><img src="/assets/docs/events/thumb-view_week.png" /></a>

The Week View page gives a week perspective of the Tasks and Events set for a given Week.

One area identified by some companies as a standard best practice is to view your task and events that are active for the week. In addition, if you are a designer and you wish to collaborate with another designer on a project in the system, you can use this view to see what their schedule looks like before including them as a resource.

From this page you can:

* Switch to month view
* Click on a day and switch to day view
* View the weekly calendar for a company
* Change Event Filter
  * All Events
  * Your events (This includes events assigned to you that you may not have created)
  * Events you created.
* You can also move forward and backwards in weeks.

#### View Month (Month View Page)

<a href="/assets/docs/events/view_month.png"><img src="/assets/docs/events/thumb-view_month.png" /></a>

The Monthly view shows the user which Tasks and/or Events are scheduled for each day in the Month.

Generally when you create an event or task in the system, this will create links within the calendar dynamically showing you the start and finish dates within that month. Each link in the calendar is dynamic, so you can click on it and it will take you to the details of that object. This is particularly useful when you want a snap shot view of what’s on the agenda for the entire month.

Depending on how the administrator has the system configured, you can use filters to view calendar details for other [Departments](/modules/departments.html) or [Users](/modules/users.html), in addition to your own.

From this page you can:

* Click on a task or event and view details
* Change to Week View by clicking on the box icon on the left
* Go forward and backwards in month views
* Switch to year view by clicking on the "year view calendar
* Set company filters
* Set Event Filters.

There are effectively two ways to move forward and backwards in time.

* Click the arrow icons at the top of the calendar (Located on the right and left site top)
* On the bottom of the page you'll see the previous and next month quick links.

#### View Years (Year View Page)

<a href="/assets/docs/events/view_year.png"><img src="/assets/docs/events/thumb-view_year.png" /></a>

The Yearly view gives the user an overall view of the Year calendar and color codes the days depending on the existence of Tasks and/or Events.

It's not uncommon to have events or task that last more than a calendar month. In addition you may want to be able to recall what your schedule looked like for the year. The year view gives you the option to view your intire schedule for the year.

From the Year View you can:

* Move forward and backwards in time to next or previous year
* Click on any given month to switch to that month
* Set [Company](/modules/companies.html) Filters
* Set Event Filters
* Switch to week view by clicking on the week icon in each month displayed.