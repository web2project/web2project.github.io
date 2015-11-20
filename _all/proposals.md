---
layout: page
title: All Proposals

status: draft
---

For reference, all key words such as MUST, SHOULD, etc are used as defined in [RFC 2119](http://tools.ietf.org/html/rfc2119). The key terms which we are concerned about are as follows:

* **MUST** This word, or the terms "REQUIRED" or "SHALL", mean that the definition is an *absolute requirement* of the specification.
* **MUST NOT** This phrase, or the phrase "SHALL NOT", mean that the definition is an *absolute prohibition* of the specification.
* **SHOULD** This word, or the adjective "RECOMMENDED", mean that there may exist valid reasons in particular circumstances to ignore a particular item, but the full implications must be understood and carefully weighed before choosing a different course.
* **SHOULD NOT** This phrase, or the phrase "NOT RECOMMENDED" mean that there may exist valid reasons in particular circumstances when the particular behavior is acceptable or even useful, but the full implications should be understood and the case carefully weighed before implementing any behavior described with this label.
* **MAY** This word, or the adjective "OPTIONAL", mean that an item is truly optional.  One vendor may choose to include the item because a particular marketplace requires it or because the vendor feels that it enhances the product while another vendor may omit the same item. An implementation which does not include a particular option MUST be prepared to interoperate with another implementation which does include the option, though perhaps with reduced functionality. In the same vein an implementation which does include a particular option MUST be prepared to interoperate with another implementation which does not include the option (except, of course, for the feature the option provides.)

{% assign items = site.docs | where:"status","draft" %}

{% include dual-columns.md %}