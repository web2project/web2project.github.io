---
layout: page
title: Module Building Guide

---

The goal of this section is to document a clear, repeatable way for developers to create modules to supplement and enhance the operation of the web2project system. There are numerous code samples included because showing is often more important than explaining. As certain non-core functionality becomes standardized, some of it will be added to the core system itself. This will not only simplify Add On development but also make sure that all modules adhere to the same standards and logic flows.

Failure to follow the recommendations in this section will lead to poor modules, brittle code, security vulnerabilities, and even bad hair days. None of these are pleasant.

## Expectations

*  All input MUST be filtered before it is used in *any* capacity to help prevent security vulnerabilities such as [SQL injection](http://en.wikipedia.org/wiki/SQL_injection) and [Cross Site Scripting](http://en.wikipedia.org/wiki/Cross-site_scripting) attacks.
*  A module MUST NOT have include or construct raw SQL statements.
*  A module MUST NOT have references to the w2p_Database_Query class/object outside of the module's core class and (optional) subclasses.
*  A module SHOULD use core web2project function/method/API calls instead of copy/pasting logic into your own module.
*  A module SHOULD adhere to our [Naming Conventions](/docs/naming-conventions.html) for variables, methods, etc.
*  All code within a module SHOULD adhere to the formatting specified by the [PSR-4 Coding Standard](http://www.php-fig.org/psr/psr-4/). To evaluate your own code, please use [Code Sniffer](http://pear.php.net/package/PHP_CodeSniffer/).

## Table of Contents

{% assign items = site.docs | where:"category","module building guide" %}

{% include dual-columns.md %}


{% include section-hooks.md %}