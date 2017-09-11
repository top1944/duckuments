# Advanced duckuments guide

## Linking to IDs

Up to now, if there was a section called

    ## My section

then it would be assigned the ID "my-section".

This behavior has been removed, for several reasons.

One is that if you don't see the ID then you will be tempted to just change the name:

    ## My better section

and silently the ID will be changed to "my-better-section" and all the previous links will be invalidated.

The current behavior is to generate an ugly link like "autoid-209u31j".

This will make it clear that you cannot link using the PURL if you don't assign an ID.


Also, I would like to clarify that all IDs are *global* (so it's easy to link stuff, without thinking about namespaces, etc.).

Therefore, please choose descriptive IDs, with at least two IDs.

E.g. if you make a section called

    ## Localization  {#localization}

that's certainly a no-no, because "localization" is too generic.

Better:

    ## Localization {#intro-localization}

Also note that you don't *need* to add IDs to everything, only the things that people could link to. (e.g. not subsubsections)
