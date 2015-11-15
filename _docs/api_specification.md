---
layout: page
title: API Specification

category: proposal
status: draft
---

'''THIS IS A DRAFT'''

Web2project is a full project management system that allows for a well-informed user to accomplish things ranging from simple time logging to complex inter-project dependency management. Currently all of the functionality of the Web2project system is contained and only accessible through the web interface provided. The goal of this project is to allow access to all of the Web2project system via a RESTful interface while enforcing all the rules and dependencies that are enforced in the web interface.

== Considerations ==

==== REST/Hypermedia ====

*  The API SHOULD be semantically correct with respect to the http methods:
**  The GET method MUST return a list of resources or selected resource;
**  The POST method MUST create a resource;
**  The PUT method MUST update a specified resource using the entire resource;
**  The DELETE method MUST delete a specified resource;
**  The PATCH method SHOULD update only the specified fields of a specified resource;
**  The GET, PUT, DELETE, and PATCH methods MUST be idempotent;
*  The API MUST use the proper http response codes for each request;
*  The API SHOULD support hypermedia concepts of self-descriptive messages & errors;
*  The API SHOULD be traversable starting from the root.

==== Data/Format ====

*  The API MUST provide resources in a JSON format;
*  The API MAY provide resources in other formats such as XML;
*  The API SHOULD respect the Accepts header to determine which data structure to return;
*  The API SHOULD support versioning;
**  The API MAY support versioning via the Url request;
**  The API MAY support versioning via the Accepts header.

==== Web2project-specific ====

*  The API MUST support authentication;
*  The API MUST provide access to all core web2project modules such as Companies, Projects, Users, etc;
*  The API SHOULD provide access to all Add On modules which follow our [[Naming Conventions]];
*  The API MUST respect web2project's internal [http://en.wikipedia.org/wiki/Access_control_list Access Control List and Roles] for user access and permissions;
*  The API SHOULD return all date/timestamps in the authenticated user's specified timezone;
*  The API MAY return all date/timestamps in UTC/GMT as a default.

== Additional Information ==

There are two potential implementations underway from [https://github.com/trevormorse/web2project-api Trevor Morse] and [https://github.com/caseysoftware/web2project-slim Keith Casey] using [http://getfrapi.com FRAPI] and [http://www.slimframework.com/ Slim Framework] respectively.


'''THIS IS A DRAFT'''